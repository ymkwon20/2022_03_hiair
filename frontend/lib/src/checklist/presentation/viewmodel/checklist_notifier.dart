import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/domain/entities/check_image.dart';
import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/image/dependency_injection.dart';
import 'package:frontend/src/image/domain/entities/image_source.dart';
import 'package:frontend/src/image/domain/usecases/fetch_image.dart';
import 'package:frontend/src/qm/domain/entities/qm_menu.dart';

final checklistNotifierProvider = ChangeNotifierProvider(
  (ref) => ChecklistNotifier(),
);

final checkimagelistNotifierProvider = ChangeNotifierProvider(
  (ref) => CheckimagelistNotifier(fetchImage: ref.watch(fetchImageProvider)),
);

class ChecklistNotifier extends ChangeNotifier {
  List<CheckItem> items = [];

  bool hasEdit = false;

  QmMenu? menu;

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

  void removeAt(int index) {
    items.removeAt(index);
    notifyListeners();
  }

  bool get isNotCompleted =>
      items.any((item) => !item.hasValue || !item.isUnitFilled);

  bool get isCompleted => !isNotCompleted;
}

class CheckimagelistNotifier with ChangeNotifier {
  CheckimagelistNotifier({
    required FetchImage fetchImage,
  }) : _fetchImage = fetchImage;

  final FetchImage _fetchImage;

  bool hasEdit = false;

  List<CheckImage> items = [];

  void setCheckimagelist(List<CheckImage> value) {
    hasEdit = false;
    items = value;
    notifyListeners();
  }

  Future<void> setImage(ImageSource source) async {
    final resultsOrFailure = await _fetchImage(source);

    resultsOrFailure.fold(
      (failure) {},
      (path) {
        if (path != null) {
          hasEdit = true;
          items.add(
            CheckImage.local(
              seq: items.length + 1,
              path: path,
              remark: "",
            ),
          );

          notifyListeners();
        }
      },
    );
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
