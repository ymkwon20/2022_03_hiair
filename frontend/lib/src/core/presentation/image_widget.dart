import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:frontend/src/core/presentation/widgets/image_dialog.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({
    Key? key,
    required this.imagePath,
    required this.isLocal,
  }) : super(key: key);

  final String imagePath;

  final bool isLocal;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  Uint8List? _cachedBytes;
  late NetworkAssetBundle _assetBundle;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (!widget.isLocal) {
        _assetBundle = NetworkAssetBundle(Uri.parse(widget.imagePath));
        final imageData = await _assetBundle.load("");
        setState(() {
          _cachedBytes = imageData.buffer.asUint8List();
        });
      } else {
        File imageFile = File(widget.imagePath);
        _cachedBytes = await imageFile.readAsBytes();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _cachedBytes == null
        ? const SizedBox()
        : GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ImageDialog(
                  bytes: _cachedBytes!,
                );
              }));
            },
            child: Image.memory(
              _cachedBytes!,
              fit: BoxFit.contain,
            ),
          );
  }
}
