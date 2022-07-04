import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/pages/work_order_home_screen.dart';
import 'package:frontend/src/core/presentation/pages/workbase_menu_screen.dart';
import 'package:frontend/src/core/presentation/pages/worker_menu_screen.dart';
import 'package:frontend/src/fct/presentation/fct_screen.dart';
import 'package:frontend/src/fct/presentation/fct_serial_screen.dart';
import 'package:frontend/src/safety/presentation/screens/safety_check_screen.dart';
import 'package:frontend/src/safety/presentation/screens/safety_repair_screen.dart';
import 'package:frontend/src/safety/presentation/screens/safety_screen.dart';
import 'package:frontend/src/workorder/presentation/screens/qm_details_screen.dart';
import 'package:frontend/src/workorder/presentation/screens/qm_work_order_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/auth/presentation/sign_in_screen.dart';
import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/cutting/presentation/request/cutting_request_screen.dart';
import 'package:frontend/src/cutting/presentation/serial/cutting_serials_screen.dart';
import 'package:frontend/src/settings/settings_screen.dart';

import 'app_route_observer.dart';

final appRouterProvider = Provider(
  (ref) => AppRouter(
    authNotifier: ref.watch(authChangeNotifierProvider),
    observer: ref.watch(routeObserverProvider),
  ),
);

/// Navigator 2.0에 기반한 라우터
/// powered by go_router package

class AppRouter extends GoRouter {
  final AuthChangeNotifier authNotifier;
  final RouteObserver<ModalRoute> observer;

  AppRouter({
    required this.authNotifier,
    required this.observer,
  }) : super(
          // initialLocation: '/',
          initialLocation: '/',

          /// remove hash from url
          urlPathStrategy: UrlPathStrategy.path,

          /// route observer for screen transition
          observers: [observer],

          /// redirect if not logged in
          redirect: (state) {
            /// Auth 관련된 StateNotifier 값을 불러오기 위한 절차

            /// login 했는지 여부
            final loggedIn = authNotifier.isLoggedIn;

            /// login 페이지로 향하고 있는지 여부
            bool isLogging = state.location == "/sign-in";

            if (!loggedIn && !isLogging) return "/sign-in";

            if (loggedIn && isLogging) {
              return "/";
            }
            // if (loggedIn && isLogging) return "/";

            return null;
          },

          /// ChangeNotifier를 사용할 때 사용할 수 있음
          refreshListenable: authNotifier,
          routes: [
            /// 사용자 메뉴
            GoRoute(
              name: 'menu',
              path: '/',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  // child: const HomeScreen(),
                  child: const WorkerMenuScreen(),
                  transitionDuration: const Duration(milliseconds: 1200),
                  transitionsBuilder:
                      (context, animation, secondAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                              begin: const Offset(1, 0),
                              end: const Offset(0, 0))
                          .chain(CurveTween(curve: Curves.easeInOutExpo))
                          .animate(animation),
                      child: child,
                    );
                  },
                );
              },
              routes: [],
            ),

            /// 로그인 화면
            GoRoute(
              name: 'auth',
              path: '/sign-in',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const SignInScreen(),
                  transitionDuration: const Duration(milliseconds: 1200),
                  transitionsBuilder:
                      (context, animation, secondAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                              begin: const Offset(-1, 0),
                              end: const Offset(0, 0))
                          .chain(CurveTween(curve: Curves.easeInOutExpo))
                          .animate(animation),
                      child: child,
                    );
                  },
                );
              },
            ),

            /// 관리자 Workbase / 사용자 Workbase
            GoRoute(
              name: 'workbase',
              path: '/workbase',
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: WorkbaseMenuScreen(),
                );
              },
            ),

            /// 홈 화면
            GoRoute(
              name: 'work-order',
              path: '/work-order',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  // child: const HomeScreen(),
                  child: const WorkOrderHomeScreen(),
                );
              },
            ),

            /// 설정 화면
            GoRoute(
              name: 'settings',
              path: '/settings',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const SettingsScreen(),
                );
              },
            ),

            /// 검사 1 화면: 검사항목 리스트

            GoRoute(
              name: "cut",
              path: '/cut',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const CuttingSerialsScreen(),
                );
              },
              routes: [
                GoRoute(
                  name: "cut-request",
                  path: "request",
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      key: state.pageKey,
                      child: const CuttingRequestScreen(),
                    );
                  },
                ),
              ],
            ),

            /// FCT 화면
            GoRoute(
              name: "fct",
              path: '/fct',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const FctSerialScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: "request",
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      key: state.pageKey,
                      child: const FctScreen(),
                    );
                  },
                ),
              ],
            ),

            /// QM 화면
            GoRoute(
              name: "qm",
              path: '/qm',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const QmWorkOrderScreen(),
                );
              },
              routes: [
                GoRoute(
                  name: "qm-details",
                  path: ':index',
                  pageBuilder: (context, state) {
                    final index = int.parse(state.params["index"]!);
                    return MaterialPage(
                      key: state.pageKey,
                      child: QmDetailsScreen(index: index),
                    );
                  },
                  routes: [],
                ),
              ],
            ),

            /// 안전 / 설장비 화면
            GoRoute(
              name: "safety",
              path: '/safety',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: SafetyScreen(
                    title: state.extra! as String,
                  ),
                );
              },
              routes: [
                GoRoute(
                  name: "safety-check",
                  path: "check",
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      key: state.pageKey,
                      child: const SafetyCheckScreen(),
                    );
                  },
                ),
                GoRoute(
                  name: "safety-repair",
                  path: "repair",
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      key: state.pageKey,
                      child: const SafetyRepairScreen(),
                    );
                  },
                ),
              ],
            ),
          ],
        );
}
