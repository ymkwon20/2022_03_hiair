import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:frontend/src/core/presentation/widgets/image_dialog.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.imagePath,
    required this.isLocal,
  }) : super(key: key);

  final String imagePath;

  final bool isLocal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ImageDialog(
                imagePath: imagePath,
                isLocal: isLocal,
              );
            },
          ),
        );
      },
      child: isLocal
          ? Image.file(
              File(imagePath),
              fit: BoxFit.contain,
            )
          : CachedNetworkImage(
              imageUrl: imagePath,
              placeholder: (context, url) => const SizedBox(
                  width: 60, height: 60, child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
    );
  }
}
