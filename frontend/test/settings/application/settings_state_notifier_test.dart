// import 'package:flutter_test/flutter_test.dart';
// import 'package:frontend/src/settings/application/settings_state.dart';
// import 'package:frontend/src/settings/application/settings_state_notifier.dart';
// import 'package:frontend/src/settings/injection/providers.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'mocks/mock_usecases.dart';

void main() {
  // late SettingsStateNotifier notifier;
  // late MockLoadThemeUsecase mockLoad;
  // late MockUpdateThemeUsecase mockUpdate;

  // setUp(
  //   () {
  //     mockLoad = MockLoadThemeUsecase();
  //     mockUpdate = MockUpdateThemeUsecase();
  //     notifier = SettingsStateNotifier(
  //       loadTheme: mockLoad,
  //       updateTheme: mockUpdate,
  //     );
  //   },
  // );

  // test(
  //   'initialState should be Empty',
  //   () async {
  //     final sharedPrefs = await SharedPreferences.getInstance();
  //     final container = ProviderContainer(
  //       overrides: [sharedPrefProvider.overrideWithValue(sharedPrefs)],
  //     );
  //     addTearDown(container.dispose);
  //     expect(container.read(settingsStateNotifierProvider),
  //         const SettingsState.empty());
  //   },
  // );

  // group(
  //   'LoadTheme',
  //   () {},
  // );
}
