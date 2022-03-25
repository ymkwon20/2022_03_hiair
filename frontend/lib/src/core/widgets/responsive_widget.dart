import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/index.dart';

/// 반응형에 대응하는 사이즈를 보여주는 위젯
/// 각각  mobile, tablet, desktop의 사이즈일 때
/// 지정한 지정한 위젯을 보여준다
class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  /// mobile size(width 기준)일 때 보여줄 위젯
  final Widget mobile;

  /// tablet size(width 기준)일 때 보여줄 위젯
  final Widget tablet;

  /// desktop size(width 기준)일 때 보여줄 위젯
  final Widget desktop;

  /// mobile size에 해당하는지 확인
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < LayoutConstant.screenTablet;

  /// tablet size에 해당하는지 확인
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= LayoutConstant.screenTablet &&
      MediaQuery.of(context).size.width < LayoutConstant.screenDesktop;

  /// desktop size에 해당하는지 확인
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
