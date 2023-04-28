import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/pages/table_failure_row.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/sub_app_bar.dart';
import 'package:frontend/src/core/presentation/widgets/table_loading_row.dart';
import 'package:frontend/src/workorderCurrent/application/current_work_order_event.dart';
import 'package:frontend/src/workorderCurrent/presentation/dependency_injection.dart';
import 'package:frontend/src/workorderCurrent/presentation/pages/current_work_order_popup.dart';
import 'package:frontend/src/workorderCurrent/presentation/pages/tablerows/current_work_order_loaded_row.dart';
import 'package:frontend/src/workorderCurrent/presentation/viewmodels/current_work_order_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentWorkOrderScreen extends ConsumerStatefulWidget {
  const CurrentWorkOrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CurrentWorkOrderScreen> createState() =>
      _CurrentWorkOrderListWidgetState();
}

class _CurrentWorkOrderListWidgetState
    extends ConsumerState<CurrentWorkOrderScreen>
    with SingleTickerProviderStateMixin, RouteAware {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(currentWorkOrderListNotifier.notifier).clear();
        _fetchCurrentItems();
      },
    );
  }

  Future<void> _fetchCurrentItems() async {
    await ref
        .read(currentWorkOrderStateNotifierProvider.notifier)
        .mapEventToState(
          CurrentWorkOrderEvent.fetchCurrentWorkOrder(
            ref.watch(currentWorkOrderListNotifier).items,
            '',
            '',
          ),
        );
  }

  void _onTap(int index) {
    // if (ref.watch(currentWorkOrderListNotifier).isMultiSelectMode) {
    //   ref.read(workOrderListNotifier).toggleSelectState(index);
    // } else {

    Navigator.of(context).push(
      CustomSlideRoute(
        backgroundColor: Colors.black.withOpacity(.2),
        builder: (context) => ProviderScope(
          overrides: [
            currentWorkOrderIndexNotifier.overrideWithValue(index),
            currentWorkOrderNotifier.overrideWithValue(
                ref.watch(currentWorkOrderListNotifier).items[index]),
          ],
          child: CurrentWorkOrderPopup(
            workOrder:
                ref.watch(currentWorkOrderListNotifier).filteredItems[index],
          ),
        ),
      ),
    );
    // }
  }

  void _navigateTo(String filterKey) {
    ref.watch(currentWorkOrderStateNotifierProvider).maybeWhen(
          loaded: (_) {
            ref.read(tableColumnNotifier.notifier).state = filterKey;
            Navigator.of(context).push(
              CustomScaleRoute(
                backgroundColor: Colors.black.withOpacity(.2),
                builder: (_) =>
                    CurrentWorkOrderFilterDialog(filterKey: filterKey),
              ),
            );
          },
          orElse: () {},
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(currentWorkOrderStateNotifierProvider);
    final orderListNotifier = ref.watch(currentWorkOrderListNotifier);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SubAppBar(
        code: 'CURRENT_WORK_ORDER',
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: ((notification) {
              return false;
            }),
            child: CustomTable(
              onRowPressed: (index) {
                state.maybeWhen(
                  loaded: (_) {
                    _onTap(index);
                  },
                  orElse: () {},
                );
              },
              headers: [
                CustomTableHeader(
                  name: "wbNm",
                  title: "현공정",
                  width: 200,
                  onTap: ref.read(currentWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("wbNm");
                  },
                  children: _buildAdditionalIcons("wbNm"),
                ),
                CustomTableHeader(
                  name: "yard",
                  title: "Yard",
                  width: 150,
                  onTap: ref.read(currentWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("yard");
                  },
                  children: _buildAdditionalIcons("yard"),
                ),
                CustomTableHeader(
                  name: "hullNo",
                  title: "Hull No",
                  width: 150,
                  onTap: ref.read(currentWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("hullNo");
                  },
                  children: _buildAdditionalIcons("hullNo"),
                ),
                CustomTableHeader(
                  name: "ship",
                  title: "구역",
                  onTap: ref.read(currentWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("ship");
                  },
                  children: _buildAdditionalIcons("ship"),
                ),
                CustomTableHeader(
                  name: "sysNo",
                  title: "Sys No",
                  onTap: ref.read(currentWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("sysNo");
                  },
                  children: _buildAdditionalIcons("sysNo"),
                ),
                CustomTableHeader(
                  name: "PJTNo",
                  title: "SPEC",
                  width: 250,
                  onTap: ref.read(currentWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("PJTNo");
                  },
                  children: _buildAdditionalIcons("PJTNo"),
                ),
                CustomTableHeader(
                  name: "pndDate",
                  title: "PND",
                  width: 200,
                  onTap: ref.read(currentWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("pndDate");
                  },
                  children: _buildAdditionalIcons("pndDate"),
                ),
                CustomTableHeader(
                  name: "wonb",
                  title: "작업지시번호",
                  width: 200,
                  onTap: ref.read(currentWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("wonb");
                  },
                  children: _buildAdditionalIcons("wonb"),
                ),
                CustomTableHeader(
                  name: "wcNm",
                  title: "작업장",
                  width: 200,
                  onTap: ref.read(currentWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("wcNm");
                  },
                  children: _buildAdditionalIcons("wcNm"),
                ),
              ],
              rowBuilder: (context, index) {
                return state.when(
                  initial: (_) {
                    return TableLoadingRow();
                  },
                  loading: (results) {
                    if (index < orderListNotifier.filteredItems.length) {
                      return CurrentWorkOrderLoadedRow(
                        order: orderListNotifier.filteredItems[index],
                        color: _getColor(index),
                      );
                    } else {
                      return TableLoadingRow();
                    }
                  },
                  loaded: (_) {
                    return CurrentWorkOrderLoadedRow(
                      order: orderListNotifier.filteredItems[index],
                      color: _getColor(index),
                    );
                  },
                  failure: (results, message) {
                    if (index < orderListNotifier.filteredItems.length) {
                      return CurrentWorkOrderLoadedRow(
                          order: orderListNotifier.filteredItems[index]);
                    } else {
                      return TableFailureRow(message: message);
                    }
                  },
                );
              },
              rowCount: state.when(
                initial: (_) => orderListNotifier.filteredItems.length,
                loading: (prev) => orderListNotifier.filteredItems.length,
                loaded: (current) => orderListNotifier.filteredItems.length,
                failure: (prev, message) =>
                    orderListNotifier.filteredItems.length + 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor(int index) {
    Color color = Colors.transparent;
    final notifier = ref.watch(currentWorkOrderListNotifier);

    if (notifier.selectedIndex.contains(index)) {
      color = Theme.of(context).selectedRowColor;
    }

    return color;
  }

  List<Widget> _buildAdditionalIcons(String key) {
    final children = <Widget>[];

    // sort icon
    if (ref.watch(currentWorkOrderListNotifier).sortedColumn[key] == null) {
    } else if (ref.watch(currentWorkOrderListNotifier).sortedColumn[key]!) {
      children.add(const Icon(Icons.arrow_upward));
    } else {
      children.add(const Icon(Icons.arrow_downward));
    }

    // filter icon
    if (ref.watch(currentWorkOrderListNotifier).filterMap[key] != null) {
      children.add(const Icon(Icons.filter_alt));
    }

    return children;
  }
}
