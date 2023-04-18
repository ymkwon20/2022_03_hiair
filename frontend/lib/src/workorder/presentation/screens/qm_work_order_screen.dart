import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/home_app_bar.dart';
import 'package:frontend/src/workorder/application/qm_work_order/load/qm_work_order_event.dart';
import 'package:frontend/src/workorder/application/qm_work_order/load/qm_work_order_state.dart';
import 'package:frontend/src/workorder/application/qm_work_order/save/qm_work_order_save_event.dart';
import 'package:frontend/src/workorder/application/qm_work_order/save/qm_work_order_save_state.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order.dart';
import 'package:frontend/src/workorder/presentation/screens/tablerows/qm_work_order_loaded_row.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/qm_work_order_list_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/presentation/routes/app_route_observer.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/core/presentation/pages/table_failure_row.dart';
import 'package:frontend/src/core/presentation/widgets/table_loading_row.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/work_order_list_notifier.dart';

late AutoDisposeStateProvider<QmWorkOrder> currentQmWorkOrder;
late AutoDisposeStateProvider<int> currentQmWorkOrderIndex;

/// 검사 1화면: QM 검사 항목 리스트 제시
class QmWorkOrderScreen extends ConsumerStatefulWidget {
  const QmWorkOrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<QmWorkOrderScreen> createState() => _WorkOrderListWidgetState();
}

