import 'package:frontend/src/settings/infrastructure/dtos/settings_info_dto.dart';

abstract class SettingsService {
  Future<SettingsInfoDTO> get settings;
  Future<void> updateThemeMode(String theme);
}
