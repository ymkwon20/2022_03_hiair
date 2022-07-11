import 'package:flutter/material.dart';
import 'package:frontend/src/image/domain/usecases/fetch_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/domain/entities/check_image.dart';
import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/image/dependency_injection.dart';
import 'package:frontend/src/image/domain/entities/image_source.dart';
import 'package:frontend/src/image/domain/usecases/fetch_multiple_images.dart';
import 'package:frontend/src/qm/domain/entities/qm_menu.dart';

final checklistNotifierProvider = ChangeNotifierProvider(
  (ref) => ChecklistNotifier(fetchImage: ref.watch(fetchImageProvider)),
);

final checkimagelistNotifierProvider = ChangeNotifierProvider(
  (ref) => CheckimagelistNotifier(
      fetchMultipleImages: ref.watch(fetchMultipleImagesProvider)),
);

class ChecklistNotifier extends ChangeNotifier {
  ChecklistNotifier({
    required FetchImage fetchImage,
  }) : _fetchImage = fetchImage;

  final FetchImage _fetchImage;

  List<CheckItem> items = [];

  bool hasEdit = false;

  QmMenu? menu;

  Future<void> setImage(ImageSource source, int index) async {
    final resultOrFailure = await _fetchImage(source);

    resultOrFailure.fold(
      (_) {},
      (filePath) {
        hasEdit = true;

        items[index] = items[index].copyWith(
          originalFileName: filePath,
          imageFileName: filePath,
        );

        notifyListeners();
      },
    );
  }

  void setQm(QmMenu newMenu) {
    menu = newMenu;
  }

  void setChecklist(List<CheckItem> value) {
    hasEdit = false;
    items = value;
    notifyListeners();
  }

  void editCheckItem(int index, CheckItem value) {
    hasEdit = true;
    items[index] = value;
    notifyListeners();
  }

  void clear() {
    hasEdit = false;
    items.clear();
    notifyListeners();
  }

  bool get isNotCompleted =>
      items.any((item) => !item.hasValue || !item.isUnitFilled);

  bool get isCompleted => !isNotCompleted;
}

class CheckimagelistNotifier with ChangeNotifier {
  CheckimagelistNotifier({
    required FetchMultipleImages fetchMultipleImages,
  }) : _fetchMultipleImages = fetchMultipleImages;

  final FetchMultipleImages _fetchMultipleImages;

  bool get shouldSave => items.any((element) => element.shouldSave);

  List<CheckImage> items = [];

  void setCheckimagelist(List<CheckImage> value) {
    items = value;
    notifyListeners();
  }

  Future<void> setImage(ImageSource source) async {
    final resultsOrFailure = await _fetchMultipleImages(source);

    resultsOrFailure.fold(
      (failure) {},
      (imagePaths) {
        if (imagePaths.isNotEmpty) {
          items.addAll(
            imagePaths
                .map((path) => CheckImage.local(
                      seq: items.length + 1,
                      path: path,
                      remark: "",
                    ))
                .toList(),
          );

          notifyListeners();
        }
      },
    );
  }

  void editRemarkAt(int index, String remark) {
    items[index] = items[index].copyWith(
      remark: remark,
      shouldSave: true,
    );
    notifyListeners();
  }

  void clear() {
    items.clear();
    notifyListeners();
  }

  void removeAt(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}
