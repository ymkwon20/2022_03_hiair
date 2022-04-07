import 'package:flutter/material.dart';
import 'package:frontend/src/auth/presentation/sign_in_screen.dart';
import 'package:frontend/src/core/pages/home_screen.dart';
import 'package:frontend/src/cutting/presentation/request/cutting_request_screen.dart';
import 'package:frontend/src/cutting/presentation/serial/cutting_serials_screen.dart';
import 'package:frontend/src/inspection/presentation/prototypes/qm_product_details_screen.dart';
import 'package:frontend/src/inspection/presentation/screens/qm_product_list_screen.dart';
import 'package:frontend/src/settings/settings_screen.dart';
import 'package:go_router/go_router.dart';

/// Navigator 2.0에 기반한 라우터
/// powered by go_router package
class AppRouter extends GoRouter {
  AppRouter()
      : super(
          initialLocation: '/',

          /// remove hash from url
          urlPathStrategy: UrlPathStrategy.path,
          routes: [
            /// 로그인 화면
            GoRoute(
              name: 'auth',
              path: '/sign-in',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const SignInScreen(),
                );
              },
            ),

            /// 홈 화면
            GoRoute(
              name: 'home',
              path: '/',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const HomeScreen(),
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
              name: 'qm1',
              path: '/qm',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const QmProductListScreen(),
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
                      final productNo = state.params['id']!;
                      return MaterialPage(
                        key: state.pageKey,
                        child: QmProductDetailsScreen(
                          projectNo: productNo,
                        ),
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
                    }),
              ],
            ),
          ],
        );
}
