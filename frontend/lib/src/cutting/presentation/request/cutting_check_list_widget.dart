import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/application/load/checklist_event.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_popup.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:frontend/src/cutting/presentation/request/viewmodels/cutting_checks_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/cutting/dependency_injection.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';

final standardCuttingCheck = Provider<CuttingCheck>(
  (ref) => throw UnimplementedError(),
);

class CuttingCheckListWidget extends ConsumerWidget {
  const CuttingCheckListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cuttingChecksStateNotifierProvider);
    return state.when(
      initial: () => const InitialStateWidget(),
      loading: () => const LoadingStateWidget(),
      loaded: (checks) {
        cuttingChecksProvider =
            StateNotifierProvider<CuttingChecks, List<CuttingCheck>>(
          (ref) => CuttingChecks(checks),
        );
        return const _CuttingCheckWidget();
      },
      failure: (message) => FailureStateWidget(message: message),
    );
  }
}

class _CuttingCheckWidget extends ConsumerWidget {
  const _CuttingCheckWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const headerStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    const bodyStyle = TextStyle(fontSize: 18);

    final items = ref.watch(cuttingChecksProvider);

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          showCheckboxColumn: false,
          columns: const [
            DataColumn(
                label: Text(
              'WorkOrder',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              'Yard',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              'Hull\nNo',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              'SysNo',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              'Spec',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              'Size',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              '수량',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              'PND',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              '두께',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              '가로',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              '세로',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              'DOOR\n길이',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              '홀(상/하)',
              style: headerStyle,
            )),
            DataColumn(
                label: Text(
              '특이사항',
              style: headerStyle,
            )),
          ],
          rows: List.generate(
            items.length,
            (index) => DataRow(
              onSelectChanged: (bool? _) {
                ref
                    .read(checklistStateNotifierProvider.notifier)
                    .mapEventToState(
                      ChecklistEvent.fetchChecklistForCut(items[index]),
                    );

                Navigator.of(context).push(
                  CustomSlideRoute(
                    backgroundColor: Colors.black.withOpacity(.2),
                    builder: (context) => const ChecklistPopup(),
                  ),
                );
                // showDialog(
                //   context: context,
                //   barrierColor: Colors.black12,
                //   barrierDismissible: true,
                //   builder: (context) {
                //     return ProviderScope(overrides: [
                //       standardCuttingCheck.overrideWithValue(items[index]),
                //       cuttingCheckResultNotifier
                //           .overrideWithValue(CuttingCheckResultNotifier()),
                //     ], child: const CuttingCheckDialog());
                //   },
                // );
              },
              onLongPress: () {},
              cells: [
                DataCell(Text(
                  items[index].workOrder,
                  style: bodyStyle,
                )),
                DataCell(Text(
                  items[index].yard,
                  style: bodyStyle,
                )),
                DataCell(Text(
                  items[index].hullNo,
                  style: bodyStyle,
                )),
                DataCell(Text(
                  items[index].sysNo,
                  style: bodyStyle,
                )),
                DataCell(Text(
                  items[index].spec,
                  style: bodyStyle,
                )),
                DataCell(Text(
                  items[index].size,
                  style: bodyStyle,
                )),
                DataCell(Text(
                  "${items[index].qty}",
                  style: bodyStyle,
                )),
                DataCell(Text(
                  items[index].datePlanned,
                  style: bodyStyle,
                )),
                DataCell(Text(
                  "${items[index].thickness}",
                  style: bodyStyle,
                )),
                DataCell(Text(
                  "${items[index].width}",
                  style: bodyStyle,
                )),
                DataCell(Text(
                  "${items[index].height}",
                  style: bodyStyle,
                )),
                DataCell(Text(
                  "${items[index].doorLength}",
                  style: bodyStyle,
                )),
                DataCell(Text(
                  items[index].hullDiameter,
                  style: bodyStyle,
                )),
                const DataCell(Text(
                  "",
                  style: bodyStyle,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
