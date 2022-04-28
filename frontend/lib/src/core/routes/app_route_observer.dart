import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routeObserverProvider = Provider<RouteObserver<ModalRoute>>(
  (ref) => RouteObserver(),
);

class AppRouteObserver extends RouteObserver<ModalRoute> {
  AppRouteObserver() {
    // log.onRecord.listen((e) => debugPrint("$e"));
  }

  // final log = Logger("AppRouteObserver");

  // @override
  // void didPush(Route route, Route? previousRoute) {
  //   log.info("didPush: ${route.str}, previousRoute: ${previousRoute?.str}");
  // }

  // @override
  // void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
  //     log.info('didPop: ${route.str}, previousRoute= ${previousRoute?.str}');

  // @override
  // void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
  //     log.info('didRemove: ${route.str}, previousRoute= ${previousRoute?.str}');

  // @override
  // void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
  //     log.info('didReplace: new= ${newRoute?.str}, old= ${oldRoute?.str}');

  // @override
  // void didStartUserGesture(
  //   Route<dynamic> route,
  //   Route<dynamic>? previousRoute,
  // ) =>
  //     log.info('didStartUserGesture: ${route.str}, '
  //         'previousRoute= ${previousRoute?.str}');

  // @override
  // void didStopUserGesture() => log.info('didStopUserGesture');
}

  

// extension on Route<dynamic> {
//   String get str => 'route(${settings.name}: ${settings.arguments})';
// }