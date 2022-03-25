import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/src/core/errors/exceptions.dart';
import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/settings/domain/entities/settings_info.dart';
import 'package:frontend/src/settings/infrastructure/dtos/settings_info_dto.dart';
import 'package:frontend/src/settings/infrastructure/repositories/settings_repository.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock_data_service.dart';

void main() {
  late MockSettingsService mockService;
  late SettingsRepository repository;

  setUp(
    () {
      mockService = MockSettingsService();
      repository = SettingsRepository(
        service: mockService,
      );
    },
  );

  group(
    'loadTheme',
    () {
      const tSettingsInfo = SettingsInfo(themeMode: 'system');

      test(
        'should return theme data when the local call is successful',
        () async {
          // arrange
          when(() => mockService.settings).thenAnswer(
            (invocation) async => SettingsInfoDTO.fromDomain(tSettingsInfo),
          );
          // act
          final result = await repository.loadTheme();
          // assert
          expect(result, const Right(tSettingsInfo));
          verify(() => mockService.settings);
        },
      );

      test(
        "should return Failure.server() when local call is unsuccessful",
        () async {
          // arrange
          when(() => mockService.settings).thenThrow(InternalException());
          // act
          final result = await repository.loadTheme();
          // assert
          expect(result, const Left(Failure.internal()));
        },
      );
    },
  );

  group(
    'updateTheme',
    () {
      const tThememode = 'dark';
      test(
        'should pass the function when local call is successful',
        () async {
          // arrange
          when(() => mockService.updateThemeMode(any()))
              .thenAnswer((_) async {});
          // act
          final result = await repository.updateTheme(tThememode);
          // assert
          verify(() => mockService.updateThemeMode(tThememode));
          expect(result, const Right(unit));
        },
      );

      test(
        'should return Failure.server() when local call is unsucessful',
        () async {
          // arrange
          when(() => mockService.updateThemeMode(any()))
              .thenThrow(InternalException());
          // act
          final result = await repository.updateTheme(tThememode);
          // assert
          verify(() => mockService.updateThemeMode(tThememode));
          expect(result, const Left(Failure.internal()));
        },
      );
    },
  );
}
