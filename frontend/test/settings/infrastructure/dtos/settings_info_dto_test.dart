import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/src/settings/domain/entities/settings_info.dart';
import 'package:frontend/src/settings/infrastructure/dtos/settings_info_dto.dart';

import '../../../fixture/fixture_reader.dart';

void main() {
  const tValidDTO = SettingsInfoDTO(themeMode: 'dark');
  const tDefaultDTO = SettingsInfoDTO(themeMode: 'system');
  test(
    "should be a subclass of SettingsInfo entity",
    () async {
      expect(tValidDTO.toDomain(), isA<SettingsInfo>());
    },
  );

  group(
    'fromJson',
    () {
      test(
        "should return a valid model when the JSON data is valid",
        () async {
          // arrange
          final jsonMap = json.decode(fixture('settings_info_valid.json'));
          // act
          final result = SettingsInfoDTO.fromMap(jsonMap);
          // assert
          expect(result, tValidDTO);
        },
      );

      test(
        'should return a default system model when the JSON data is not valid',
        () async {
          // arrange
          final jsonMap = json.decode(fixture('settings_info_invalid.json'));
          // act
          final result = SettingsInfoDTO.fromMap(jsonMap);
          // assert
          expect(result, tDefaultDTO);
        },
      );
    },
  );

  group(
    'toJson',
    () {
      test(
        "should return a JSON map containing the proper data",
        () async {
          // act
          final result = tValidDTO.toMap();
          // assert
          final expectedJsonMap = {"themeMode": "dark"};
          expect(result, expectedJsonMap);
        },
      );
    },
  );
}
