import 'package:flutter/material.dart';

class UnderlineWidget extends StatelessWidget {
  const UnderlineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2,
      color: Theme.of(context).dividerColor,
    );
  }
}
