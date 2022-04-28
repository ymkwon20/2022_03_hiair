import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/src/settings/settings_scope.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsController = SettingsController(SettingsService());

  /// !Info: 관리자가 가로 방향만 지원하도록 요구
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
  );

  await settingsController.loadSettings();

  runApp(
    ProviderScope(
      child: SettingsScope(
        controller: settingsController,
        child: const AppWidget(),
      ),
    ),
  );
}
