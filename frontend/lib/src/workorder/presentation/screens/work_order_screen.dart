import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/routes/app_route_observer.dart';
import 'package:frontend/src/workorder/application/load/work_order_event.dart';
import 'package:frontend/src/workorder/application/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_status.dart';
import 'package:frontend/src/workorder/presentation/screens/custom_table.dart';
import 'package:frontend/src/workorder/presentation/screens/tablerows/work_order_failure_row.dart';
import 'package:frontend/src/workorder/presentation/screens/tablerows/work_order_loaded_row.dart';
import 'package:frontend/src/workorder/presentation/screens/tablerows/work_order_loading_row.dart';
import 'package:frontend/src/workorder/presentation/screens/work_order_popup.dart';
import 'package:frontend/src/workorder/presentation/viewmodel/qm_work_order_notifier.dart';
import 'package:frontend/src/workorder/presentation/viewmodel/work_order_list_notifier.dart';

/// 검사 1화면: QM 검사 항목 리스트 제시
class WorkOrderScreen extends ConsumerStatefulWidget {
  const WorkOrderScreen({
    Key? key,
    this.isQm = false,
    this.canSaveBothStartAndEnd = false,
  }) : super(key: key);

  final bool isQm;
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
    if (widget.isQm) {
      ref
          .read(qmWorkOrderNotifierProvider.notifier)
          .setWorkOrder(ref.watch(workOrderListNotifier).items[index]);
      context.push("/qm/$index");
    } else {
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
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workOrderStateNotifierProvider);
    final notifier = ref.watch(workOrderListNotifier);

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
                    if (!widget.isQm) {
                      ref.read(workOrderListNotifier).toggleSelectState(index);
                    }
                  },
                  orElse: () {},
                );
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
                  title: "현공정",
                  width: 150,
                  canOrder: true,
                  onTap: ref.read(workOrderListNotifier.notifier).sort,
                ),
                CustomTableHeader(
                  title: "현공정 상태",
                  width: 150,
                  canOrder: true,
                  onTap: ref.read(workOrderListNotifier.notifier).sort,
                ),
                const CustomTableHeader(title: "Yard", width: 150),
                const CustomTableHeader(title: "Hull No", width: 150),
                const CustomTableHeader(title: "구역"),
                const CustomTableHeader(title: "Sys No"),
                const CustomTableHeader(title: "품번", width: 130),
                const CustomTableHeader(title: "수량", width: 50),
              ],
              rowBuilder: (context, index) {
                return state.when(
                  initial: (_) {
                    return WorkOrderLoadingRow();
                  },
                  loading: (results, page) {
                    if (index < results.length) {
                      return WorkOrderLoadedRow(
                        order: notifier.items[index],
                        color: _getColor(index),
                      );
                    } else {
                      return WorkOrderLoadingRow();
                    }
                  },
                  loaded: (_, __) {
                    return WorkOrderLoadedRow(
                      order: notifier.items[index],
                      color: _getColor(index),
                    );
                  },
                  failure: (results, message) {
                    if (index < results.length) {
                      return WorkOrderLoadedRow(order: notifier.items[index]);
                    } else {
                      return WorkOrderFailureRow(message: message);
                    }
                  },
                );
              },
              rowCount: state.when(
                  initial: (_) => 0,
                  loading: (prev, length) => prev.length + length,
                  loaded: (current, _) => current.length,
                  failure: (prev, message) => prev.length + 1),
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
          ? LayoutConstant.spaceXL
          : -100,
      bottom: ref.watch(workOrderListNotifier).isMultiSelectMode
          ? LayoutConstant.spaceL
          : -100,
      child: AnimatedScale(
        scale: ref.watch(workOrderListNotifier).isMultiSelectMode ? 1 : 0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCirc,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "시작/종료",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFabButton(
                  onTap: () => ref
                      .read(workOrderSaveStateNotifierProvider.notifier)
                      .mapEventToState(
                        WorkOrderSaveEvent.saveWorkOrderList(
                          ref.watch(workOrderListNotifier).selectedQmItem,
                          WorkOrderSaveStatus.start,
                          ref
                              .watch(workOrderListNotifier)
                              .selectedIndex
                              .toList(),
                        ),
                      ),
                  tooltip: "Start",
                  backgroundColor: ThemeConstant.accentColor,
                  icon: Icons.play_arrow,
                  active:
                      ref.read(workOrderListNotifier.notifier).isStartActive,
                ),
                const SizedBox(width: LayoutConstant.spaceM),
                _buildFabButton(
                  onTap: () => ref
                      .read(workOrderSaveStateNotifierProvider.notifier)
                      .mapEventToState(
                        WorkOrderSaveEvent.saveWorkOrderList(
                          ref.watch(workOrderListNotifier).selectedQmItem,
                          WorkOrderSaveStatus.end,
                          ref
                              .watch(workOrderListNotifier)
                              .selectedIndex
                              .toList(),
                        ),
                      ),
                  tooltip: "End",
                  icon: Icons.stop,
                  backgroundColor: Theme.of(context).primaryColorDark,
                  active: ref.read(workOrderListNotifier.notifier).isEndActive,
                ),
              ],
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            const Text(
              "또는",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {
                ref.read(workOrderListNotifier.notifier).clearSelection();
              },
              child: const Text("선택 취소"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFabBackground({double radius = 230}) {
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
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(-1, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Tooltip _buildFabButton({
    required String tooltip,
    required IconData icon,
    required Color backgroundColor,
    double radius = 40,
    bool active = true,
    VoidCallback? onTap,
  }) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: active ? onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutQuart,
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? backgroundColor : Theme.of(context).disabledColor,
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
