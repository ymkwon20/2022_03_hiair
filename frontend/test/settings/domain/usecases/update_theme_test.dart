import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/src/settings/domain/usecases/update_theme.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock_repository.dart';

void main() {
  late MockSettingsRepository mockRepository;
  late UpdateThemeUsecase usecase;

  setUp(
    () {
      mockRepository = MockSettingsRepository();
      usecase = UpdateThemeUsecase(repository: mockRepository);
    },
  );

  test(
    'should update thememode from the repository',
    () async {
      // arrange
      when(() => mockRepository.updateTheme(any())).thenAnswer(
        (_) async => const Right(unit),
      );
      // act
      final result = await usecase('dark');
      // assert
      expect(result, const Right(unit));
      verify(() => mockRepository.updateTheme('dark'));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
