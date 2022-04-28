import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/src/auth/application/auth_event.dart';
import 'package:frontend/src/auth/application/auth_state.dart';
import 'package:frontend/src/auth/dependency_injection.dart';
import 'package:frontend/src/auth/domain/entities/user.dart';
import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/settings/settings_scope.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/routes/app_router.dart';
import 'package:frontend/src/core/themes/app_theme.dart';

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
            .read(authStateNotifierProvider.notifier)
            .mapEventToState(const AuthEvent.loadStoredUser());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _router = ref.watch(appRouterProvider);
    ref.listen<AuthState>(authStateNotifierProvider, (previous, current) {
      current.when(
        initial: () {},
        loading: () {},
        unauthenticated: () {
          ref.read(authChangeNotifierProvider).emptyUser();
        },
        authenticated: (User user) {
          ref.read(authChangeNotifierProvider).setUser(user);
        },
        failure: (String message) {},
      );
    });

    return MaterialApp.router(
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
