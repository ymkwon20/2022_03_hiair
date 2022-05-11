import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:frontend/src/workorder/application/load/work_order_event.dart';
import 'package:frontend/src/workorder/application/load/work_order_state.dart';
import 'package:frontend/src/workorder/application/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/application/save/work_order_save_state.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:frontend/src/workorder/presentation/screens/tablerows/work_order_failure_row.dart';
import 'package:frontend/src/workorder/presentation/screens/tablerows/work_order_loading_row.dart';
import 'package:frontend/src/workorder/presentation/screens/tablerows/work_order_loaded_row.dart';
import 'package:frontend/src/workorder/presentation/screens/work_order_drawer.dart';
import 'package:frontend/src/workorder/presentation/viewmodel/work_order_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/presentation/screens/custom_table.dart';

/// 검사 1화면: QM 검사 항목 리스트 제시
class WorkOrderScreen extends StatelessWidget {
  const WorkOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobile: WorkOrderListWidget(),
      tablet: WorkOrderListWidget(),
      desktop: WorkOrderListWidget(),
    );
  }
}

class WorkOrderListWidget extends ConsumerStatefulWidget {
  const WorkOrderListWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<WorkOrderListWidget> createState() =>
      _WorkOrderListWidgetState();
}

class _WorkOrderListWidgetState extends ConsumerState<WorkOrderListWidget>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _controller;

  /// Pressed 관련
  int? _selectedIndex;
  WorkOrder? _selectedOrder;

  /// scroll에 따른 새 아이템 불러오기 관련
  bool canLoadNextPage = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    Future.delayed(
      Duration.zero,
      () {
        ref.read(workOrderListNotifier.notifier).clear();
        _fetchQmItemsByPage();
      },
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  Future<void> _fetchQmItemsByPage() async {
    await ref.read(workOrderStateNotifierProvider.notifier).mapEventToState(
          WorkOrderEvent.fetchListByPage(
            ref.watch(workOrderListNotifier).items,
            ref.watch(workOrderListNotifier).page,
          ),
        );
  }

  void _openDrawer(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedOrder = ref.watch(workOrderListNotifier).items[_selectedIndex!];
      _controller.forward();
    });
  }

  Future<void> _closeDrawer() async {
    await _controller.reverse();
    setState(() {
      _selectedOrder = null;
      ref
          .read(workOrderSaveStateNotifierProvider.notifier)
          .mapEventToState(const WorkOrderSaveEvent.resetToNone());
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<WorkOrderSaveState>(
      workOrderSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          oneSaved: (index, date, status) {
            switch (status) {
              case WorkOrderStatus.start:
                ref
                    .read(workOrderListNotifier.notifier)
                    .setNewItemDateStart(index, date);
                break;
              case WorkOrderStatus.end:
                ref
                    .read(workOrderListNotifier.notifier)
                    .setNewItemDateEnd(index, date);
                break;
            }
            _closeDrawer();
            showFlashBar(
              context,
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );
          },
          multipleSaved: (indice, date, status) {
            switch (status) {
              case WorkOrderStatus.start:
                ref
                    .read(workOrderListNotifier.notifier)
                    .setNewListDateStart(indice, date);
                break;
              case WorkOrderStatus.end:
                ref
                    .read(workOrderListNotifier.notifier)
                    .setNewListDateEnd(indice, date);
                break;
            }
            _closeDrawer();
            showFlashBar(
              context,
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );
          },
          failure: (message) {
            _closeDrawer();
            showFlashBar(
              context,
              title: "저장 오류",
              content: message,
              backgroundColor: Theme.of(context).errorColor,
            );
          },
          orElse: () {
            ref.read(workOrderListNotifier.notifier).clearSelection();
          },
        );
      },
    );

    ref.listen<WorkOrderState>(workOrderStateNotifierProvider,
        (previous, current) {
      current.when(
        initial: (_) => canLoadNextPage = true,
        loading: (_, __) => canLoadNextPage = false,
        loaded: (items, nextAvailable) {
          ref.read(workOrderListNotifier.notifier).setOrderList(items);
          canLoadNextPage = nextAvailable;
        },
        failure: (_, __) => canLoadNextPage = true,
      );
    });

    ref.listen<ChecklistSaveState>(
      checklistSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          saved: () {
            ref
                .read(workOrderSaveStateNotifierProvider.notifier)
                .mapEventToState(
                  WorkOrderSaveEvent.saveWorkOrder(
                    _selectedOrder!,
                    WorkOrderStatus.end,
                    _selectedIndex!,
                  ),
                );
          },
          failure: (message) {
            _closeDrawer();
            showFlashBar(
              context,
              title: "저장 오류",
              content: message,
              backgroundColor: Theme.of(context).errorColor,
            );
          },
          orElse: () {},
        );
      },
    );

    final state = ref.watch(workOrderStateNotifierProvider);

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
            child: Padding(
              padding: const EdgeInsets.symmetric(),
              child: CustomTable(
                onRowLongPressed: (index) {
                  state.maybeWhen(
                    loaded: (_, __) {
                      ref.read(workOrderListNotifier).toggleSelectState(index);
                    },
                    orElse: () {},
                  );
                },
                onRowPressed: (index) {
                  state.maybeWhen(
                    loaded: (_, __) {
                      if (ref.watch(workOrderListNotifier).isMultiSelectMode) {
                        ref
                            .read(workOrderListNotifier)
                            .toggleSelectState(index);
                      } else {
                        _openDrawer(index);
                      }
                    },
                    orElse: () {},
                  );
                },
                onRefresh: () async {
                  ref.read(workOrderListNotifier.notifier).clear();
                  await _fetchQmItemsByPage();
                },
                headers: const [
                  CustomTableHeader(title: "작업지시", width: 130),
                  CustomTableHeader(title: "PND"),
                  CustomTableHeader(title: "Yard"),
                  CustomTableHeader(title: "Hull No", width: 120),
                  CustomTableHeader(title: "구역"),
                  CustomTableHeader(title: "Sys No"),
                  CustomTableHeader(title: "품번", width: 120),
                  CustomTableHeader(title: "수량", width: 50),
                ],
                rowBuilder: (context, index) {
                  final notifier = ref.watch(workOrderListNotifier);
                  return state.when(
                    initial: (_) {
                      return WorkOrderLoadingRow();
                    },
                    loading: (results, page) {
                      if (index < results.length) {
                        return WorkOrderLoadedRow(
                          order: notifier.items[index],
                          color: notifier.selectedIndex.contains(index)
                              ? Theme.of(context).selectedRowColor
                              : Colors.transparent,
                        );
                      } else {
                        return WorkOrderLoadingRow();
                      }
                    },
                    loaded: (_, __) {
                      return WorkOrderLoadedRow(
                        order: notifier.items[index],
                        color: notifier.selectedIndex.contains(index)
                            ? Colors.grey
                            : Colors.transparent,
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
          ),
          WorkOrderDrawer(
            drawerController: _controller,
            workOrder: _selectedOrder,
            onStartPressed: () {
              if (_selectedOrder != null) {
                ref
                    .read(workOrderSaveStateNotifierProvider.notifier)
                    .mapEventToState(
                      WorkOrderSaveEvent.saveWorkOrder(
                        _selectedOrder!,
                        WorkOrderStatus.start,
                        _selectedIndex!,
                      ),
                    );
              }
            },
            onClose: _closeDrawer,
          ),
          _buildFabBackground(),
          _buildFab(),
        ],
      ),
    );
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
                          WorkOrderStatus.start,
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
                          WorkOrderStatus.end,
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
