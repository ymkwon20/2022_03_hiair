abstract class IImageLocalService {
  const IImageLocalService();

  Future<String?> takeOnePicture();
  Future<String?> pickImage();
  Future<List<String>?> pickMultiImages();
}
