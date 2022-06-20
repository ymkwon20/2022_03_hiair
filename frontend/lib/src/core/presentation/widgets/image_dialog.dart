import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:frontend/src/core/presentation/index.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({
    Key? key,
    required this.imagePath,
    required this.isLocal,
  }) : super(key: key);

  final String imagePath;
  final bool isLocal;
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
            child: isLocal
                ? Image.file(
                    File(imagePath),
                  )
                : CachedNetworkImage(imageUrl: imagePath),
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
