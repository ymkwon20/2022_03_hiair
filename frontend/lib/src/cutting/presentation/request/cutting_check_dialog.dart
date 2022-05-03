import 'package:flutter/material.dart';
import 'package:frontend/src/cutting/application/check/save/cutting_check_save_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/constants/layout_constant.dart';
import 'package:frontend/src/core/widgets/underline_widget.dart';
import 'package:frontend/src/cutting/application/check/save/cutting_check_save_event.dart';
import 'package:frontend/src/cutting/dependency_injection.dart';
import 'package:frontend/src/cutting/presentation/request/cutting_check_list_widget.dart';
import 'package:frontend/src/cutting/presentation/request/view_models/cutting_check_result_notifier.dart';
import 'package:frontend/src/cutting/presentation/serial/cutting_serials_page.dart';

class CuttingCheckDialog extends ConsumerStatefulWidget {
  const CuttingCheckDialog({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CuttingCheckDialogState();
}

class _CuttingCheckDialogState extends ConsumerState {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen<CuttingCheckSaveState>(
      cuttingCheckSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          saved: () {
            Navigator.of(context).pop();
          },
          orElse: () {},
        );
      },
    );

    final standard = ref.watch(standardCuttingCheck);
    final actual = ref.watch(cuttingCheckResultNotifier);

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(0),
        content: Container(
          width: 900,
          height: 500,
          padding: const EdgeInsets.all(LayoutConstant.paddingL),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
            color: Theme.of(context).cardColor,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  _buildRow(
                    title: "",
                    standard: "기준정보",
                    value: "Check",
                  ),
                  UnderlineWidget(color: Theme.of(context).shadowColor),
                  _EditRow(
                    title: "두께",
                    standard: "${standard.thickness}",
                    inputType: TextInputType.number,
                    value: ref
                        .watch(cuttingCheckResultNotifier)
                        .thickness
                        .toString(),
                    onSubmit: (value) =>
                        ref.read(cuttingCheckResultNotifier.notifier).editState(
                              actual.copyWith(
                                thickness: double.tryParse(value),
                              ),
                            ),
                  ),
                  _EditRow(
                    title: "가로",
                    standard: "${standard.width}",
                    inputType: TextInputType.number,
                    value:
                        ref.watch(cuttingCheckResultNotifier).width.toString(),
                    onSubmit: (value) =>
                        ref.read(cuttingCheckResultNotifier.notifier).editState(
                              actual.copyWith(
                                width: double.tryParse(value),
                              ),
                            ),
                  ),
                  _EditRow(
                    title: "세로",
                    standard: "${standard.height}",
                    inputType: TextInputType.number,
                    value:
                        ref.watch(cuttingCheckResultNotifier).height.toString(),
                    onSubmit: (value) =>
                        ref.read(cuttingCheckResultNotifier.notifier).editState(
                              actual.copyWith(
                                height: double.tryParse(value),
                              ),
                            ),
                  ),
                  _EditRow(
                    title: "대각",
                    standard: "",
                    inputType: TextInputType.number,
                    value:
                        ref.watch(cuttingCheckResultNotifier).angle.toString(),
                    onSubmit: (value) =>
                        ref.read(cuttingCheckResultNotifier.notifier).editState(
                              actual.copyWith(
                                angle: double.tryParse(value),
                              ),
                            ),
                  ),
                  _EditRow(
                    title: "장비명",
                    standard: "없음",
                    value: ref.watch(cuttingCheckResultNotifier).equipCd,
                    onSubmit: (value) =>
                        ref.read(cuttingCheckResultNotifier.notifier).editState(
                              actual.copyWith(workId: value),
                            ),
                  ),
                  _EditRow(
                    title: "원재료 LOT",
                    standard: "없음",
                    value: ref.watch(cuttingCheckResultNotifier).lot,
                    onSubmit: (value) =>
                        ref.read(cuttingCheckResultNotifier.notifier).editState(
                              actual.copyWith(lot: value),
                            ),
                  ),
                  _EditRow(
                    title: "비고",
                    standard: "",
                    value: ref.watch(cuttingCheckResultNotifier).remark,
                    onSubmit: (value) =>
                        ref.read(cuttingCheckResultNotifier.notifier).editState(
                              actual.copyWith(remark: value),
                            ),
                  ),
                  _EditRow(
                    title: "작업자",
                    standard: "",
                    value: ref.watch(cuttingCheckResultNotifier).userId,
                    onSubmit: (value) =>
                        ref.read(cuttingCheckResultNotifier.notifier).editState(
                              actual.copyWith(userId: value),
                            ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate() == true) {
                        ref
                            .read(
                                cuttingCheckSaveStateNotifierProvider.notifier)
                            .mapEventToState(
                              CuttingCheckSaveEvent.save(
                                ref.watch(cuttingSerialProvider),
                                standard,
                                ref.watch(cuttingCheckResultNotifier),
                              ),
                            );
                      }
                    },
                    child: const Text("확인"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow({
    required String title,
    required String standard,
    required String value,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(title),
        ),
        Expanded(
          child: Text(
            standard,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _EditRow extends ConsumerStatefulWidget {
  const _EditRow({
    Key? key,
    required this.title,
    required this.standard,
    required this.value,
    this.inputType,
    required this.onSubmit,
  }) : super(key: key);

  final String title;
  final String standard;
  final String value;
  final TextInputType? inputType;
  final ValueChanged<String> onSubmit;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __EditRowState();
}

class __EditRowState extends ConsumerState<_EditRow> {
  late FocusNode itemFocusNode;
  late FocusNode textFieldFocusNode;
  late TextEditingController textEditingController;
  late ValueNotifier<bool> isFocused;

  @override
  void initState() {
    super.initState();
    isFocused = ValueNotifier(false);
    itemFocusNode = FocusNode()..addListener(listenFocusNode);
    textFieldFocusNode = FocusNode();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    itemFocusNode.removeListener(listenFocusNode);
    itemFocusNode.dispose();
    textFieldFocusNode.dispose();
    textEditingController.dispose();
    isFocused.dispose();
    super.dispose();
  }

  String? formValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "값을 입력하지 않았습니다";
    } else {
      return null;
    }
  }

  void listenFocusNode() {
    isFocused.value = itemFocusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: itemFocusNode,
      onFocusChange: (focused) {
        if (focused) {
          // textEditingController.text = widget.value;

        } else {
          // commit changes only when the textfield is unfocused, for performance
          setState(() {
            widget.onSubmit.call(textEditingController.text);
          });
        }
      },
      child: GestureDetector(
        onTap: () {
          itemFocusNode.requestFocus();
          textFieldFocusNode.requestFocus();
        },
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(widget.title),
              ),
              Expanded(
                child: Text(
                  widget.standard,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Expanded(
                flex: 2,
                child: ValueListenableBuilder<bool>(
                  valueListenable: isFocused,
                  builder: (context, focus, child) {
                    return Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: LayoutConstant.paddingM),
                      margin: const EdgeInsets.symmetric(
                        vertical: LayoutConstant.paddingS,
                        horizontal: LayoutConstant.paddingM,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(LayoutConstant.radiusM),
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        autofocus: true,
                        validator: formValidator,
                        focusNode: textFieldFocusNode,
                        controller: textEditingController,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.all(0),
                        ),
                        keyboardType: widget.inputType,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
