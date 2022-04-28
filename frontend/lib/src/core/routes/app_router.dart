import 'package:flutter/material.dart';
import 'package:frontend/src/fct/presentation/fct_screen.dart';
import 'package:frontend/src/fct/presentation/fct_serial_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/auth/presentation/sign_in_screen.dart';
import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/pages/home_alter_screen.dart';
import 'package:frontend/src/core/routes/app_route_observer.dart';
import 'package:frontend/src/cutting/presentation/request/cutting_request_screen.dart';
import 'package:frontend/src/cutting/presentation/serial/cutting_serials_screen.dart';
import 'package:frontend/src/qm/presentation/prototypes/qm_product_details_screen.dart';
import 'package:frontend/src/qm/presentation/screens/qm_screen.dart';
import 'package:frontend/src/settings/settings_screen.dart';

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

            /// 홈 화면
            GoRoute(
              name: 'home',
              path: '/',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  // child: const HomeScreen(),
                  child: const HomeAlterScreen(),
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
              routes: [
                // GoRoute(
                //     path: 'qm',
                //     builder: (context, state) {
                //       return const QmScreen();
                //     }),
                // GoRoute(
                //     path: 'cut',
                //     builder: (context, state) {
                //       return const CuttingSerialsScreen();
                //     }),
                // GoRoute(
                //     path: 'fct',
                //     builder: (context, state) {
                //       return const FctSerialScreen();
                //     }),
              ],
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
              name: 'qm1',
              path: '/qm',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const QmScreen(),
                );
              },
              routes: [
                /// 검사 2 화면: 검사항목 세부사항
                // GoRoute(
                //     name: 'qm2',
                //     path: ':id', // /qm/23120323
                //     pageBuilder: (context, state) {
                //       final productNo = state.params['id']!;
                //       return MaterialPage(
                //         key: state.pageKey,
                //         child: QmProductDetailsScreen(
                //           projectNo: productNo,
                //         ),
                //       );
                //     }),

                /// (Prototype) 검사 2 화면: 검사항목 세부사항
                GoRoute(
                    name: 'qm2-2',
                    path: ':id', // /qm/23120323
                    pageBuilder: (context, state) {
                      return MaterialPage(
                        key: state.pageKey,
                        child: const QmProductDetailsScreen(),
                      );
                    }),
              ],
            ),
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

            /// FCT 화면  ),
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
            )
          ],
        );
}
