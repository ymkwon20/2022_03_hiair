import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:frontend/src/core/presentation/pages/table_failure_row.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/home_app_bar.dart';
import 'package:frontend/src/safety/application/check/fetch/safety_check_event.dart';
import 'package:frontend/src/safety/application/check/fetch/safety_check_state.dart';
import 'package:frontend/src/safety/application/check/save/safety_check_save_event.dart';
import 'package:frontend/src/safety/application/check/save/safety_check_save_state.dart';
import 'package:frontend/src/safety/dependency_injection.dart';
import 'package:frontend/src/safety/domain/entities/repair_info.dart';
import 'package:frontend/src/safety/presentation/screens/safety_repair_screen.dart';
import 'package:frontend/src/safety/presentation/screens/safety_screen.dart';
import 'package:frontend/src/safety/presentation/screens/tablerows/safety_check_loaded_row.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/core/presentation/widgets/table_loading_row.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class SafetyCheckScreen extends ConsumerStatefulWidget {
  const SafetyCheckScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SafetyCheckScreen> createState() => _SafetyCheckScreenState();
}

class _SafetyCheckScreenState extends ConsumerState<SafetyCheckScreen> {
  String _date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(safetyCheckStateNotifierProvider);

    final safetyInfo = ref.watch(currentSafetyInfo);

    ref.listen<SafetyCheckState>(safetyCheckStateNotifierProvider,
        (previous, current) {
      current.maybeWhen(
        loaded: (items) {
          ref.watch(safetyCheckNotifierProvider).setItems(items);
        },
        orElse: () {},
      );
    });

