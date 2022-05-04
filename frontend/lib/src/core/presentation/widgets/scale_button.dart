import 'package:flutter/material.dart';

/// 눌렀을 때 Scale을 80%로 변화 시키는 버튼 위젯
class ScaleButton extends StatefulWidget {
  const ScaleButton({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget child;

  @override
  State<ScaleButton> createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<ScaleButton> {
  double scale = 1.0;

  void _scaleDown() {
    setState(() {
      scale = 0.8;
    });
  }

  void _scaleBack() {
    setState(() {
      scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      onTapDown: (_) {
        _scaleDown();
      },
      onTapUp: (_) {
        _scaleBack();
      },
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
