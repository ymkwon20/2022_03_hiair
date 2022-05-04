import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';

// TODO: implement details
class RectDialog extends StatefulWidget {
  const RectDialog({
    Key? key,
    required this.dx,
    required this.dy,
    required this.child,
  }) : super(key: key);

  final double dx;
  final double dy;
  final Widget child;

  @override
  State<RectDialog> createState() => _RectDialogState();
}

class _RectDialogState extends State<RectDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(LayoutConstant.paddingS),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
      ),
      child: widget.child,
    );
  }
}
