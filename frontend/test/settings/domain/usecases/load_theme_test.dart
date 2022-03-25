import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/src/settings/domain/entities/settings_info.dart';
import 'package:frontend/src/settings/domain/usecases/load_theme.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock_repository.dart';

void main() {
  late LoadThemeUsecase usecase;
  late MockSettingsRepository mockRepository;

  setUp(
    () {
      mockRepository = MockSettingsRepository();
      usecase = LoadThemeUsecase(repository: mockRepository);
    },
  );

  const tTheme = 'light';
  const tSettingsInfo = SettingsInfo(themeMode: tTheme);

  test(
    'should load theme from the repository',
    () async {
      // arrange
      when(
        () => mockRepository.loadTheme(),
      ).thenAnswer(
        (_) async => const Right(tSettingsInfo),
      );
      // act
      final result = await usecase();
      // assert
      expect(result, const Right(tSettingsInfo));
      verify(mockRepository.loadTheme);
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
