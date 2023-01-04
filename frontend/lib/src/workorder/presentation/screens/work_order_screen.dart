import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/workorder/application/work_order/load/work_order_event.dart';
import 'package:frontend/src/workorder/application/work_order/load/work_order_state.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/routes/app_route_observer.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_status.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/core/presentation/pages/table_failure_row.dart';
import 'package:frontend/src/workorder/presentation/screens/tablerows/work_order_loaded_row.dart';
import 'package:frontend/src/core/presentation/widgets/table_loading_row.dart';
import 'package:frontend/src/workorder/presentation/screens/work_order_popup.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/work_order_list_notifier.dart';

/// 검사 1화면: QM 검사 항목 리스트 제시
class WorkOrderScreen extends ConsumerStatefulWidget {
  const WorkOrderScreen({
    Key? key,
    this.canSaveBothStartAndEnd = false,
  }) : super(key: key);

  final bool canSaveBothStartAndEnd;

  @override
  ConsumerState<WorkOrderScreen> createState() => _WorkOrderListWidgetState();
}

class _WorkOrderListWidgetState extends ConsumerState<WorkOrderScreen>
    with SingleTickerProviderStateMixin, RouteAware {
  /// scroll에 따른 새 아이템 불러오기 관련
  bool canLoadNextPage = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(workOrderListNotifier.notifier).clear();
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
    await ref.read(workOrderStateNotifierProvider.notifier).mapEventToState(
          WorkOrderEvent.fetchListByPage(
            ref.watch(workOrderListNotifier).items,
            ref.watch(workOrderListNotifier).page,
          ),
        );
  }

  void _onTap(int index) {
    if (ref.watch(workOrderListNotifier).isMultiSelectMode) {
      ref.read(workOrderListNotifier).toggleSelectState(index);
    } else {
      // _openDrawer(index);

      Navigator.of(context).push(
        CustomSlideRoute(
          backgroundColor: Colors.black.withOpacity(.2),
          builder: (context) => ProviderScope(
            overrides: [
              workOrderIndexNotifier.overrideWithValue(index),
              workOrderNotifier.overrideWithValue(
                  ref.watch(workOrderListNotifier).items[index]),
            ],
            child: WorkOrderPopup(
              canSaveBothStartAndEnd: widget.canSaveBothStartAndEnd,
            ),
          ),
        ),
      );
    }
  }

  void _navigateTo(String filterKey) {
    ref.watch(workOrderStateNotifierProvider).maybeWhen(
          loaded: (_, __) {
            ref.read(tableColumnNotifier.notifier).state = filterKey;
            Navigator.of(context).push(
              CustomScaleRoute(
                backgroundColor: Colors.black.withOpacity(.2),
                builder: (_) => CustomTableHeaderDialog(filterKey: filterKey),
              ),
            );
          },
          orElse: () {},
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workOrderStateNotifierProvider);
    final orderListNotifier = ref.watch(workOrderListNotifier);

    ref.listen<WorkOrderState>(workOrderStateNotifierProvider,
        ((previous, current) {
      current.when(
        initial: (orders) {
          canLoadNextPage = true;
        },
        loading: (orders, count) {
          canLoadNextPage = false;
        },
        loaded: (orders, isNextPageAvailable) {
          canLoadNextPage = isNextPageAvailable;
          ref.read(workOrderListNotifier.notifier).setOrderList(orders);
        },
        failure: (orders, message) {
          canLoadNextPage = true;
        },
      );
    }));

    ref.listen<WorkOrderSaveState>(
      workOrderSaveStateNotifierProvider,
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
          oneSaved: (index, date, status) {
            Navigator.pop(context);
            ref.read(workOrderListNotifier.notifier).clearSelection();

            switch (status) {
              case WorkOrderSaveStatus.start:
                ref
                    .read(workOrderListNotifier.notifier)
                    .setNewItemDateStart(index, date);
                break;
              case WorkOrderSaveStatus.end:
                ref
                    .read(workOrderListNotifier.notifier)
                    .setNewItemDateEnd(index);
                break;
              case WorkOrderSaveStatus.all:
                ref
                    .read(workOrderListNotifier.notifier)
                    .setNewItemDateEnd(index);
                break;
            }

            showFlashBar(
              context,
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );

            ref
                .read(workOrderSaveStateNotifierProvider.notifier)
                .mapEventToState(const WorkOrderSaveEvent.resetToNone());
          },
          multipleSaved: (indice, date, status) {
            Navigator.pop(context);
            ref.read(workOrderListNotifier.notifier).clearSelection();

            switch (status) {
              case WorkOrderSaveStatus.start:
                ref
                    .read(workOrderListNotifier.notifier)
                    .setNewListDateStart(indice, date);
                break;
              case WorkOrderSaveStatus.end:
                ref
                    .read(workOrderListNotifier.notifier)
                    .setNewListDateEnd(indice);
                break;
              case WorkOrderSaveStatus.all:
                ref
                    .read(workOrderListNotifier.notifier)
                    .setNewListDateEnd(indice);
                break;
            }
            showFlashBar(
              context,
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );

            ref
                .read(workOrderSaveStateNotifierProvider.notifier)
                .mapEventToState(const WorkOrderSaveEvent.resetToNone());
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
                    _onTap(index);
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
                  onTap: ref.read(workOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("wbNm");
                  },
                  children: _buildAdditionalIcons("wbNm"),
                ),
                CustomTableHeader(
                  name: "status",
                  title: "현공정 상태",
                  width: 200,
                  onTap: ref.read(workOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("status");
                  },
                  children: _buildAdditionalIcons("status"),
                ),
                CustomTableHeader(
                  name: "yard",
                  title: "Yard",
                  width: 150,
                  onTap: ref.read(workOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("yard");
                  },
                  children: _buildAdditionalIcons("yard"),
                ),
                CustomTableHeader(
                  name: "hullNo",
                  title: "Hull No",
                  width: 150,
                  onTap: ref.read(workOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("hullNo");
                  },
                  children: _buildAdditionalIcons("hullNo"),
                ),
                CustomTableHeader(
                  name: "ship",
                  title: "구역",
                  onTap: ref.read(workOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("ship");
                  },
                  children: _buildAdditionalIcons("ship"),
                ),
                CustomTableHeader(
                  name: "sysNo",
                  title: "Sys No",
                  onTap: ref.read(workOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("sysNo");
                  },
                  children: _buildAdditionalIcons("sysNo"),
                ),
                CustomTableHeader(
                  name: "itemNo",
                  title: "품번",
                  width: 130,
                  onTap: ref.read(workOrderListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("itemNo");
                  },
                  children: _buildAdditionalIcons("itemNo"),
                ),
                CustomTableHeader(
                  name: "qty",
                  title: "수량",
                  onTap: ref.read(workOrderListNotifier.notifier).sort,
                  width: 100,
                  children: _buildAdditionalIcons("qty"),
                ),
              ],
              rowBuilder: (context, index) {
                return state.when(
                  initial: (_) {
                    return TableLoadingRow();
                  },
                  loading: (results, page) {
                    if (index < results.length) {
                      return WorkOrderLoadedRow(
                        order: orderListNotifier.filteredItems[index],
                        color: _getColor(index),
                      );
                    } else {
                      return TableLoadingRow();
                    }
                  },
                  loaded: (_, __) {
                    return WorkOrderLoadedRow(
                      order: orderListNotifier.filteredItems[index],
                      color: _getColor(index),
                    );
                  },
                  failure: (results, message) {
                    if (index < results.length) {
                      return WorkOrderLoadedRow(
                          order: orderListNotifier.filteredItems[index]);
                    } else {
                      return TableFailureRow(message: message);
                    }
                  },
                );
              },
              rowCount: state.when(
                initial: (_) => orderListNotifier.filteredItems.length,
                loading: (prev, length) =>
                    orderListNotifier.filteredItems.length + length,
                loaded: (current, _) => orderListNotifier.filteredItems.length,
                failure: (prev, message) =>
                    orderListNotifier.filteredItems.length + 1,
              ),
            ),
          ),
          _buildFabBackground(),
          _buildFab(),
        ],
      ),
    );
  }

  Color _getColor(int index) {
    Color color;
    final notifier = ref.watch(workOrderListNotifier);

    if (notifier.items[index].status == WorkOrderStatus.resuming) {
      color = Colors.amber;
    } else {
      color = Colors.transparent;
    }

    if (notifier.selectedIndex.contains(index)) {
      color = Theme.of(context).selectedRowColor;
    }

    return color;
  }

  Widget _buildFab() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      right: ref.watch(workOrderListNotifier).isMultiSelectMode
          ? 1.7 * LayoutConstant.spaceXL
          : -120,
      bottom: ref.watch(workOrderListNotifier).isMultiSelectMode
          ? LayoutConstant.spaceM
          : -120,
      child: AnimatedScale(
        scale: ref.watch(workOrderListNotifier).isMultiSelectMode ? 1 : 0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCirc,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFabButton(
                  onTap: () => ref
                      .read(workOrderSaveStateNotifierProvider.notifier)
                      .mapEventToState(
                        WorkOrderSaveEvent.saveWorkOrderList(
                          ref.watch(workOrderListNotifier).selectedItem,
                          WorkOrderSaveStatus.start,
                          ref
                              .watch(workOrderListNotifier)
                              .selectedIndex
                              .toList(),
                        ),
                      ),
                  title: "시작",
                  width: 60,
                  backgroundColor: ThemeConstant.dominantColor,
                  active:
                      ref.read(workOrderListNotifier.notifier).isStartActive,
                ),
                const SizedBox(width: LayoutConstant.spaceM),
                _buildFabButton(
                  onTap: () => ref
                      .read(workOrderSaveStateNotifierProvider.notifier)
                      .mapEventToState(
                        WorkOrderSaveEvent.saveWorkOrderList(
                          ref.watch(workOrderListNotifier).selectedItem,
                          WorkOrderSaveStatus.end,
                          ref
                              .watch(workOrderListNotifier)
                              .selectedIndex
                              .toList(),
                        ),
                      ),
                  title: "완료",
                  width: 60,
                  backgroundColor: Theme.of(context).primaryColorDark,
                  active: ref.read(workOrderListNotifier.notifier).isEndActive,
                ),
              ],
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            _buildFabButton(
              onTap: () => ref
                  .read(workOrderSaveStateNotifierProvider.notifier)
                  .mapEventToState(
                    WorkOrderSaveEvent.saveWorkOrderList(
                      ref.watch(workOrderListNotifier).selectedItem,
                      WorkOrderSaveStatus.all,
                      ref.watch(workOrderListNotifier).selectedIndex.toList(),
                    ),
                  ),
              title: "시작/완료",
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
                ref.read(workOrderListNotifier.notifier).clearSelection();
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
        scale: ref.watch(workOrderListNotifier).isMultiSelectMode ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInQuint,
        child: Container(
          width: radius * 2,
          height: radius * 2,
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
    if (ref.watch(workOrderListNotifier).sortedColumn[key] == null) {
    } else if (ref.watch(workOrderListNotifier).sortedColumn[key]!) {
      children.add(const Icon(Icons.arrow_upward));
    } else {
      children.add(const Icon(Icons.arrow_downward));
    }

    // filter icon
    if (ref.watch(workOrderListNotifier).filterMap[key] != null) {
      children.add(const Icon(Icons.filter_alt));
    }

    return children;
  }
}
