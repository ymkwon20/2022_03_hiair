import 'package:frontend/src/auth/presentation/sign_in_screen.dart';
import 'package:frontend/src/core/pages/home_screen.dart';
import 'package:frontend/src/settings/settings_screen.dart';
import 'package:frontend/src/work_progress/presentation/plasma_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter extends GoRouter {
  AppRouter()
      : super(
          initialLocation: '/sign-in',
          routes: [
            GoRoute(
              path: '/sign-in',
              builder: (context, state) {
                return const SignInScreen();
              },
            ),
            GoRoute(
              path: '/home',
              builder: (context, state) {
                return const HomeScreen();
              },
            ),
            GoRoute(
              path: '/settings',
              builder: (context, state) {
                return const SettingsScreen();
              },
            ),
            GoRoute(
              path: '/plasma',
              builder: (context, state) {
                return const PlasmaScreen();
              },
            ),
            GoRoute(
              path: '/plange',
              builder: (context, state) {
                return const PlangeScreen();
              },
            ),
            GoRoute(
              path: '/fan',
              builder: (context, state) {
                return const FanScreen();
              },
            ),
          ],
        );
}
