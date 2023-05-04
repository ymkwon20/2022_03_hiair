import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/home_app_bar.dart';
import 'package:frontend/src/core/presentation/widgets/sub_app_bar_qm.dart';
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
    if (ref.watch(qmWorkOrderListNotifier).isMultiSelectMode) {
      ref.read(qmWorkOrderListNotifier).toggleSelectState(index);
    } else {
      ignoring = true;
      currentQmWorkOrder = StateProvider.autoDispose(
          (ref) => ref.watch(qmWorkOrderListNotifier).filteredItems[index]);
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
  }

  void _navigateTo(String filterKey) {
    ref.watch(qmWorkOrderStateNotifierProvider).maybeWhen(
          loaded: (_, __) {
            ref.read(qmTableColumnNotifier.notifier).state = filterKey;
            Navigator.of(context).push(
              CustomScaleRoute(
                backgroundColor: Colors.black.withOpacity(.2),
                builder: (_) => QmWorkOrderFilterDialog(filterKey: filterKey),
              ),
            );
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
      body: Scaffold(
        appBar: const SubAppBarQM(),
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
                      ref
                          .read(qmWorkOrderListNotifier)
                          .toggleSelectState(index);
                    },
                    orElse: () {},
                  );
                  ref
                      .read(qmWorkOrderSaveStateNotifierProvider.notifier)
                      .mapEventToState(
                          const QmWorkOrderSaveEvent.resetToNone());
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
                  ref.read(qmWorkOrderListNotifier.notifier).clear();
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
                    name: "chkSHDT",
                    title: "검사신청일",
                    width: 200,
                    onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                    onLongTap: () {
                      _navigateTo("chkSHDT");
                    },
                    children: _buildAdditionalIcons("chkSHDT"),
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
                    name: "partNo",
                    title: "품번",
                    width: 130,
                    onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                    onLongTap: () {
                      _navigateTo("partNo");
                    },
                    children: _buildAdditionalIcons("partNo"),
                  ),
                  CustomTableHeader(
                    name: "custltemName",
                    title: "거래처품명",
                    width: 300,
                    onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                    onLongTap: () {
                      _navigateTo("custltemName");
                    },
                    children: _buildAdditionalIcons("custltemName"),
                  ),
                  CustomTableHeader(
                    name: "qty",
                    title: "수량",
                    onTap: ref.read(qmWorkOrderListNotifier.notifier).sort,
                    width: 100,
                    onLongTap: () {
                      _navigateTo("qty");
                    },
                    children: _buildAdditionalIcons("qty"),
                  ),
                ],
                rowBuilder: (context, index) {
                  return state.when(
                    initial: () {
                      return TableLoadingRow();
                    },
                    loading: () {
                      if (index < orderListNotifier.filteredItems.length) {
                        return QmWorkOrderLoadedRow(
                          order: orderListNotifier.filteredItems[index],
                          color: _getColor(index),
                        );
                      } else {
                        return TableLoadingRow();
                      }
                    },
                    loaded: (_, __) {
                      return QmWorkOrderLoadedRow(
                        order: orderListNotifier.filteredItems[index],
                        color: _getColor(index),
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
                  loaded: (current, _) =>
                      orderListNotifier.filteredItems.length,
                  failure: (message) => 1,
                ),
              ),
            ),
            _buildFabBackground(),
            _buildFab(),
          ],
        ),
      ),
    );
  }

  Color _getColor(int index) {
    Color color = Colors.transparent;
    final notifier = ref.watch(qmWorkOrderListNotifier);

    if (notifier.selectedIndex.contains(index)) {
      color = Theme.of(context).selectedRowColor;
    }

    return color;
  }

  Widget _buildFab() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      right: ref.watch(qmWorkOrderListNotifier).isMultiSelectMode
          ? 1.7 * LayoutConstant.spaceXL
          : -120,
      bottom: ref.watch(qmWorkOrderListNotifier).isMultiSelectMode
          ? LayoutConstant.spaceM
          : -120,
      child: AnimatedScale(
        scale: ref.watch(qmWorkOrderListNotifier).isMultiSelectMode ? 1 : 0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCirc,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: LayoutConstant.spaceS),
            _buildFabButton(
              onTap: () => ref
                  .read(qmWorkOrderSaveStateNotifierProvider.notifier)
                  .mapEventToState(
                    QmWorkOrderSaveEvent.saveQmWorkOrderList(
                      ref.watch(qmWorkOrderListNotifier).selectedItem,
                      ref.watch(qmWorkOrderListNotifier).selectedIndex.toList(),
                    ),
                  ),
              title: "검사완료",
              width: 120 + LayoutConstant.spaceM,
              backgroundColor: ThemeConstant.dominantColor,
              active: true,
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            const Text(
              "또는",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {
                ref.read(qmWorkOrderListNotifier.notifier).clearSelection();
              },
              child: const Text(
                "선택 취소",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFabBackground({double radius = 240}) {
    return Positioned(
      bottom: -radius,
      right: -radius,
      child: AnimatedScale(
        scale: ref.watch(qmWorkOrderListNotifier).isMultiSelectMode ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInQuint,
        child: Container(
          width: radius * 2,
          height: radius * 1.65,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(-1, 1),
                blurRadius: LayoutConstant.radiusXS,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFabButton({
    required String title,
    required Color backgroundColor,
    required double width,
    bool active = true,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: active ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOutQuart,
        width: width,
        padding: const EdgeInsets.symmetric(
          vertical: LayoutConstant.paddingM,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: active ? backgroundColor : Theme.of(context).disabledColor,
          borderRadius: BorderRadius.circular(LayoutConstant.radiusS),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
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
