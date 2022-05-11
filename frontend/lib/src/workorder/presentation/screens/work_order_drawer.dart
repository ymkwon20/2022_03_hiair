import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/application/load/checklist_event.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_event.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/viewmodel/checklist_notifier.dart';

import 'package:frontend/src/checklist/presentation/widgets/checklist_widget.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/underline_widget.dart';
import 'package:frontend/src/workorder/application/save/work_order_save_state.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:frontend/src/workorder/presentation/screens/work_order_start_end_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 작업지시 시작, 완료하는 drawer
class WorkOrderDrawer extends ConsumerStatefulWidget {
  const WorkOrderDrawer({
    Key? key,
    required this.drawerController,
    required this.workOrder,
    required this.onStartPressed,
    required this.onClose,
  }) : super(key: key);

  final AnimationController drawerController;
  final WorkOrder? workOrder;
  final VoidCallback onStartPressed;
  final VoidCallback onClose;

  @override
  ConsumerState<WorkOrderDrawer> createState() => _WorkOrderDrawerState();
}

class _WorkOrderDrawerState extends ConsumerState<WorkOrderDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _detailScreenSizeController;

  static final _opacityTween = CurveTween(curve: Curves.easeInQuart);
  static final _slideTween = CurveTween(curve: Curves.ease);

  /// 밀어서 닫기 위한 x point
  // double? _firstDragX;

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
    ref.read(checklistNotifierProvider.notifier).clear();

    widget.onClose.call();
  }

  void _onEndPressed() {
    if (!_openCheckList) {
      ref.read(checklistStateNotifierProvider.notifier).mapEventToState(
            ChecklistEvent.fetchChecklist(widget.workOrder!),
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
        ChecklistSaveEvent.saveChecklist(
            ref.watch(checklistNotifierProvider).items));
  }

  // void _onPanUpdate(DragUpdateDetails details) {
  //   if (_firstDragX == null) {
  //     _firstDragX = details.globalPosition.dx;
  //     return;
  //   }

  //   final dragProgress = (_firstDragX! - details.globalPosition.dx) /
  //       MediaQuery.of(context).size.width;

  //   widget.drawerController.value += dragProgress / 2;
  // }

  // void _onPanEnd(DragEndDetails details) {
  //   _firstDragX = null;

  //   if (widget.drawerController.value < 0.5) {
  //     _closeDrawer();
  //   } else {
  //     widget.drawerController.forward();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ref.listen<ChecklistSaveState>(checklistSaveStateNotifierProvider,
        (previous, current) {
      current.maybeWhen(
        saved: _closeDrawer,
        orElse: () {},
      );
    });

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackground(),
          AnimatedBuilder(
            animation: widget.drawerController,
            builder: (context, child) {
              final width = MediaQuery.of(context).size.width / 3;
              return Positioned(
                top: LayoutConstant.spaceXS,
                bottom: LayoutConstant.spaceXS,
                right:
                    (_slideTween.animate(widget.drawerController).value - 1) *
                        width,
                child: Container(
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
                  child: widget.drawerController.value > 0
                      ? Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.all(LayoutConstant.paddingL),
                              width: width,
                              child: child,
                            ),
                            ChecklistWidget(
                              widthController: _detailScreenSizeController,
                            ),
                          ],
                        )
                      : const SizedBox(),
                ),
              );
            },
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
                    title: "작업지시", value: widget.workOrder?.code ?? ""),
                const UnderlineWidget(),
                _WorkOrderDrawerRow(
                    title: "PND", value: widget.workOrder?.datePlanned ?? ""),
                const UnderlineWidget(),
                _WorkOrderDrawerRow(
                    title: "Yard", value: widget.workOrder?.yard ?? ""),
                const UnderlineWidget(),
                _WorkOrderDrawerRow(
                    title: "Hull No", value: widget.workOrder?.hullNo ?? ""),
                const UnderlineWidget(),
                _WorkOrderDrawerRow(
                    title: "구역", value: widget.workOrder?.ship ?? ""),
                const UnderlineWidget(),
                _WorkOrderDrawerRow(
                    title: "Sys No", value: widget.workOrder?.sysNo ?? ""),
                const UnderlineWidget(),
                _WorkOrderDrawerRow(
                    title: "품번", value: widget.workOrder?.itemNo ?? ""),
                const UnderlineWidget(),
                _WorkOrderDrawerRow(
                    title: "수량", value: "${widget.workOrder?.qty ?? ''}"),
                const Spacer(),
                WorkOrderStartEndButtons(
                  dateStart: widget.workOrder?.dateStart ?? "",
                  dateEnd: widget.workOrder?.dateEnd ?? "",
                  onStartPressed: widget.onStartPressed.call,
                  onEndPressed: _onEndPressed,
                  ignoring: ref.watch(workOrderSaveStateNotifierProvider) ==
                          const WorkOrderSaveState.saving() ||
                      ref.watch(checklistSaveStateNotifierProvider) ==
                          const ChecklistSaveState.saving(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return AnimatedBuilder(
      animation: widget.drawerController,
      builder: (context, child) {
        return widget.drawerController.value > 0
            ? FadeTransition(
                opacity: _opacityTween.animate(widget.drawerController),
                child: GestureDetector(
                  onTap: _closeDrawer,
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor.withOpacity(.2),
                    ),
                  ),
                ),
              )
            : const SizedBox();
      },
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
