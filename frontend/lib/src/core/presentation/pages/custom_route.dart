import 'package:flutter/material.dart';

class CustomScaleRoute extends PopupRoute {
  final WidgetBuilder builder;
  final bool dismissible;
  final String? label;
  final Color? backgroundColor;
  CustomScaleRoute({
    required this.builder,
    this.dismissible = true,
    this.label,
    this.backgroundColor,
  });

  @override
  Color? get barrierColor => backgroundColor;

  @override
  bool get barrierDismissible => dismissible;

  @override
  String? get barrierLabel => label;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: CurveTween(curve: Curves.ease).animate(animation),
      child: ScaleTransition(
        scale: CurveTween(curve: Curves.ease).animate(animation),
        child: child,
      ),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);
}

class CustomSlideRoute extends PopupRoute {
  final WidgetBuilder builder;
  final bool dismissible;
  final String? label;
  final Color? backgroundColor;
  CustomSlideRoute({
    required this.builder,
    this.dismissible = true,
    this.label,
    this.backgroundColor,
  });

  @override
  Color? get barrierColor => backgroundColor;

  @override
  bool get barrierDismissible => dismissible;

  @override
  String? get barrierLabel => label;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: CurveTween(curve: Curves.ease).animate(animation),
      child: SlideTransition(
        position: Tween(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        ).chain(CurveTween(curve: Curves.ease)).animate(animation),
        child: child,
      ),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);
}
