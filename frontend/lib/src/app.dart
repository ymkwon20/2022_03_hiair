import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/src/auth/application/auth_event.dart';
import 'package:frontend/src/auth/application/auth_state.dart';
import 'package:frontend/src/auth/dependency_injection.dart';
import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/presentation/routes/app_router.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/settings/settings_scope.dart';
import 'package:frontend/src/work_base/application/work_base_event.dart';
import 'package:frontend/src/work_base/application/work_base_state.dart';
import 'package:frontend/src/work_base/dependency_injection.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
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
        current.when(
          initial: () {},
          loading: () {},
          unauthenticated: () {
            ref.read(authChangeNotifierProvider).emptUser();
          },
          authenticated: (user) {
            ref.read(authChangeNotifierProvider).setUser(user);

            ref
                .read(workBaseStateNotifierProvider.notifier)
                .mapEventToState(const WorkBaseEvent.fetchWorkBases());
          },
          failure: (message) {
            showFlashBar(
              context,
              title: "조회 오류",
              content: "로그인에 실패했습니다. \n$message",
              backgroundColor: Theme.of(context).errorColor,
            );
          },
        );
      },
    );

    ref.listen<WorkBaseState>(
      workBaseStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          loaded: (items) {
            ref
                .read(workBaseChangeNotifierProvider.notifier)
                .setWorkBases(items);
          },
          failure: (message) {
            showFlashBar(
              context,
              title: "조회 오류",
              content: "메뉴 목록을 조회하는데 실패했습니다.\n$message",
              backgroundColor: Theme.of(context).errorColor,
            );
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
