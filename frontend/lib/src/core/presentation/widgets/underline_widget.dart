import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';

/// 시각적 의미를 구분 지을수 있게 하는 공통 선 위젯
///
/// ex.
///
/// 제목
///
/// ============
///
/// 내용
class UnderlineWidget extends StatelessWidget {
  const UnderlineWidget({
    Key? key,
    this.thickness = LayoutConstant.spaceXS,
    this.color,
  }) : super(key: key);

  final double thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: thickness,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).dividerColor,
      ),
    );
  }
}
