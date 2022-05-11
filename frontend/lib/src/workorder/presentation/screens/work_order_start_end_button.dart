import 'package:flutter/material.dart';
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
    this.ignoring = false,
  }) : super(key: key);

  final String dateStart;
  final String dateEnd;

  final VoidCallback onStartPressed;
  final VoidCallback onEndPressed;

  final bool ignoring;

  @override
  ConsumerState<WorkOrderStartEndButtons> createState() =>
      _QmStartEndButtonsState();
}

class _QmStartEndButtonsState extends ConsumerState<WorkOrderStartEndButtons>
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
        return Row(
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
              backgroundColor: ThemeConstant.accentColor,
              active: isStartActive,
              ignoring: widget.ignoring,
              onTap: () => _onTap(widget.onStartPressed),
            ),
            _buildDrawerButton(
              controller: _controller,
              width: _rightWidthAnimation.value,
              opacity: _rightOpacityAnimation,
              category: "완료일",
              value: widget.dateEnd,
              name: "완료",
              backgroundColor: ThemeConstant.dominantColor,
              active: !isStartActive && isEndActive,
              ignoring: widget.ignoring,
              onTap: () => _onTap(widget.onEndPressed),
            ),
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
    final saveStatus = ref.watch(workOrderSaveStateNotifierProvider);

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
                fontSize: 17,
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            Text(
              value.isNotEmpty ? value : "없음",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    value.isNotEmpty ? FontWeight.w400 : FontWeight.w200,
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            IgnorePointer(
              ignoring: ignoring || controller.isAnimating,
              child: InkWell(
                onTap: active ? onTap : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: LayoutConstant.paddingM,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: active
                        ? backgroundColor
                        : Theme.of(context).disabledColor,
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
            ),
          ],
        ),
      ),
    );
  }
}
