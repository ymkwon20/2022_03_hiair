import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/index.dart';
import 'package:frontend/src/cutting/presentation/request/cutting_check_list_widget.dart';
import 'package:frontend/src/cutting/presentation/serial/cutting_serials_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/widgets/index.dart';
import 'package:frontend/src/cutting/dependency_injection.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_request.dart';

class CuttingRequestPage extends ConsumerWidget {
  const CuttingRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cuttingRequestsStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: state.when(
        initial: () => const InitialStateWidget(),
        loading: () => const LoadingStateWidget(),
        loaded: (checks) => CuttingRequestListView(items: checks),
        failure: (String message) => FailureStateWidget(message: message),
      ),
    );
  }
}

class CuttingRequestListView extends ConsumerWidget {
  const CuttingRequestListView({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<CuttingRequest> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: LayoutConstant.spaceL),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                showCheckboxColumn: false,
                columns: const [
                  DataColumn(label: Text('원재료 품명')),
                  DataColumn(label: Text('원재료 규격')),
                  DataColumn(label: Text('수량')),
                  DataColumn(label: Text('CAM No.')),
                  DataColumn(label: Text('Comment')),
                  DataColumn(label: Text('Remark')),
                ],
                rows: List.generate(
                  items.length,
                  (index) => DataRow(
                    onSelectChanged: (bool? _) {},
                    onLongPress: () {},
                    cells: [
                      DataCell(Text(items[index].metalCd)),
                      DataCell(Text(
                          "${items[index].thickness}*${items[index].width}*${items[index].length}")),
                      DataCell(Text("${items[index].qty}")),
                      DataCell(Text(items[index].camNo)),
                      const DataCell(
                        TextField(
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      const DataCell(
                        TextField(
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceL),
          Image.network(
            "${LogicConstant.baseImageServerUrl}/${ref.watch(cuttingSerialProvider).imageFileNm}",
            fit: BoxFit.contain,
          ),
          const CuttingCheckListWidget(),
        ],
      ),
    );
  }
}
