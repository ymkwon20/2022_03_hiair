import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:image_picker/image_picker.dart';

import 'i_image_local_service.dart';

class ImagePickerLocalService extends IImageLocalService {
  final ImagePicker _picker;

  const ImagePickerLocalService({
    required ImagePicker picker,
  }) : _picker = picker;

  @override
  Future<String> takeOnePicture() async {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      final photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo == null) {
        throw NotSelectedException();
      }
      return _toNewNamePath(photo);
    } else {
      throw UnsupportedPlatformException();
    }
  }

  @override
  Future<String> pickImage() async {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        throw NotSelectedException();
      }
      return _toNewNamePath(image);
    } else {
      throw UnsupportedPlatformException();
    }
  }

  @override
  Future<List<String>> pickMultiImages() async {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      final images = await _picker.pickMultiImage();

      return images?.map((image) => _toNewNamePath(image)).toList() ?? [];
    } else {
      throw UnsupportedPlatformException();
    }
  }

  /// 파일이름을 현재 시간으로 바꿈
  String _toNewNamePath(XFile? file) {
    if (file == null) {
      return "";
    } else {
      final fileDir = path.dirname(file.path);
      final newPath = path.join(fileDir,
          "${DateFormat("yyyyMMddHHmmssSSS").format(DateTime.now())}.jpg");

      final newFile = File(file.path).renameSync(newPath);
      return newFile.path;
    }
  }
}
