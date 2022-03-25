import 'package:frontend/src/settings/application/settings_event.dart';
import 'package:frontend/src/settings/application/settings_state.dart';
import 'package:frontend/src/settings/domain/usecases/load_theme.dart';
import 'package:frontend/src/settings/domain/usecases/update_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsStateNotifier extends StateNotifier<SettingsState> {
  final LoadThemeUsecase loadTheme;
  final UpdateThemeUsecase updateTheme;

  SettingsStateNotifier({
    required this.loadTheme,
    required this.updateTheme,
  }) : super(const SettingsState.empty());

  Future<void> mapEventToState(SettingsEvent event) async {
    // TODO: implement
  }
}
