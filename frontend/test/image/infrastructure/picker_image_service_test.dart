import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/image/infrastructure/service/local/image_picker_local_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';

import 'mocks/mock_image_picker.dart';

void main() {
  late MockImagePicker mockPicker;
  late ImagePickerLocalService service;

  setUp(
    () {
      mockPicker = MockImagePicker();
      service = ImagePickerLocalService(picker: mockPicker, uuid: const Uuid());
    },
  );

  // test platform in most cases
  const defaultEnv = TargetPlatform.android;
  const unsupportedEnv = TargetPlatform.linux;
  debugDefaultTargetPlatformOverride = defaultEnv;

  // const tPath = "this/is/the/image/path";
  group(
    "pickImage",
    () {
      group(
        'in android environment',
        () {
          test(
            "should throw Exception if there is none picked",
            () async {
              when(
                () => mockPicker.pickImage(source: ImageSource.gallery),
              ).thenAnswer(
                (_) async => null,
              );

              final call = service.pickImage;
              expect(call, throwsA(isA<NotSelectedException>()));
              verify(() => mockPicker.pickImage(source: ImageSource.gallery));
            },
          );

          // test(
          //   'should return path if there is one picked',
          //   () async {
          //     when(
          //       () => mockPicker.pickImage(source: ImageSource.gallery),
          //     ).thenAnswer(
          //       (_) async => XFile(tPath),
          //     );

          //     final results = await service.pickImage();
          //     expect(results, tPath);
          //     verify(() => mockPicker.pickImage(source: ImageSource.gallery));
          //   },
          // );
        },
      );

      group(
        'in other Desktop or Web environment',
        () {
          test(
            'should throw Exception when the environment user runs is not mobile',
            () async {
              debugDefaultTargetPlatformOverride = unsupportedEnv;

              final call = service.pickImage;
              expect(call, throwsA(isA<UnsupportedPlatformException>()));
              debugDefaultTargetPlatformOverride =
                  defaultEnv; // <-- this is required
            },
          );
        },
      );
    },
  );

  group(
    "takeOnePicture",
    () {
      group(
        "in android environment",
        () {
          test(
            "should throw Exception if there is none picked",
            () async {
              when(
                () => mockPicker.pickImage(source: ImageSource.camera),
              ).thenAnswer(
                (_) async => null,
              );

              final call = service.takeOnePicture;
              expect(call, throwsA(isA<NotSelectedException>()));
              verify(() => mockPicker.pickImage(source: ImageSource.camera));
            },
          );

          // test(
          //   'should return path if there is one picked',
          //   () async {
          //     when(
          //       () => mockPicker.pickImage(source: ImageSource.camera),
          //     ).thenAnswer(
          //       (_) async => XFile(tPath),
          //     );

          //     final results = await service.takeOnePicture();
          //     expect(results, tPath);
          //     verify(() => mockPicker.pickImage(source: ImageSource.camera));
          //   },
          // );
        },
      );

      group(
        "in other Desktop or Web environment",
        () {
          test(
            'should throw Exception when the environment user runs is not mobile',
            () async {
              debugDefaultTargetPlatformOverride = unsupportedEnv;

              final call = service.takeOnePicture;
              expect(call, throwsA(isA<UnsupportedPlatformException>()));
              debugDefaultTargetPlatformOverride =
                  defaultEnv; // <-- this is required
            },
          );
        },
      );
    },
  );
}
