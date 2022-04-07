abstract class IImageService {
  const IImageService();

  Future<String?> takeOnePicture();
  Future<String?> pickImage();
  Future<List<String>?> pickImages();
}
