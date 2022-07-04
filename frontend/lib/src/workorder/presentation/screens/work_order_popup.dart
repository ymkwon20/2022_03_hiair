import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/application/load/checklist_event.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_event.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/viewmodels/checklist_notifier.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_widget.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/underline_widget.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/presentation/screens/work_order_start_end_button.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/work_order_list_notifier.dart';

/// 작업지시 시작, 완료하는 drawer
class WorkOrderPopup extends ConsumerStatefulWidget {
  const WorkOrderPopup({
    Key? key,
    required this.canSaveBothStartAndEnd,
  }) : super(key: key);

  final bool canSaveBothStartAndEnd;

  @override
  ConsumerState<WorkOrderPopup> createState() => _WorkOrderPopupState();
}

class _WorkOrderPopupState extends ConsumerState<WorkOrderPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _detailScreenSizeController;

  /// 상황에 따라 다른 완료 버튼 사용을 위한 파라미터
  bool _openCheckList = false;

  bool openFlash = false;

  @override
  void initState() {
    super.initState();
    _detailScreenSizeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _detailScreenSizeController.dispose();

    super.dispose();
  }

  void _closeDrawer() {
    _openCheckList = false;
    _detailScreenSizeController.reverse();

    ref
        .read(checklistStateNotifierProvider.notifier)
        .mapEventToState(const ChecklistEvent.clear());

    ref
        .read(workOrderSaveStateNotifierProvider.notifier)
        .mapEventToState(const WorkOrderSaveEvent.resetToNone());

    Navigator.of(context).pop();
  }

  void _onEndPressed(WorkOrderSaveStatus status) {
    if (!_openCheckList) {
      ref.read(checklistStateNotifierProvider.notifier).mapEventToState(
            ChecklistEvent.fetchChecklist(ref.watch(workOrderNotifier), ""),
          );
      _detailScreenSizeController.forward();
      _openCheckList = true;
      return;
    }

    if (ref.read(checklistNotifierProvider.notifier).isNotCompleted) {
      if (!openFlash) {
        openFlash = true;
        showFlashBar(
          context,
          title: "오류",
          content: "입력을 완료하지 않았습니다.",
          backgroundColor: Theme.of(context).errorColor,
        );
        Future.delayed(const Duration(seconds: 2), () => openFlash = false);
      }

      return;
    }

    ref.read(checklistSaveStateNotifierProvider.notifier).mapEventToState(
        ChecklistSaveEvent.saveChecklistAndMore(
            ref.watch(checklistNotifierProvider).items, status));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<WorkOrderSaveState>(
      workOrderSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          oneSaved: (index, date, status) {
            _closeDrawer();
          },
          multipleSaved: (indice, date, status) {
            _closeDrawer();
          },
          failure: (message) {
            _closeDrawer();
          },
          orElse: () {
            ref.read(workOrderListNotifier.notifier).clearSelection();
          },
        );
      },
    );

    ref.listen<ChecklistSaveState>(
      checklistSaveStateNotifierProvider,
      (previous, current) {
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
            Navigator.of(context).pop();
          },
          savedAndNext: (status) {
            Navigator.of(context).pop();
            ref
                .read(workOrderSaveStateNotifierProvider.notifier)
                .mapEventToState(
                  WorkOrderSaveEvent.saveWorkOrder(
                    ref.watch(workOrderNotifier),
                    status,
                    ref.watch(workOrderIndexNotifier),
                  ),
                );
          },
          failure: (message) {
            Navigator.of(context).pop();
            _closeDrawer();
            showFlashBar(
              context,
              title: "저장 오류",
              content: message,
              backgroundColor: Theme.of(context).errorColor,
            );
          },
          orElse: () {},
        );
      },
    );

    final width = MediaQuery.of(context).size.width / 2.5;
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
                _closeDrawer();
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
              child: AnimatedBuilder(
                animation: _detailScreenSizeController,
                builder: (context, child) {
                  return SafeArea(
                    child: Container(
                        width: width +
                            width *
                                CurveTween(curve: Curves.ease)
                                    .animate(_detailScreenSizeController)
                                    .value,
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
                              color:
                                  Theme.of(context).shadowColor.withOpacity(.7),
                            ),
                          ],
                        ),
                        child: child),
                  );
                },
                child: Row(
                  children: [
                    Container(
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
                              title: "작업지시", value: workOrder.code),
                          const UnderlineWidget(),
                          _WorkOrderDrawerRow(
                              title: "PND", value: workOrder.date),
                          const UnderlineWidget(),
                          _WorkOrderDrawerRow(
                              title: "Yard", value: workOrder.yard),
                          const UnderlineWidget(),
                          _WorkOrderDrawerRow(
                              title: "Hull No", value: workOrder.hullNo),
                          const UnderlineWidget(),
                          _WorkOrderDrawerRow(
                              title: "구역", value: workOrder.ship),
                          const UnderlineWidget(),
                          _WorkOrderDrawerRow(
                              title: "Sys No", value: workOrder.sysNo),
                          const UnderlineWidget(),
                          _WorkOrderDrawerRow(
                              title: "품번", value: workOrder.itemNo),
                          const UnderlineWidget(),
                          _WorkOrderDrawerRow(
                              title: "수량", value: "${workOrder.qty}"),
                          const Spacer(),
                          WorkOrderStartEndButtons(
                            dateStart: workOrder.dateStart,
                            dateEnd: workOrder.dateEnd,
                            onStartPressed: () {
                              ref
                                  .read(workOrderSaveStateNotifierProvider
                                      .notifier)
                                  .mapEventToState(
                                    WorkOrderSaveEvent.saveWorkOrder(
                                      workOrder,
                                      WorkOrderSaveStatus.start,
                                      ref.watch(workOrderIndexNotifier)!,
                                    ),
                                  );
                            },
                            onEndPressed: () =>
                                _onEndPressed(WorkOrderSaveStatus.end),
                            onStartAndEndPressed: widget.canSaveBothStartAndEnd
                                ? () => _onEndPressed(WorkOrderSaveStatus.all)
                                : null,
                            ignoring: ref.watch(
                                        workOrderSaveStateNotifierProvider) ==
                                    const WorkOrderSaveState.saving() ||
                                ref.watch(checklistSaveStateNotifierProvider) ==
                                    const ChecklistSaveState.saving(),
                          ),
                        ],
                      ),
                    ),
                    ChecklistPage(
                      widthController: _detailScreenSizeController,
                    ),
                  ],
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
