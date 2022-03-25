import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/src/settings/infrastructure/datasources/local/settings_shared_pref_service.dart';
import 'package:frontend/src/settings/infrastructure/dtos/settings_info_dto.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixture/fixture_reader.dart';
import 'mocks/mock_shared_prefs.dart';

String? testTempPath;
const bool kIsWeb = identical(0, 0.0);

void main() {
  late MockSharedPreferences mockDatabase;
  late SettingsSharedPrefService service;

  setUp(
    () {
      mockDatabase = MockSharedPreferences();
      service = SettingsSharedPrefService(database: mockDatabase);
    },
  );

  const tThememode = 'dark';
  const _key = 'theme_mode';
  final tSettings =
      SettingsInfoDTO.fromJson(fixture('settings_info_valid.json'));
  final tSettingsDefault =
      SettingsInfoDTO.fromJson(fixture('settings_info_invalid.json'));

  group(
    'settings',
    () {
      test(
        "should return default themeMode when there is no data",
        () async {
          // arrange
          when(() => mockDatabase.getString(any())).thenAnswer((_) => null);
          // act
          final result = await service.settings;
          // assert
          expect(result, tSettingsDefault);
          verify(() => mockDatabase.getString(_key));
        },
      );

      test(
        'should return themeMode from Local Database when there is one stored',
        () async {
          // arrange
          when(() => mockDatabase.getString(any())).thenAnswer((_) => 'dark');
          // act
          final result = await service.settings;
          // assert
          expect(result, tSettings);
          verify(() => mockDatabase.getString(_key));
        },
      );
    },
  );

  group(
    'updateTheme',
    () {
      test(
        'should call SharedPreferences to cache the data',
        () async {
          // arrange
          when(() => mockDatabase.getString(any())).thenAnswer((_) => null);
          when(() => mockDatabase.setString(_key, any()))
              .thenAnswer((_) async => true);
          // act
          var result = await service.settings;
          expect(result, tSettingsDefault);

          await service.updateThemeMode(tThememode);
          when(() => mockDatabase.getString(any())).thenAnswer((_) => 'dark');
          result = await service.settings;
          expect(result, tSettings);
          verify(() => mockDatabase.setString(_key, tThememode));
        },
      );
    },
  );
}
