import 'package:flutter/material.dart';
import 'package:frontend/src/cutting/presentation/serial/cutting_serials_screen.dart';
import 'package:go_router/go_router.dart';

class HomeRouterNotifier extends ChangeNotifier {
  HomeRouterNotifier({required this.rootRouter});

  final GoRouter rootRouter;

  // ignore: unused_field
  var _currentTabIndex = 0;

  set currentIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  final TabInfo cutTabInfo = TabInfo(
    id: "cut",
    router: GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
          path: "/",
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const CuttingSerialsScreen(),
            );
          },
        ),
      ],
    ),
  );
}

class TabInfo {
  final String id;
  final GoRouter router;

  const TabInfo({
    required this.id,
    required this.router,
  });
}
