import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:frontend/src/cutting/application/check/fetch/cutting_check_event.dart';
import 'package:frontend/src/cutting/application/request/cutting_request_event.dart';
import 'package:frontend/src/cutting/application/serial/cutting_serial_event.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/cutting/dependency_injection.dart';

class CuttingSerialsPage extends ConsumerStatefulWidget {
  const CuttingSerialsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CuttingSerialsPage> createState() => _CuttingSerialsPageState();
}

class _CuttingSerialsPageState extends ConsumerState<CuttingSerialsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref
            .read(cuttingSerialsStateNotifierProvider.notifier)
            .mapEventToState(const CuttingSerialEvent.getSerials());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cuttingSerialsStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "네스팅 요청서 작성",
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: state.when(
        initial: () => const InitialStateWidget(),
        loading: () => const LoadingStateWidget(),
        loaded: (List<CuttingSerial> serials) =>
            CuttingSerialListTable(items: serials),
        failure: (String message) => FailureStateWidget(message: message),
      ),
    );
  }
}

/// CuttingRequestPage에서 쓰기 위한 객체 injector
late StateProvider<CuttingSerial> cuttingSerialProvider;

class CuttingSerialListTable extends ConsumerWidget {
  const CuttingSerialListTable({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<CuttingSerial> items;

  void _pushToNext(BuildContext context, WidgetRef ref, CuttingSerial serial) {
    cuttingSerialProvider = StateProvider<CuttingSerial>((ref) => serial);

    ref.read(cuttingRequestsStateNotifierProvider.notifier).mapEventToState(
          CuttingRequestEvent.fetchRequest(serial),
        );
    ref.read(cuttingChecksStateNotifierProvider.notifier).mapEventToState(
          CuttingCheckEvent.fetchChecks(serial),
        );
    context.pushNamed("cut-request");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: DataTable(
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text('요청일자')),
          DataColumn(label: Text('요청순번')),
          DataColumn(label: Text('긴급여부')),
          DataColumn(label: Text('작업시작일')),
          DataColumn(label: Text('작업완료일')),
        ],
        rows: List.generate(
          items.length,
          (index) => DataRow(
            onSelectChanged: (bool? _) {
              _pushToNext(context, ref, items[index]);
            },
            onLongPress: () {
              _pushToNext(context, ref, items[index]);
            },
            cells: [
              DataCell(Text(items[index].dateRequested)),
              DataCell(Text("${items[index].seq}")),
              DataCell(Text(items[index].urgencyStatus)),
              DataCell(Text(items[index].dateStart)),
              DataCell(Text(items[index].dateEnd)),
            ],
          ),
        ),
      ),
    );
  }
}
