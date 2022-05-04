import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';

void showFlashBar(
  BuildContext context, {
  required String title,
  required String content,
  Color? backgroundColor,
  Color? textColor,
}) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    builder: (context, controller) {
      return Padding(
        padding: const EdgeInsets.all(LayoutConstant.paddingM),
        child: Flash.bar(
          position: FlashPosition.top,
          enableVerticalDrag: true,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          borderRadius: BorderRadius.circular(LayoutConstant.radiusS),
          backgroundColor: backgroundColor,
          controller: controller,
          child: FlashBar(
            content: Row(
              children: [
                Text(
                  title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: textColor),
                ),
                const SizedBox(width: LayoutConstant.spaceM),
                Text(
                  content,
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
