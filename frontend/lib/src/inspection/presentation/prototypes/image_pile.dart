import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagePile extends StatefulWidget {
  const ImagePile({
    Key? key,
    required this.images,
    this.imageSize = 36,
    required this.imagePercentOverlap,
  }) : super(key: key);

  final List<String> images;
  final double imageSize;
  final double imagePercentOverlap;

  @override
  State<ImagePile> createState() => _ImagePileState();
}

class _ImagePileState extends State<ImagePile> {
  final _visibleImages = <String>[];

  @override
  void initState() {
    super.initState();
    _syncImagesWithPile();
  }

  @override
  void didUpdateWidget(covariant ImagePile oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncImagesWithPile();
  }

  void _syncImagesWithPile() {
    final newImages = widget.images.where(
      (image) => _visibleImages
          .where(
            (visibleImage) => image == visibleImage,
          )
          .isEmpty,
    );

    _visibleImages.addAll(newImages);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final imagesCount = _visibleImages.length;
      double imagePercentVisible = 1.0 - widget.imagePercentOverlap;

      final intrinsicWidth = imagesCount > 1
          ? (1 + (imagePercentVisible * (imagesCount - 1))) * widget.imageSize
          : widget.imageSize;

      if (intrinsicWidth > constraints.maxWidth) {
        imagePercentVisible =
            ((constraints.maxWidth / widget.imageSize) - 1) / (imagesCount - 1);
      }

      return SizedBox(
        height: widget.imageSize,
        child: Stack(
          clipBehavior: Clip.none,
          children: widget.images.isNotEmpty
              ? _visibleImages
                  .mapIndexed(
                    (index, visibleImage) => AnimatedPositioned(
                      key: ValueKey(visibleImage),
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      left: (index * imagePercentVisible * widget.imageSize),
                      top: 0,
                      width: widget.imageSize,
                      height: widget.imageSize,
                      child: AppearingAndDisappearingWidget(
                        child: CircleImageTile(
                          size: widget.imageSize,
                        ),
                        imageSize: widget.imageSize,
                        showImage: widget.images.contains(visibleImage),
                        onDisappear: () {
                          setState(() {
                            _visibleImages.remove(visibleImage);
                          });
                        },
                      ),
                    ),
                  )
                  .toList()
              : [
                  AppearingAndDisappearingWidget(
                    child: CircleAddTile(size: widget.imageSize),
                    imageSize: widget.imageSize,
                    showImage: widget.images.isEmpty,
                    onDisappear: () {
                      setState(() {
                        // TODO: add image to _visibleImages?
                      });
                    },
                  ),
                ],
        ),
      );
    });
  }
}

class AppearingAndDisappearingWidget extends StatefulWidget {
  const AppearingAndDisappearingWidget({
    Key? key,
    required this.imageSize,
    required this.showImage,
    required this.onDisappear,
    required this.child,
  }) : super(key: key);

  final double imageSize;
  final bool showImage;
  final VoidCallback onDisappear;
  final Widget child;

  @override
  State<AppearingAndDisappearingWidget> createState() =>
      _AppearingAndDisappearingWidgetState();
}

class _AppearingAndDisappearingWidgetState
    extends State<AppearingAndDisappearingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;

  static final _scaleTween = CurveTween(curve: Curves.elasticOut);

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.dismissed) {
            widget.onDisappear.call();
          }
        },
      );

    _syncScaleAnimationWithWidget();
  }

  @override
  void didUpdateWidget(covariant AppearingAndDisappearingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    _syncScaleAnimationWithWidget();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _syncScaleAnimationWithWidget() {
    if (widget.showImage &&
        !_scaleController.isCompleted &&
        _scaleController.status != AnimationStatus.forward) {
      _scaleController.forward();
    } else if (!widget.showImage &&
        !_scaleController.isDismissed &&
        _scaleController.status != AnimationStatus.reverse) {
      _scaleController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.imageSize,
      height: widget.imageSize,
      child: Center(
        child: AnimatedBuilder(
          animation: _scaleController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleTween.animate(_scaleController).value,
              child: child,
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}

class CircleImageTile extends StatelessWidget {
  const CircleImageTile({
    Key? key,
    required this.size,
    this.backgroundColor = const Color(0xFFAAAAAA),
    this.imagePath,
  }) : super(key: key);

  final double size;
  final Color backgroundColor;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.4),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        // TODO: change mock to real
        image:
            "https://randomuser.me/api/portraits/women/${Random().nextInt(100)}.jpg",
      ),
    );
  }
}

class CircleAddTile extends StatefulWidget {
  const CircleAddTile({
    Key? key,
    required this.size,
    this.backgroundColor = const Color(0xFFAAAAAA),
  }) : super(key: key);

  final double size;
  final Color backgroundColor;

  @override
  State<CircleAddTile> createState() => _CircleAddTileState();
}

class _CircleAddTileState extends State<CircleAddTile> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() {
        _scale = 0.9;
      }),
      onTapUp: (_) => setState(() {
        _scale = 1.0;
        // TODO: add gesture action
      }),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        curve: Curves.ease,
        child: Container(
          width: widget.size,
          height: widget.size,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.4),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            size: widget.size * 0.6,
          ),
        ),
      ),
    );
  }
}
