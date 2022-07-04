import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/src/auth/application/auth_event.dart';
import 'package:frontend/src/auth/application/auth_state.dart';
import 'package:frontend/src/auth/dependency_injection.dart';
import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/presentation/routes/app_router.dart';
import 'package:frontend/src/settings/settings_scope.dart';
import 'package:frontend/src/version/application/version_event.dart';
import 'package:frontend/src/version/infrastructure/dependency_injection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/presentation/app_theme.dart';

/// The Widget that configures your application.
class AppWidget extends ConsumerStatefulWidget {
  const AppWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AppWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<AppWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        ref
            .read(versionStateNotifierProvider.notifier)
            .mapEventToState(const VersionEvent.checkVersion());
        ref
            .read(authStateNotifierProvider.notifier)
            .mapEventToState(const AuthEvent.loadStoredUser());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _router = ref.watch(appRouterProvider);
    ref.listen<AuthState>(
      authStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          unauthenticated: () {
            ref.read(authChangeNotifierProvider).emptUser();
          },
          authenticated: (user) {
            ref.read(authChangeNotifierProvider).setUser(user);
          },
          orElse: () {},
        );
      },
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: SettingsScope.of(context).themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
