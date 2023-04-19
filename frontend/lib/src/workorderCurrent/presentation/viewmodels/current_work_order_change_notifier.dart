import 'package:flutter/cupertino.dart';
import 'package:frontend/src/workorderCurrent/presentation/pages/current_work_order_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentWorkOrderChangeNotifierProvider = ChangeNotifierProvider(
  (ref) => CurrentWorkOrderChangeNotifier(),
);

class CurrentWorkOrderChangeNotifier extends ChangeNotifier {
  Widget page = const CurrentWorkOrderScreen();
}
