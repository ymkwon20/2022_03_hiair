import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/presentation/index.dart';

class CheckTextfield extends ConsumerWidget {
  const CheckTextfield({
    Key? key,
    required this.controller,
    required this.type,
    required this.focusNode,
    required this.fontSize,
    required this.onComplete,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType type;
  final FocusNode focusNode;
  final double fontSize;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: type,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: LayoutConstant.paddingXS,
          horizontal: LayoutConstant.paddingM,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(LayoutConstant.radiusS),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
            width: LayoutConstant.spaceXS,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            LayoutConstant.radiusS,
          ),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
            width: LayoutConstant.spaceXS,
          ),
        ),
      ),
      onEditingComplete: () {
        focusNode.unfocus();
        onComplete.call();
      },
    );
  }
}
