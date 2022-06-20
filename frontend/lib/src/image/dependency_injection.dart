import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/image/domain/repositories/i_image_repository.dart';
import 'package:frontend/src/image/domain/usecases/fetch_image.dart';
import 'package:frontend/src/image/domain/usecases/save_images.dart';
import 'package:frontend/src/image/infrastructure/repositories/image_repository.dart';
import 'package:frontend/src/image/infrastructure/service/local/i_image_local_service.dart';
import 'package:frontend/src/image/infrastructure/service/local/image_picker_local_service.dart';
import 'package:frontend/src/image/infrastructure/service/remote/i_image_remote_service.dart';
import 'package:frontend/src/image/infrastructure/service/remote/image_dio_remote_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final fetchImageProvider = Provider(
  (ref) => FetchImages(repository: ref.watch(imageRepositoryProvider)),
);

final saveImagesProvider = Provider(
  (ref) => SaveImages(repository: ref.watch(imageRepositoryProvider)),
);

final imageRepositoryProvider = Provider<IImageRepository>(
  (ref) => ImageRepository(
    local: ref.watch(imageLocalServiceProvider),
    remote: ref.watch(imageRemoteServiceProvider),
  ),
);

final imageLocalServiceProvider = Provider<IImageLocalService>(
  (ref) => ImagePickerLocalService(picker: ref.watch(imagePickerProvider)),
);

final imageRemoteServiceProvider = Provider<IImageRemoteService>(
  (ref) => ImageDioRemoteService(httpClient: ref.watch(dioProvider)),
);

final imagePickerProvider = Provider(
  (ref) => ImagePicker(),
);
