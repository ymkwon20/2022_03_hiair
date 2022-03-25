import 'package:flutter/material.dart';

class UnderlineWidget extends StatelessWidget {
  const UnderlineWidget({
    Key? key,
    this.color = Colors.grey,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2,
      color: color.withOpacity(.6),
    );
  }
}
