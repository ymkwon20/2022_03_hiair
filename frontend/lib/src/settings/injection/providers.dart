import 'package:frontend/src/settings/application/settings_state.dart';
import 'package:frontend/src/settings/application/settings_state_notifier.dart';
import 'package:frontend/src/settings/domain/repositories/i_settings_repository.dart';
import 'package:frontend/src/settings/domain/usecases/load_theme.dart';
import 'package:frontend/src/settings/domain/usecases/update_theme.dart';
import 'package:frontend/src/settings/infrastructure/datasources/local/settings_shared_pref_service.dart';
import 'package:frontend/src/settings/infrastructure/datasources/settings_service.dart';
import 'package:frontend/src/settings/infrastructure/repositories/settings_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ! Features

/// Providers
final settingsStateNotifierProvider =
    StateNotifierProvider<SettingsStateNotifier, SettingsState>(
  (ref) => SettingsStateNotifier(
    loadTheme: ref.watch(loadThemeProvider),
    updateTheme: ref.watch(updateThemeProvider),
  ),
);

/// Usecases
final loadThemeProvider = Provider<LoadThemeUsecase>(
  (ref) => LoadThemeUsecase(
    repository: ref.watch(settingsRepositoryProvider),
  ),
);

final updateThemeProvider = Provider<UpdateThemeUsecase>(
  (ref) => UpdateThemeUsecase(
    repository: ref.watch(settingsRepositoryProvider),
  ),
);

/// Repository
final settingsRepositoryProvider = Provider<ISettingsRepository>(
  (ref) => SettingsRepository(
    service: ref.watch(settingsLocalServiceProvider),
  ),
);

/// Data Sources
final settingsLocalServiceProvider = Provider<SettingsService>(
  (ref) => SettingsSharedPrefService(
    database: ref.watch(sharedPrefProvider),
  ),
);

//! External
final sharedPrefProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);
