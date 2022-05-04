import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/image/infrastructure/service/picker_image_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock_image_picker.dart';

void main() {
  late MockImagePicker mockPicker;
  late PickerImageService service;

  setUp(
    () {
      mockPicker = MockImagePicker();
      service = PickerImageService(picker: mockPicker);
    },
  );

  // test platform in most cases
  const defaultEnv = TargetPlatform.android;
  const unsupportedEnv = TargetPlatform.linux;
  debugDefaultTargetPlatformOverride = defaultEnv;

  const tPath = "this/is/the/image/path";
  const tPaths = [tPath, tPath, tPath];
  group(
    "pickImage",
    () {
      group(
        'in android environment',
        () {
          test(
            "should return null if there is none picked",
            () async {
              when(
                () => mockPicker.pickImage(source: ImageSource.gallery),
              ).thenAnswer(
                (_) async => null,
              );

              final results = await service.pickImage();
              expect(results, null);
              verify(() => mockPicker.pickImage(source: ImageSource.gallery));
            },
          );

          test(
            'should return path if there is one picked',
            () async {
              when(
                () => mockPicker.pickImage(source: ImageSource.gallery),
              ).thenAnswer(
                (_) async => XFile(tPath),
              );

              final results = await service.pickImage();
              expect(results, tPath);
              verify(() => mockPicker.pickImage(source: ImageSource.gallery));
            },
          );
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
            "should return null if there is none picked",
            () async {
              when(
                () => mockPicker.pickImage(source: ImageSource.camera),
              ).thenAnswer(
                (_) async => null,
              );

              final results = await service.takeOnePicture();
              expect(results, null);
              verify(() => mockPicker.pickImage(source: ImageSource.camera));
            },
          );

          test(
            'should return path if there is one picked',
            () async {
              when(
                () => mockPicker.pickImage(source: ImageSource.camera),
              ).thenAnswer(
                (_) async => XFile(tPath),
              );

              final results = await service.takeOnePicture();
              expect(results, tPath);
              verify(() => mockPicker.pickImage(source: ImageSource.camera));
            },
          );
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

  group(
    "pickImages",
    () {
      group(
        "in android environment",
        () {
          test(
            "should return null if there is none picked",
            () async {
              when(
                () => mockPicker.pickMultiImage(),
              ).thenAnswer(
                (_) async => null,
              );

              final results = await service.pickImages();
              expect(results, null);
              verify(() => mockPicker.pickMultiImage());
            },
          );

          test(
            'should return path if there is one picked',
            () async {
              when(
                () => mockPicker.pickMultiImage(),
              ).thenAnswer(
                (_) async => [
                  XFile(tPath),
                  XFile(tPath),
                  XFile(tPath),
                ],
              );

              final results = await service.pickImages();
              expect(results, tPaths);
              verify(() => mockPicker.pickMultiImage());
            },
          );
        },
      );

      group(
        "in other Desktop or Web environment",
        () {
          test(
            'should throw Exception when the environment user runs is not mobile',
            () async {
              debugDefaultTargetPlatformOverride = unsupportedEnv;

              final call = service.pickImages();
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
