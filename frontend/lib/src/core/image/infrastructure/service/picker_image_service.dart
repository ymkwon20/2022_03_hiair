import 'package:flutter/foundation.dart';
import 'package:frontend/src/core/errors/exceptions.dart';
import 'package:frontend/src/core/image/infrastructure/service/i_image_service.dart';
import 'package:image_picker/image_picker.dart';

class PickerImageService extends IImageService {
  final ImagePicker _picker;

  const PickerImageService({
    required ImagePicker picker,
  }) : _picker = picker;

  @override
  Future<String?> takeOnePicture() async {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      final photo = await _picker.pickImage(source: ImageSource.camera);
      return photo?.path;
    } else {
      throw UnsupportedPlatformException();
    }
  }

  @override
  Future<String?> pickImage() async {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      return image?.path;
    } else {
      throw UnsupportedPlatformException();
    }
  }

  @override
  Future<List<String>?> pickImages() async {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      final images = await _picker.pickMultiImage();
      return images?.map((XFile image) => image.path).toList();
    } else {
      throw UnsupportedPlatformException();
    }
  }
}
