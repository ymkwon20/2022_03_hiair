import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/work_order_app_bar.dart';
import 'package:frontend/src/workorderCurrent/presentation/viewmodels/current_work_order_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentWorkOrderHomeScreen extends ConsumerWidget {
  const CurrentWorkOrderHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const WorkOrderAppBar(
        title: "현 공정 조회",
      ),
      body: ref.watch(currentWorkOrderChangeNotifierProvider).page,
    );
  }
}
