import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:frontend/src/safety/application/repair/save/safety_repair_save_event.dart';
import 'package:frontend/src/safety/application/repair/save/safety_repair_save_state.dart';
import 'package:frontend/src/safety/dependency_injection.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:frontend/src/core/presentation/widgets/home_app_bar.dart';
import 'package:frontend/src/safety/domain/entities/repair_info.dart';
import 'package:intl/intl.dart';

late AutoDisposeStateProvider<RepairInfo> currentRepairInfo;

class SafetyRepairScreen extends ConsumerStatefulWidget {
  const SafetyRepairScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SafetyRepairScreen> createState() => _SafetyRepairScreenState();
}

class _SafetyRepairScreenState extends ConsumerState<SafetyRepairScreen> {
  bool get validateRepairInfo {
    if (ref.watch(currentRepairInfo).record.replaceAll(" ", "") == "") {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SafetyRepairSaveState>(
      safetyRepairSaveStateNotifierProvider,
      ((previous, current) {
        current.maybeWhen(
          saved: () {
            context.pop();
            showFlashBar(
              context,
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );
          },
          failure: (message) {
            showFlashBar(
              context,
              title: "저장 오류",
              content: message,
              backgroundColor: Theme.of(context).errorColor,
            );
          },
          orElse: () {},
        );
      }),
    );

    return Scaffold(
      appBar: const HomeAppBar(title: "수리 이력 등록"),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstant.paddingL,
            vertical: LayoutConstant.paddingXL,
          ),
          child: ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (validateRepairInfo) {
                          ref
                              .read(safetyRepairSaveStateNotifierProvider
                                  .notifier)
                              .mapEventToState(
                                SafetyRepairSaveEvent.saveSafetyRepair(
                                    ref.watch(currentRepairInfo)),
                              );
                        } else {
                          showFlashBar(
                            context,
                            title: "미입력",
                            content: "수리내역을 입력하지 않았습니다",
                            backgroundColor: Theme.of(context).errorColor,
                          );
                        }
                      },
                      child: const Text(
                        "저장",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: LayoutConstant.spaceM),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(LayoutConstant.radiusS),
                      border: Border.all(width: LayoutConstant.spaceXS / 2),
                    ),
                    child: Column(
                      children: [
                        _buildHeader(title: "항목", value: "입력"),
                        _buildDatePickerRow(
                          title: "수리일자",
                          date: ref.watch(currentRepairInfo).date,
                          onPicked: (value) =>
                              ref.watch(currentRepairInfo.notifier).state =
                                  ref.watch(currentRepairInfo).copyWith(
                                        date: value,
                                      ),
                        ),
                        _buildRow(
                          title: "장소",
                          value: ref.watch(currentRepairInfo).location,
                          onComplete: (value) =>
                              ref.watch(currentRepairInfo.notifier).state =
                                  ref.watch(currentRepairInfo).copyWith(
                                        location: value,
                                      ),
                        ),
                        _buildRow(
                          title: "수리내역",
                          value: ref.watch(currentRepairInfo).record,
                          onComplete: (value) =>
                              ref.watch(currentRepairInfo.notifier).state =
                                  ref.watch(currentRepairInfo).copyWith(
                                        record: value,
                                      ),
                        ),
                        _buildRow(
                          title: "수리 검교정기관",
                          value: ref.watch(currentRepairInfo).repairedBy,
                          onComplete: (value) =>
                              ref.watch(currentRepairInfo.notifier).state =
                                  ref.watch(currentRepairInfo).copyWith(
                                        repairedBy: value,
                                      ),
                        ),
                        _buildRow(
                          title: "수리금액",
                          value: ref.watch(currentRepairInfo).cost.toString(),
                          isNum: true,
                          onComplete: (value) =>
                              ref.watch(currentRepairInfo.notifier).state =
                                  ref.watch(currentRepairInfo).copyWith(
                                        cost: double.parse(value),
                                      ),
                        ),
                        _buildRow(
                          title: "비고",
                          value: ref.watch(currentRepairInfo).remark,
                          onComplete: (value) =>
                              ref.watch(currentRepairInfo.notifier).state =
                                  ref.watch(currentRepairInfo).copyWith(
                                        remark: value,
                                      ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader({
    required String title,
    required String value,
  }) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: LayoutConstant.paddingS),
      decoration: BoxDecoration(
        border: Border.all(width: LayoutConstant.spaceXS / 2),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            width: LayoutConstant.spaceXS,
            height: 55,
            color: Colors.black,
            margin:
                const EdgeInsets.symmetric(horizontal: LayoutConstant.paddingS),
          ),
          Expanded(
              flex: 2,
              child: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildRow({
    required String title,
    required String value,
    required ValueChanged<String> onComplete,
    bool isNum = false,
  }) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: LayoutConstant.paddingS),
      decoration: BoxDecoration(
        border: Border.all(width: LayoutConstant.spaceXS / 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            width: LayoutConstant.spaceXS,
            height: 55,
            color: Colors.black,
            margin:
                const EdgeInsets.symmetric(horizontal: LayoutConstant.paddingS),
          ),
          Expanded(
            flex: 2,
            child: RepairInput(
              value: value,
              isNum: isNum,
              onComplete: onComplete,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePickerRow({
    required String title,
    required String date,
    required void Function(String) onPicked,
  }) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: LayoutConstant.paddingS),
      decoration: BoxDecoration(
        border: Border.all(width: LayoutConstant.spaceXS / 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            width: LayoutConstant.spaceXS,
            margin:
                const EdgeInsets.symmetric(horizontal: LayoutConstant.paddingS),
            height: 55,
            color: Colors.black,
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                );

                if (pickedDate != null) {
                  onPicked.call(DateFormat("yyyy-MM-dd").format(pickedDate));
                }
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(LayoutConstant.radiusM),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    padding: const EdgeInsets.all(LayoutConstant.paddingM),
                    child: Text(
                      date,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RepairInput extends StatefulWidget {
  const RepairInput({
    Key? key,
    required this.value,
    required this.isNum,
    required this.onComplete,
  }) : super(key: key);

  final String value;
  final bool isNum;
  final ValueChanged<String> onComplete;

  @override
  State<RepairInput> createState() => _RepairInputState();
}

class _RepairInputState extends State<RepairInput> {
  late TextEditingController _controller;

  bool isInitial = true;

  @override
  void initState() {
    super.initState();
    var text = widget.value;
    if (widget.isNum) {
      text = (int.tryParse(widget.value) ?? 0).toString();
    }
    _controller = TextEditingController(text: text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (isInitial && hasFocus) {
          _controller.text = "";
          isInitial = false;
        }
      },
      child: TextField(
        controller: _controller,
        keyboardType: widget.isNum ? TextInputType.number : TextInputType.text,
        textInputAction: TextInputAction.done,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          isDense: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(LayoutConstant.radiusS),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              LayoutConstant.radiusS,
            ),
          ),
        ),
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
          widget.onComplete.call(_controller.text);
        },
      ),
    );
  }
}
