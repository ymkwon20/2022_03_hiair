import 'package:flutter/material.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/work_order_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/presentation/fonts.gen.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';

/// 시작 완료 버튼
class WorkOrderStartEndButtons extends ConsumerStatefulWidget {
  const WorkOrderStartEndButtons({
    Key? key,
    required this.dateStart,
    required this.dateEnd,
    required this.onStartPressed,
    required this.onEndPressed,
    required this.onSavePressed,
    required this.onStartAndEndPressed,
    required this.onStartAndSavePressed,
    this.ignoring = false,
  }) : super(key: key);

  final String dateStart;
  final String dateEnd;

  final VoidCallback onStartPressed;
  final VoidCallback onEndPressed;
  final VoidCallback onSavePressed;
  final VoidCallback? onStartAndEndPressed;
  final VoidCallback? onStartAndSavePressed;

  final bool ignoring;

  @override
  ConsumerState<WorkOrderStartEndButtons> createState() =>
      _WorkerStartEndButtonsState();
}

class _WorkerStartEndButtonsState
    extends ConsumerState<WorkOrderStartEndButtons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const _duration = 600;
  static const _opacityTiming = 0.2;

  static final _opacityTween =
      CurveTween(curve: const Interval(0, _opacityTiming, curve: Curves.ease));
  static final _widthTween =
      CurveTween(curve: const Interval(0, 1, curve: Curves.ease));

  late Animation<double> _leftWidthAnimation;
  late Animation<double> _rightWidthAnimation;
  late Animation<double> _leftOpacityAnimation;
  late Animation<double> _rightOpacityAnimation;
  late Animation<double> _topOpacityAnimation;
  late Animation<double> _bottomOpacityAnimation;

  /// 전체 크기 계산
  double width = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _duration),
    );

    _leftWidthAnimation = _widthTween.animate(_controller);
    _rightWidthAnimation = _widthTween.animate(_controller);
    _leftOpacityAnimation = _opacityTween.animate(_controller);
    _rightOpacityAnimation = _opacityTween.animate(_controller);
    _topOpacityAnimation = ConstantTween(1.0).animate(_controller);
    _bottomOpacityAnimation = ConstantTween(1.0).animate(_controller);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _setSize();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get isStartActive => widget.dateStart.isEmpty;
  bool get isEndActive => widget.dateEnd.isEmpty;
  bool get isChecklistActivate => getChecklistActivateStatus();

  bool getChecklistActivateStatus() {
    final workOrder = ref.watch(workOrderNotifier);

    if (workOrder.chkDiv == "Y") {
      return true;
    } else {
      return false;
    }
  }

  bool workBaseNameCheck() {
    final workOrder = ref.watch(workOrderNotifier);
    final workBaseProvider = ref.watch(workBaseChangeNotifierProvider);

    if (workBaseProvider.workBase?.legChk == "Y") {
      return true;
    } else {
      if (workOrder.wbNm == workBaseProvider.workBase?.wbName) {
        return true;
      } else {
        return false;
      }
    }
  }

  void _setSize() {
    setState(() {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      width = renderBox.size.width;
      if (isStartActive) {
        _leftWidthAnimation = Tween<double>(begin: width / 2, end: width)
            .chain(_widthTween)
            .animate(_controller);
        _rightWidthAnimation = Tween<double>(begin: width / 2, end: 0)
            .chain(_widthTween)
            .animate(_controller);
        _leftOpacityAnimation = Tween<double>(begin: 1, end: 1)
            .chain(_widthTween)
            .animate(_controller);
        _rightOpacityAnimation = Tween<double>(begin: 1, end: 0)
            .chain(_widthTween)
            .animate(_controller);
      } else {
        _leftWidthAnimation = Tween<double>(begin: width / 2, end: 0)
            .chain(_widthTween)
            .animate(_controller);
        _rightWidthAnimation = Tween<double>(begin: width / 2, end: width)
            .chain(_widthTween)
            .animate(_controller);
        _leftOpacityAnimation = Tween<double>(begin: 1, end: 0)
            .chain(_widthTween)
            .animate(_controller);
        _rightOpacityAnimation = Tween<double>(begin: 1, end: 1)
            .chain(_widthTween)
            .animate(_controller);
      }
    });
  }

  void _onTap(VoidCallback function) {
    _topOpacityAnimation =
        Tween<double>(begin: 1, end: 1).chain(_widthTween).animate(_controller);
    _bottomOpacityAnimation =
        Tween<double>(begin: 1, end: 0).chain(_widthTween).animate(_controller);

    _controller.forward();
    Future.delayed(
      Duration(milliseconds: (_duration * (_opacityTiming + 0.2)).toInt()),
      function,
    );
  }

  void _onTapBoth(VoidCallback function) {
    _topOpacityAnimation =
        Tween<double>(begin: 1, end: 0).chain(_widthTween).animate(_controller);
    _bottomOpacityAnimation =
        Tween<double>(begin: 1, end: 1).chain(_widthTween).animate(_controller);

    _leftWidthAnimation = Tween<double>(begin: width / 2, end: width / 2)
        .chain(_widthTween)
        .animate(_controller);
    _rightWidthAnimation = Tween<double>(begin: width / 2, end: width / 2)
        .chain(_widthTween)
        .animate(_controller);

    _controller.forward();
    Future.delayed(
      Duration(milliseconds: (_duration * (_opacityTiming + 0.2)).toInt()),
      function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeTransition(
              opacity: _topOpacityAnimation,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildDrawerButton(
                    controller: _controller,
                    width: _leftWidthAnimation.value,
                    opacity: _leftOpacityAnimation,
                    category: "시작일",
                    value: widget.dateStart,
                    name: "시작",
                    backgroundColor: ThemeConstant.dominantColor,
                    active: isStartActive && workBaseNameCheck(),
                    ignoring: widget.ignoring,
                    onTap: () => _onTap(widget.onStartPressed),
                  ),
                  if (isChecklistActivate)
                    _buildDrawerButton(
                      controller: _controller,
                      width: _rightWidthAnimation.value,
                      opacity: _rightOpacityAnimation,
                      category: "완료일",
                      value: widget.dateEnd,
                      name: "완료",
                      backgroundColor: ThemeConstant.dominantColor,
                      active:
                          !isStartActive && isEndActive && workBaseNameCheck(),
                      ignoring: widget.ignoring,
                      onTap: () => _onTap(widget.onEndPressed),
                    )
                  else
                    _buildDrawerButton(
                      controller: _controller,
                      width: _rightWidthAnimation.value,
                      opacity: _rightOpacityAnimation,
                      category: "완료일",
                      value: widget.dateEnd,
                      name: "완료",
                      backgroundColor: ThemeConstant.dominantColor,
                      active:
                          !isStartActive && isEndActive && workBaseNameCheck(),
                      ignoring: widget.ignoring,
                      onTap: () => _onTap(widget.onSavePressed),
                    ),
                ],
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            if (widget.onStartAndEndPressed != null)
              if (isChecklistActivate)
                FadeTransition(
                  opacity: _bottomOpacityAnimation,
                  child: _buildButton(
                    name: "시작/완료",
                    controller: _controller,
                    ignoring: widget.ignoring,
                    active: isStartActive && workBaseNameCheck(),
                    onTap: () => _onTapBoth(widget.onStartAndEndPressed!),
                    backgroundColor: ThemeConstant.dominantColor,
                  ),
                )
              else
                FadeTransition(
                  opacity: _bottomOpacityAnimation,
                  child: _buildButton(
                    name: "시작/완료",
                    controller: _controller,
                    ignoring: widget.ignoring,
                    active: isStartActive && workBaseNameCheck(),
                    onTap: () => _onTapBoth(widget.onStartAndSavePressed!),
                    backgroundColor: ThemeConstant.dominantColor,
                  ),
                ),
            // const SizedBox(height: LayoutConstant.spaceM),
            // FadeTransition(
            //   opacity: _topOpacityAnimation,
            //   child: _buildButton(
            //       active: isChecklistActivate && workBaseNameCheck(),
            //       backgroundColor: ThemeConstant.dominantColor,
            //       controller: _controller,
            //       ignoring: widget.ignoring,
            //       name: '체크리스트',
            //       onTap: () {
            //         final workOrder = ref.watch(workOrderNotifier);
            //         ref
            //             .read(checklistStateNotifierProvider.notifier)
            //             .mapEventToState(
            //               ChecklistEvent.fetchChecklistForWorkOrder(workOrder),
            //             );

            //         Navigator.of(context).push(
            //           CustomSlideRoute(
            //             backgroundColor: Colors.black.withOpacity(.2),
            //             builder: (context) => ChecklistPopupWorkOrder2(
            //               workOrder: workOrder,
            //               index: ref.watch(workOrderIndexNotifier)!,
            //             ),
            //           ),
            //         );
            //       }),
            // ),
          ],
        );
      },
    );
  }

  Widget _buildDrawerButton({
    required double width,
    required String category,
    required String value,
    required String name,
    required Animation<double> opacity,
    required AnimationController controller,
    required bool ignoring,
    bool active = true,
    VoidCallback? onTap,
    Color backgroundColor = Colors.grey,
  }) {
    return FadeTransition(
      opacity: opacity,
      child: Container(
        width: width,
        padding:
            const EdgeInsets.symmetric(horizontal: LayoutConstant.paddingS),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              category,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            Text(
              value.isNotEmpty ? value : "없음",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                    value.isNotEmpty ? FontWeight.w400 : FontWeight.w200,
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            _buildButton(
              name: name,
              controller: controller,
              ignoring: ignoring,
              active: active,
              backgroundColor: backgroundColor,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String name,
    required AnimationController controller,
    required bool ignoring,
    required bool active,
    required VoidCallback? onTap,
    required Color backgroundColor,
  }) {
    final saveStatus = ref.watch(workOrderSaveStateNotifierProvider);
    return IgnorePointer(
      ignoring: ignoring || controller.isAnimating,
      child: InkWell(
        onTap: active ? onTap : null,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: LayoutConstant.paddingM,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? backgroundColor : Theme.of(context).disabledColor,
            borderRadius: BorderRadius.circular(LayoutConstant.radiusS),
          ),
          // CircularProgressIndicator등 다른 자식 Widget에 의해
          // 높이가 변경되어 바뀔수 있으므로 SizedBox에 height 처리
          child: SizedBox(
            height: LayoutConstant.spaceXL,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: saveStatus.maybeWhen(
                none: () {
                  return Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: FontFamily.iropke,
                    ),
                  );
                },
                saving: () {
                  // CircularProgressIndicator의 크기 조절이 불가능하여
                  // SizedBox안에 처리
                  return const SizedBox(
                    height: LayoutConstant.spaceL,
                    width: LayoutConstant.spaceL,
                    child: CircularProgressIndicator(
                      strokeWidth: LayoutConstant.spaceXS,
                      color: Colors.white,
                    ),
                  );
                },
                oneSaved: (index, date, status) {
                  return const Icon(
                    Icons.check,
                    color: Colors.white,
                  );
                },
                failure: (message) {
                  return const Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                },
                orElse: () {
                  return const Icon(
                    Icons.check,
                    color: Colors.white,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
