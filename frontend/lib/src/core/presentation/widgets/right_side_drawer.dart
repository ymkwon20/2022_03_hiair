import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';

class RightSideDrawer extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> slideAnimation;
  final double width;
  final Widget child;

  const RightSideDrawer({
    Key? key,
    required this.controller,
    required this.slideAnimation,
    required this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Positioned(
          top: LayoutConstant.spaceXS,
          bottom: LayoutConstant.spaceXS,
          right: (slideAnimation.value - 1) * width,
          child: Container(
            width: width,
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
            child: controller.value > 0 ? child : const SizedBox(),
          ),
        );
      },
    );
  }
}
