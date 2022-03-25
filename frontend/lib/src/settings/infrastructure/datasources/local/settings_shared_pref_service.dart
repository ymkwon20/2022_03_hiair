import 'package:frontend/src/settings/infrastructure/datasources/settings_service.dart';
import 'package:frontend/src/settings/infrastructure/dtos/settings_info_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsSharedPrefService implements SettingsService {
  final SharedPreferences _database;

  static const _modeKey = 'theme_mode';

  const SettingsSharedPrefService({
    required SharedPreferences database,
  }) : _database = database;

  @override
  Future<SettingsInfoDTO> get settings async {
    String? theme = _database.getString(_modeKey);
    return SettingsInfoDTO(
        themeMode: theme == null || theme.isEmpty ? 'system' : theme);
  }

  @override
  Future<void> updateThemeMode(String themeMode) async {
    await _database.setString(_modeKey, themeMode);
  }
}
