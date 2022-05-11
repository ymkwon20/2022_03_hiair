import 'package:flutter/material.dart';
import 'package:frontend/src/fct/application/fct/fct_event.dart';
import 'package:frontend/src/fct/application/serial/fct_serial_event.dart';
import 'package:frontend/src/fct/application/serial/fct_serial_state.dart';
import 'package:frontend/src/fct/dependency_injection.dart';
import 'package:frontend/src/fct/presentation/tablerows/serial/fct_serial_loaded_row.dart';
import 'package:frontend/src/fct/presentation/tablerows/serial/fct_serial_loading_row.dart';
import 'package:frontend/src/workorder/presentation/screens/custom_table.dart';
import 'package:frontend/src/workorder/presentation/screens/tablerows/work_order_failure_row.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

late StateProvider<List<String>> fctSerialProvider;

class FctSerialScreen extends ConsumerStatefulWidget {
  const FctSerialScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FctSerialScreen> createState() => _FctScreenState();
}

class _FctScreenState extends ConsumerState<FctSerialScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref
        .read(fctSerialStateNotifierProvider.notifier)
        .mapEventToState(const FctSerialEvent.getFctSerials()));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<FctSerailState>(
      fctSerialStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          loaded: (serials) {
            fctSerialProvider = StateProvider((ref) => serials);
          },
          orElse: () {},
        );
      },
    );

    final state = ref.watch(fctSerialStateNotifierProvider);
    return Scaffold(
        body: CustomTable(
      onRowPressed: (index) {
        ref.read(fctStateNotifierProvider.notifier).mapEventToState(
            FctEvent.getFctItems(
                ref.watch(fctSerialProvider.notifier).state[index]));

        context.push("/fct/request");
      },
      onRefresh: () async {},
      headers: const [
        CustomTableHeader(title: "날짜", width: 130),
      ],
      rowBuilder: (context, index) {
        return state.when(
          init: () {
            return FctSerialLoadingRow();
          },
          loading: () {
            return FctSerialLoadingRow();
          },
          loaded: (serials) {
            return FctSerialLoadedRow(serial: serials[index]);
          },
          failure: (message) {
            return WorkOrderFailureRow(message: message);
          },
        );
      },
      rowCount: state.when(
          init: () => 0,
          loading: () => 1,
          loaded: (current) => current.length.toInt(),
          failure: (message) => 1),
    ));
  }
}
