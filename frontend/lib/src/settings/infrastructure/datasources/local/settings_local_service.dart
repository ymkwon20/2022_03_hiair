import 'package:flutter/material.dart';
import 'package:frontend/objectbox.g.dart';
import 'package:frontend/src/settings/infrastructure/datasources/settings_service.dart';
import 'package:frontend/src/settings/infrastructure/dtos/settings_info_object.dart';

class SettingsLocalService implements SettingsService {
  final Box<SettingsInfoObject> _box;

  const SettingsLocalService({
    required Box<SettingsInfoObject> box,
  }) : _box = box;

  @override
  Future<ThemeMode> get themeMode async {
    final settings = _box.get(0);
    return ThemeMode.values
        .byName(settings?.themeMode ?? ThemeMode.system.name);
  }

  @override
  Future<void> updateThemeMode(ThemeMode theme) async {
    _box.putAsync(
      SettingsInfoObject(
        themeMode: theme.name,
      ),
    );
  }
}
