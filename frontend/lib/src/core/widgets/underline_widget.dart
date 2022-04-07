import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/layout_constant.dart';

class UnderlineWidget extends StatelessWidget {
  const UnderlineWidget({
    Key? key,
    this.thickness = LayoutConstant.spaceS,
  }) : super(key: key);

  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: thickness,
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
