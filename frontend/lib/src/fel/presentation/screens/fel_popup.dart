import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/application/load/checklist_event.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_popup_for_work_order.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:frontend/src/fwp/presentation/screens/rmk_update_popup.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_state.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/presentation/screens/work_order_start_end_button.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/work_order_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FELPopup extends ConsumerWidget {
  const FELPopup({
    Key? key,
    required this.canSaveBothStartAndEnd,
  }) : super(key: key);

  final bool canSaveBothStartAndEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width / 2;
    final workOrder = ref.watch(workOrderNotifier);
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
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
              right: 0,
              child: SafeArea(
                child: Container(
                  width: width,
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
                        _WorkOrderDrawerRow(
                            title: "Yard", value: workOrder.yard),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "Hull No", value: workOrder.hullNo),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(title: "구역", value: workOrder.ship),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "Sys No", value: workOrder.sysNo),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "제품규격", value: workOrder.itemSpec),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(title: "비고", value: workOrder.rmk),
                        const UnderlineWidget(),
                        Container(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                CustomSlideRoute(
                                  backgroundColor: Colors.black.withOpacity(.2),
                                  builder: (context) => ProviderScope(
                                    // overrides: [],
                                    child: RMKUpdatePopup(
                                      code: "FWP",
                                      wonb: workOrder.code,
                                      planSeq: workOrder.planSeq.toString(),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "리마크 수정",
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 77, 165, 247)),
                          ),
                        ),
                        const Spacer(),
                        WorkOrderStartEndButtons(
                          dateStart: workOrder.dateStart,
                          dateEnd: workOrder.dateEnd,
                          onStartPressed: () {
                            Navigator.of(context).pop();
                            ref
                                .read(
                                    workOrderSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  WorkOrderSaveEvent.saveWorkOrder(
                                    workOrder,
                                    WorkOrderSaveStatus.start,
                                    ref.watch(workOrderIndexNotifier)!,
                                  ),
                                );
                          },
                          onEndPressed: () {
                            Navigator.of(context).pop();
                            final workOrder = ref.watch(workOrderNotifier);
                            ref
                                .read(checklistStateNotifierProvider.notifier)
                                .mapEventToState(
                                  ChecklistEvent.fetchChecklistForWorkOrder(
                                      workOrder),
                                );

                            Navigator.of(context).push(
                              CustomSlideRoute(
                                backgroundColor: Colors.black.withOpacity(.2),
                                builder: (context) => ChecklistPopupWorkOrder(
                                  workOrder: workOrder,
                                  index: ref.watch(workOrderIndexNotifier)!,
                                  saveFlag: false,
                                ),
                              ),
                            );
                          },
                          onSavePressed: () {
                            Navigator.of(context).pop();

                            ref
                                .read(
                                    workOrderSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  WorkOrderSaveEvent.saveWorkOrder(
                                    workOrder,
                                    WorkOrderSaveStatus.end,
                                    ref.watch(workOrderIndexNotifier)!,
                                  ),
                                );
                          },
                          onStartAndEndPressed: () {
                            Navigator.of(context).pop();
                            final workOrder = ref.watch(workOrderNotifier);
                            ref
                                .read(checklistStateNotifierProvider.notifier)
                                .mapEventToState(
                                  ChecklistEvent.fetchChecklistForWorkOrder(
                                      workOrder),
                                );

                            Navigator.of(context).push(
                              CustomSlideRoute(
                                backgroundColor: Colors.black.withOpacity(.2),
                                builder: (context) => ChecklistPopupWorkOrder(
                                  workOrder: workOrder,
                                  index: ref.watch(workOrderIndexNotifier)!,
                                  saveFlag: true,
                                ),
                              ),
                            );
                          },
                          onStartAndSavePressed: () {
                            Navigator.of(context).pop();
                            ref
                                .read(
                                    workOrderSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  WorkOrderSaveEvent.saveWorkOrder(
                                    workOrder,
                                    WorkOrderSaveStatus.all,
                                    ref.watch(workOrderIndexNotifier)!,
                                  ),
                                );
                          },
                          ignoring:
                              ref.watch(workOrderSaveStateNotifierProvider) ==
                                  const WorkOrderSaveState.saving(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
