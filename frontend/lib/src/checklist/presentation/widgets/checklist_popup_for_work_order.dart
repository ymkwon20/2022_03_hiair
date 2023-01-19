import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_event.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/viewmodels/checklist_notifier.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_widget.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/underline_widget.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:frontend/src/workorder/presentation/screens/work_order_finish_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChecklistPopupWorkOrder extends ConsumerWidget {
  const ChecklistPopupWorkOrder({
    Key? key,
    required this.workOrder,
    required this.index,
    required this.saveFlag,
  }) : super(key: key);

  final WorkOrder workOrder;
  final int index;
  final bool saveFlag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width / 2.5;
    // final workOrder = ref.watch(workOrderNotifier);
    bool openFlash = false;

    ref.listen<ChecklistSaveState>(
      checklistSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          saved: () {
            // showFlashBar(
            //   context,
            //   title: "저장 완료",
            //   content: "",
            //   backgroundColor: Theme.of(context).primaryColorLight,
            // );
            // Navigator.of(context).pop();
          },
          savedAndNext: (status) {
            // showFlashBar(
            //   context,
            //   title: "저장 완료",
            //   content: "",
            //   backgroundColor: Theme.of(context).primaryColorLight,
            // );
            // Navigator.of(context).pop();
          },
          failure: (message) {
            showFlashBar(
              context,
              title: "오류",
              content: "입력을 완료하지 않았습니다.",
              backgroundColor: Theme.of(context).errorColor,
            );
          },
          orElse: () {},
        );
      },
    );

    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              ref.read(checklistNotifierProvider.notifier).clear();
              Navigator.of(context).pop();
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 471,
            child: SafeArea(
              child: Container(
                width: 400,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(LayoutConstant.radiusL),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2, -1),
                      blurRadius: LayoutConstant.radiusXS,
                      color: Theme.of(context).shadowColor.withOpacity(.7),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(LayoutConstant.paddingL),
                  width: width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: LayoutConstant.spaceM),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "상세내용",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: LayoutConstant.spaceM),
                      _WorkOrderDrawerRow(title: "작업지시", value: workOrder.code),
                      const UnderlineWidget(),
                      _WorkOrderDrawerRow(title: "PND", value: workOrder.date),
                      const UnderlineWidget(),
                      _WorkOrderDrawerRow(title: "Yard", value: workOrder.yard),
                      const UnderlineWidget(),
                      _WorkOrderDrawerRow(
                          title: "Hull No", value: workOrder.hullNo),
                      const UnderlineWidget(),
                      _WorkOrderDrawerRow(title: "구역", value: workOrder.ship),
                      const UnderlineWidget(),
                      _WorkOrderDrawerRow(
                          title: "Sys No", value: workOrder.sysNo),
                      const UnderlineWidget(),
                      _WorkOrderDrawerRow(title: "품번", value: workOrder.itemNo),
                      const UnderlineWidget(),
                      _WorkOrderDrawerRow(
                          title: "수량", value: "${workOrder.qty}"),
                      const Spacer(),
                      WorkOrderFinishButtons(
                        dateStart: workOrder.dateStart,
                        dateEnd: workOrder.dateEnd,
                        onFinishPressed: () {
                          Navigator.of(context).pop();

                          if (saveFlag) {
                            ref
                                .read(
                                    workOrderSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  WorkOrderSaveEvent.saveWorkOrder(
                                    workOrder,
                                    WorkOrderSaveStatus.all,
                                    index,
                                  ),
                                );
                          } else {
                            ref
                                .read(
                                    workOrderSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  WorkOrderSaveEvent.saveWorkOrder(
                                    workOrder,
                                    WorkOrderSaveStatus.end,
                                    index,
                                  ),
                                );
                          }

                          ref
                              .read(checklistSaveStateNotifierProvider.notifier)
                              .mapEventToState(
                                ChecklistSaveEvent.saveChecklist(
                                    ref.watch(checklistNotifierProvider).items),
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(LayoutConstant.radiusM),
                      bottomLeft: Radius.circular(LayoutConstant.radiusM),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: LayoutConstant.paddingS,
                          horizontal: LayoutConstant.paddingL,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          // child: ElevatedButton(
                          //   onPressed: () {
                          //     if (ref
                          //         .watch(checklistNotifierProvider.notifier)
                          //         .isNotCompleted) {
                          //       if (!openFlash) {
                          //         openFlash = true;
                          //         showFlashBar(
                          //           context,
                          //           title: "오류",
                          //           content: "입력을 완료하지 않았습니다.",
                          //           backgroundColor:
                          //               Theme.of(context).errorColor,
                          //         );
                          //         Future.delayed(const Duration(seconds: 2),
                          //             () => openFlash = false);
                          //       }
                          //     } else {
                          //       ref
                          //           .read(checklistSaveStateNotifierProvider
                          //               .notifier)
                          //           .mapEventToState(
                          //             ChecklistSaveEvent.saveChecklist(ref
                          //                 .watch(checklistNotifierProvider)
                          //                 .items),
                          //           );
                          //     }
                          //   },
                          //   child: const Text(
                          //     "저장",
                          //   ),
                          // ),
                        ),
                      ),
                      const Expanded(child: ChecklistWidget()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkOrderDrawerRow extends StatelessWidget {
  const _WorkOrderDrawerRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LayoutConstant.paddingM,
        vertical: LayoutConstant.paddingXS,
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