    ref.listen<SafetyCheckSaveState>(safetyCheckSaveStateNotifierProvider,
        ((previous, current) {
      current.maybeWhen(
        saving: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const SavingDialog();
            },
          );
        },
        saved: () {
          Navigator.pop(context);
          Navigator.pop(context);
          showFlashBar(
            context,
            title: "저장 완료",
            content: "",
            backgroundColor: Theme.of(context).primaryColorLight,
          );
        },
        failure: (message) {
          Navigator.pop(context);
          showFlashBar(
            context,
            title: "저장 오류",
            content: message,
            backgroundColor: Theme.of(context).errorColor,
          );
        },
        orElse: () {},
      );
    }));

    return Scaffold(
      appBar: HomeAppBar(title: safetyInfo.equipNm),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: LayoutConstant.paddingL),
                child: Row(
                  children: [
                    const Text(
                      "점검 일자:",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: LayoutConstant.spaceM),
                    InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateFormat("yyyy-MM-dd").parse(_date),
                          firstDate: DateFormat("yyyy-MM-dd")
                              .parse(_date)
                              .subtract(const Duration(days: 365)),
                          lastDate: DateFormat("yyyy-MM-dd")
                              .parse(_date)
                              .add(const Duration(days: 365)),
                        ).then((value) {
                          if (value != null) {
                            // setState(() {
                            //   _date = DateFormat("yyyy-MM-dd").format(value);
                            // });
                            _date = DateFormat("yyyy-MM-dd").format(value);
                            ref
                                .read(safetyCheckStateNotifierProvider.notifier)
                                .mapEventToState(
                                  SafetyCheckEvent.fetchSafetyChecks(
                                    ref.watch(currentSafetyInfo).equipCd,
                                    ref.watch(safetyInfoNotifierProvider).code,
                                    _date,
                                  ),
                                );
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: LayoutConstant.paddingL,
                          vertical: LayoutConstant.paddingM,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(LayoutConstant.radiusM),
                          color: Theme.of(context).primaryColorLight,
                        ),
                        child: Text(
                          _date,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        ref
                                .watch(safetyCheckNotifierProvider)
                                .items
                                .any((element) => element.edited)
                            ? Theme.of(context).primaryColorLight
                            : Colors.grey,
                      ),
                    ),
                    onPressed: ref
                            .watch(safetyCheckNotifierProvider)
                            .items
                            .any((element) => element.edited)
                        ? ref.read(safetyCheckNotifierProvider.notifier).reset
                        : null,
                    child: const Text(
                      "초기화",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: LayoutConstant.spaceS),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      currentRepairInfo = StateProvider.autoDispose(
                        (ref) => RepairInfo.initial(
                          ref.watch(currentSafetyInfo).equipCd,
                        ),
                      );

                      context.push("/safety/repair");
                    },
                    child: const Text(
                      "수리 이력 등록",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: LayoutConstant.spaceS),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        ref
                                .watch(safetyCheckNotifierProvider)
                                .items
                                .any((element) => element.edited)
                            ? Theme.of(context).primaryColorDark
                            : Colors.grey,
                      ),
                    ),
                    onPressed: ref
                            .watch(safetyCheckNotifierProvider)
                            .items
                            .any((element) => element.edited)
                        ? () => ref
                            .read(safetyCheckSaveStateNotifierProvider.notifier)
                            .mapEventToState(
                              SafetyCheckSaveEvent.saveChecks(_date),
                            )
                        : null,
                    child: const Text(
                      "저장",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: LayoutConstant.spaceM),
                ],
              ),
            ],
          ),
          Expanded(
            child: CustomTable(
              /// onCellTap이 활성화 되있어서 먹히지 않음
              onRowPressed: (_) {},
              onRowLongPressed: (index) {
                showDialog<String>(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return const CheckAlterResultDialog();
                  },
                ).then(
                  (value) => value != null
                      ? ref
                          .read(safetyCheckNotifierProvider)
                          .setData(index, value)
                      : null,
                );
              },
              onRefresh: () async {
                await ref
                    .read(safetyCheckStateNotifierProvider.notifier)
                    .mapEventToState(
                      SafetyCheckEvent.fetchSafetyChecks(
                        ref.watch(currentSafetyInfo).equipCd,
                        ref.watch(safetyInfoNotifierProvider).code,
                        _date,
                      ),
                    );
              },
              headers: [
                CustomTableHeader(
                  name: "checkNm",
                  title: "점검 개소명",
                  onTap: ref.read(safetyCheckNotifierProvider.notifier).sort,
                  onLongTap: () {},
                  children: _buildAdditionalIcons("checkNm"),
                ),
                CustomTableHeader(
                  name: "checkStandardNm",
                  title: "점검 기준코드명",
                  onTap: ref.read(safetyCheckNotifierProvider.notifier).sort,
                  onLongTap: () {},
                  children: _buildAdditionalIcons("checkStandardNm"),
                ),
                CustomTableHeader(
                  name: "checkCycle",
                  title: "점검 주기",
                  width: 200,
                  onTap: ref.read(safetyCheckNotifierProvider.notifier).sort,
                  onLongTap: () {},
                  children: _buildAdditionalIcons("checkCycle"),
                ),
                CustomTableHeader(
                  name: "data",
                  title: "점검 결과",
                  onTap: ref.read(safetyCheckNotifierProvider.notifier).sort,
                  onLongTap: () {},
                  children: _buildAdditionalIcons("data"),
                ),
                CustomTableHeader(
                  name: "remark",
                  title: "비고",
                  width: 300,
                  onTap: ref.read(safetyCheckNotifierProvider.notifier).sort,
                  onLongTap: () {},
                  children: _buildAdditionalIcons("remark"),
                ),
              ],
              rowBuilder: (context, index) {
                return state.when(
                  init: () {
                    return TableLoadingRow();
                  },
                  loading: () {
                    return TableLoadingRow();
                  },
                  loaded: (_) {
                    return SafetyCheckLoadedRow(
                        color: _getColor(index),
                        check:
                            ref.watch(safetyCheckNotifierProvider).items[index],
                        onCellTap: (cellIndex) {
                          if (cellIndex == 4) {
                            showDialog<String>(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return RemarkDialog(
                                  remark: ref
                                      .watch(safetyCheckNotifierProvider)
                                      .items[index]
                                      .remark,
                                );
                              },
                            ).then(
                              (value) => value != null
                                  ? ref
                                      .read(safetyCheckNotifierProvider)
                                      .setRemark(index, value)
                                  : null,
                            );
                          } else {
                            ref
                                .read(safetyCheckNotifierProvider.notifier)
                                .setData(index, "●");
                          }
                        });
                  },
                  failure: (message) {
                    return TableFailureRow(message: message);
                  },
                );
              },
              rowCount: state.when(
                init: () => 0,
                loading: () => 200,
                loaded: (current) => current.length,
                failure: (_) => 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAdditionalIcons(String key) {
    final children = <Widget>[];

    // sort icon
    if (ref.watch(safetyCheckNotifierProvider).sortedColumn[key] == null) {
    } else if (ref.watch(safetyCheckNotifierProvider).sortedColumn[key]!) {
      children.add(const Icon(Icons.arrow_upward));
    } else {
      children.add(const Icon(Icons.arrow_downward));
    }

    // filter icon
    if (ref.watch(safetyCheckNotifierProvider).filterMap[key] != null) {
      children.add(const Icon(Icons.filter_alt));
    }

    return children;
  }

  Color _getColor(int index) {
    Color color;
    final notifier = ref.watch(safetyCheckNotifierProvider);

    if (notifier.items[index].edited) {
      color = Theme.of(context).primaryColorLight;
    } else {
      color = Colors.transparent;
    }

    return color;
  }
}