class _WorkOrderListWidgetState extends ConsumerState<QmWorkOrderScreen>
    with SingleTickerProviderStateMixin, RouteAware {
  /// scroll에 따른 새 아이템 불러오기 관련
  bool canLoadNextPage = false;
  bool ignoring = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(qmWorkOrderListNotifier.notifier).clear();
        _fetchQmItemsByPage();
      },
    );
  }

  @override
  void dispose() {
    ref.watch(routeObserverProvider).unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref
        .watch(routeObserverProvider)
        .subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void didPopNext() {
    setState(() {});
  }

  Future<void> _fetchQmItemsByPage() async {
    await ref.read(qmWorkOrderStateNotifierProvider.notifier).mapEventToState(
          const QmWorkOrderEvent.fetchListByPage(),
        );
  }

  void _onTap(int index) {
    ignoring = true;
    currentQmWorkOrder = StateProvider.autoDispose(
        (ref) => ref.watch(qmWorkOrderListNotifier).items[index]);
    currentQmWorkOrderIndex = StateProvider.autoDispose((ref) => index);

    context.push("/qm/$index");

    // GoRouter의 push method가 asynchronous가 아니기 때문에 임의 시간 지정
    Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
      () {
        ignoring = false;
      },
    );
  }

  void _navigateTo(String filterKey) {
    ref.watch(qmWorkOrderStateNotifierProvider).maybeWhen(
          loaded: (_, __) {
            // ref.read(tableColumnNotifier.notifier).state = filterKey;
            // Navigator.of(context).push(
            //   CustomScaleRoute(
            //     backgroundColor: Colors.black.withOpacity(.2),
            //     builder: (_) => CustomTableHeaderDialog(filterKey: filterKey),
            //   ),
            // );
          },
          orElse: () {},
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(qmWorkOrderStateNotifierProvider);
    final orderListNotifier = ref.watch(qmWorkOrderListNotifier);

    ref.listen<QmWorkOrderState>(qmWorkOrderStateNotifierProvider,
        ((previous, current) {
      current.when(
        initial: () {
          canLoadNextPage = true;
        },
        loading: () {
          canLoadNextPage = false;
        },
        loaded: (orders, isNextPageAvailable) {
          canLoadNextPage = isNextPageAvailable;
          ref.read(qmWorkOrderListNotifier.notifier).setOrderList(orders);
        },
        failure: (message) {
          canLoadNextPage = true;
        },
      );
    }));

    ref.listen<QmWorkOrderSaveState>(
      qmWorkOrderSaveStateNotifierProvider,
      ((previous, current) {
        current.when(
          none: () {},
          saving: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const SavingDialog();
              },
            );
          },
          saved: (index) {
            Navigator.pop(context);
            ref.read(qmWorkOrderListNotifier.notifier).clearSelection();

            showFlashBar(
              context,
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );

            ref
                .read(qmWorkOrderSaveStateNotifierProvider.notifier)
                .mapEventToState(const QmWorkOrderSaveEvent.resetToNone());
          },
          failure: (message) {
            Navigator.pop(context);
            showFlashBar(
              context,
              title: "오류",
              content: "저장에 실패했습니다. $message",
              backgroundColor: Theme.of(context).errorColor,
            );

            ref
                .read(workOrderSaveStateNotifierProvider.notifier)
                .mapEventToState(const WorkOrderSaveEvent.resetToNone());
          },
        );
      }),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const HomeAppBar(title: "QM 검사"),
      body: Stack(
        fit: StackFit.expand,
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: ((notification) {
              if (notification.metrics.axis == Axis.vertical) {
                final metrics = notification.metrics;
                final limit =
                    metrics.maxScrollExtent - metrics.viewportDimension / 3;

                if (canLoadNextPage && metrics.pixels >= limit) {
                  canLoadNextPage = false;
                  _fetchQmItemsByPage();
                }
              }

              return false;
            }),
            child: CustomTable(
              onRowLongPressed: (index) {
                state.maybeWhen(
                  loaded: (_, __) {
                    ref.read(workOrderListNotifier).toggleSelectState(index);
                  },
                  orElse: () {},
                );
                ref
                    .read(workOrderSaveStateNotifierProvider.notifier)
                    .mapEventToState(const WorkOrderSaveEvent.resetToNone());
              },
              onRowPressed: (index) {
                state.maybeWhen(
                  loaded: (_, __) {
                    if (!ignoring) {
                      _onTap(index);
                    }
                  },
                  orElse: () {},
                );
              },
              onRefresh: () async {
                ref.read(workOrderListNotifier.notifier).clear();
                await _fetchQmItemsByPage();
              },
              headers: [
                CustomTableHeader(
                  name: "wbNm",
                  title: "현공정",
                  width: 200,
                  onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("wbNm");
                  },
                  children: _buildAdditionalIcons("wbNm"),
                ),
                CustomTableHeader(
                  name: "date",
                  title: "검사완료일",
                  width: 200,
                  onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("date");
                  },
                  children: _buildAdditionalIcons("date"),
                ),
                CustomTableHeader(
                  name: "yard",
                  title: "Yard",
                  width: 150,
                  onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("yard");
                  },
                  children: _buildAdditionalIcons("yard"),
                ),
                CustomTableHeader(
                  name: "hullNo",
                  title: "Hull No",
                  width: 150,
                  onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("hullNo");
                  },
                  children: _buildAdditionalIcons("hullNo"),
                ),
                CustomTableHeader(
                  name: "ship",
                  title: "구역",
                  onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("ship");
                  },
                  children: _buildAdditionalIcons("ship"),
                ),
                CustomTableHeader(
                  name: "sysNo",
                  title: "Sys No",
                  onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("sysNo");
                  },
                  children: _buildAdditionalIcons("sysNo"),
                ),
                CustomTableHeader(
                  name: "partNO",
                  title: "품번",
                  width: 130,
                  onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("partNO");
                  },
                  children: _buildAdditionalIcons("partNO"),
                ),
                CustomTableHeader(
                  name: "qty",
                  title: "수량",
                  onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                  width: 100,
                  children: _buildAdditionalIcons("qty"),
                ),
              ],
              rowBuilder: (context, index) {
                return state.when(
                  initial: () {
                    return TableLoadingRow();
                  },
                  loading: () {
                    return TableLoadingRow();
                  },
                  loaded: (_, __) {
                    return QmWorkOrderLoadedRow(
                      order: orderListNotifier.filteredItems[index],
                    );
                  },
                  failure: (message) {
                    return TableFailureRow(message: message);
                  },
                );
              },
              rowCount: state.when(
                initial: () => orderListNotifier.filteredItems.length,
                loading: () => 200,
                loaded: (current, _) => orderListNotifier.filteredItems.length,
                failure: (message) => 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAdditionalIcons(String key) {
    final children = <Widget>[];

    // sort icon
    if (ref.watch(qmWorkOrderListNotifier).sortedColumn[key] == null) {
    } else if (ref.watch(qmWorkOrderListNotifier).sortedColumn[key]!) {
      children.add(const Icon(Icons.arrow_upward));
    } else {
      children.add(const Icon(Icons.arrow_downward));
    }

    // filter icon
    if (ref.watch(qmWorkOrderListNotifier).filterMap[key] != null) {
      children.add(const Icon(Icons.filter_alt));
    }

    return children;
  }
}
