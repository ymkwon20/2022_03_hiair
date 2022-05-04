import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < LayoutConstant.screenTablet;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= LayoutConstant.screenTablet &&
      MediaQuery.of(context).size.width < LayoutConstant.screenDesktop;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= LayoutConstant.screenDesktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile(context)) {
          return mobile;
        } else if (isTablet(context)) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
