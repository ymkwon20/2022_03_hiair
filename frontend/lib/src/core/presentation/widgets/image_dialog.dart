import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';

class ImageDialog extends StatefulWidget {
  const ImageDialog({
    Key? key,
    required this.bytes,
  }) : super(key: key);

  final Uint8List bytes;

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
          ),
          InteractiveViewer(
            child: Image.memory(
              widget.bytes,
            ),
          ),
          Positioned(
            top: LayoutConstant.spaceXL,
            left: LayoutConstant.spaceXL,
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
