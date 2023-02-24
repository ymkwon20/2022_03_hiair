import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/pages/table_failure_row.dart';
import 'package:frontend/src/core/presentation/routes/app_route_observer.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/sub_app_bar.dart';
import 'package:frontend/src/core/presentation/widgets/table_loading_row.dart';
import 'package:frontend/src/impeller/application/impeller/load/barcode_event.dart';
import 'package:frontend/src/impeller/application/impeller/load/barcode_state.dart';
import 'package:frontend/src/impeller/application/impeller/load/impeller_event.dart';
import 'package:frontend/src/impeller/application/impeller/load/impeller_state.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_event.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_state.dart';
import 'package:frontend/src/impeller/dependency_injection.dart';
import 'package:frontend/src/impeller/domain/entities/impeller_status.dart';
import 'package:frontend/src/impeller/presentation/screens/impeller_single_popup.dart';
import 'package:frontend/src/impeller/presentation/screens/tablerows/impeller_loaded_row.dart';
import 'package:frontend/src/impeller/presentation/screens/tablerows/impeller_single_loaded_row.dart';
import 'package:frontend/src/impeller/presentation/viewmodels/barcode_notifier.dart';
import 'package:frontend/src/impeller/presentation/viewmodels/impeller_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'impeller_popup.dart';

class ImpellerSingleScreen extends ConsumerStatefulWidget {
  const ImpellerSingleScreen({
    Key? key,
    this.canSaveBothStartAndEnd = false,
  }) : super(key: key);

  final bool canSaveBothStartAndEnd;

  @override
  ConsumerState<ImpellerSingleScreen> createState() =>
      _ImpellerSingleListWidgetState();
}

class _ImpellerSingleListWidgetState extends ConsumerState<ImpellerSingleScreen>
    with SingleTickerProviderStateMixin, RouteAware {
  /// scroll에 따른 새 아이템 불러오기 관련
  bool canLoadNextPage = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(impellerListNotifier.notifier).clear();
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
    await ref.read(impellerStateNotifierProvider.notifier).mapEventToState(
          ImpellerEvent.fetchSingleListByPage(
            ref.watch(impellerListNotifier).items,
            ref.watch(impellerListNotifier).page,
          ),
        );
  }

  void _onTap(int index) async {
    if (ref.watch(impellerListNotifier).isMultiSelectMode) {
      ref.read(impellerListNotifier).toggleSelectState(index);
    } else {
      // _openDrawer(index);
      // final impeller = ref.watch(impellerNotifier);
      await ref.watch(barcodeStateNotifierProvider.notifier).mapEventToState(
            BarcodeEvent.getQRBarcode(ref.watch(barcodeNotifier).item,
                ref.watch(impellerListNotifier).items[index]),
          );

      Navigator.of(context).push(
        CustomSlideRoute(
          backgroundColor: Colors.black.withOpacity(.2),
          builder: (context) => ProviderScope(
            overrides: [
              impellerIndexNotifier.overrideWithValue(index),
              impellerNotifier.overrideWithValue(
                  ref.watch(impellerListNotifier).items[index]),
              barcodeStringNotifier
                  .overrideWithValue(ref.watch(barcodeNotifier).item)
            ],
            child: ImpellerSinglePopup(
              canSaveBothStartAndEnd: widget.canSaveBothStartAndEnd,
            ),
          ),
        ),
      );
    }
  }

  void _navigateTo(String filterKey) {
    ref.watch(impellerStateNotifierProvider).maybeWhen(
          loaded: (_, __) {
            ref.read(tableColumnNotifier.notifier).state = filterKey;
            Navigator.of(context).push(
              CustomScaleRoute(
                backgroundColor: Colors.black.withOpacity(.2),
                builder: (_) => ImpellerFilterDialog(filterKey: filterKey),
              ),
            );
          },
          orElse: () {},
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(impellerStateNotifierProvider);
    final orderListNotifier = ref.watch(impellerListNotifier);

    ref.listen<ImpellerState>(impellerStateNotifierProvider,
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
          ref.read(impellerListNotifier.notifier).setOrderList(orders);
        },
        failure: (orders, message) {
          canLoadNextPage = true;
        },
      );
    }));

    ref.listen<BarcodeState>(barcodeStateNotifierProvider,
        ((previous, current) {
      current.when(
        initial: (barcode) {},
        loading: (barcode) {},
        loaded: (barcode) {
          ref.read(barcodeNotifier.notifier).setOrderList(barcode);
        },
        failure: (barcode, message) {},
      );
    }));

    ref.listen<ImpellerSaveState>(
      impellerSaveStateNotifierProvider,
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
            ref.read(impellerListNotifier.notifier).clearSelection();

            switch (status) {
              case ImpellerSaveStatus.start:
                ref
                    .read(impellerListNotifier.notifier)
                    .setNewItemDateStart(index, date);
                break;
              case ImpellerSaveStatus.end:
                ref
                    .read(impellerListNotifier.notifier)
                    .setNewItemDateEnd(index);
                break;
              case ImpellerSaveStatus.all:
                ref
                    .read(impellerListNotifier.notifier)
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
                .read(impellerSaveStateNotifierProvider.notifier)
                .mapEventToState(const ImpellerSaveEvent.resetToNone());
          },
          multipleSaved: (indice, date, status) {
            Navigator.pop(context);
            ref.read(impellerListNotifier.notifier).clearSelection();

            switch (status) {
              case ImpellerSaveStatus.start:
                ref
                    .read(impellerListNotifier.notifier)
                    .setNewListDateStart(indice, date);
                break;
              case ImpellerSaveStatus.end:
                ref
                    .read(impellerListNotifier.notifier)
                    .setNewListDateEnd(indice);
                break;
              case ImpellerSaveStatus.all:
                ref
                    .read(impellerListNotifier.notifier)
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
                .read(impellerSaveStateNotifierProvider.notifier)
                .mapEventToState(const ImpellerSaveEvent.resetToNone());
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
                .read(impellerSaveStateNotifierProvider.notifier)
                .mapEventToState(const ImpellerSaveEvent.resetToNone());
          },
        );
      }),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SubAppBar(
        code: 'IMP',
      ),
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
                    ref.read(impellerListNotifier).toggleSelectState(index);
                  },
                  orElse: () {},
                );
                ref
                    .read(impellerSaveStateNotifierProvider.notifier)
                    .mapEventToState(const ImpellerSaveEvent.resetToNone());
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
                ref.read(impellerListNotifier.notifier).clear();
                await _fetchQmItemsByPage();
              },
              headers: [
                CustomTableHeader(
                  name: "code",
                  title: "작업지시번호",
                  width: 150,
                  onTap: ref.read(impellerListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("code");
                  },
                  children: _buildAdditionalIcons("code"),
                ),
                CustomTableHeader(
                  name: "partNo",
                  title: "품목코드",
                  width: 150,
                  onTap: ref.read(impellerListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("partNo");
                  },
                  children: _buildAdditionalIcons("partNo"),
                ),
                CustomTableHeader(
                  name: "qty",
                  title: "지시수량",
                  width: 130,
                  onTap: ref.read(impellerListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("qty");
                  },
                  children: _buildAdditionalIcons("qty"),
                ),
                CustomTableHeader(
                  name: "shaft",
                  title: "SHAFT",
                  width: 130,
                  onTap: ref.read(impellerListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("shaft");
                  },
                  children: _buildAdditionalIcons("shaft"),
                ),
                CustomTableHeader(
                  name: "bldType",
                  title: "BLADE TYPE",
                  width: 200,
                  onTap: ref.read(impellerListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("bldType");
                  },
                  children: _buildAdditionalIcons("bldType"),
                ),
                CustomTableHeader(
                  name: "fanType",
                  title: "Fan Type",
                  width: 150,
                  onTap: ref.read(impellerListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("fanType");
                  },
                  children: _buildAdditionalIcons("fanType"),
                ),
                CustomTableHeader(
                  name: "bldQTY",
                  title: "BLADE 수량",
                  width: 130,
                  onTap: ref.read(impellerListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("bldQTY");
                  },
                  children: _buildAdditionalIcons("bldQTY"),
                ),
                CustomTableHeader(
                  name: "rmk",
                  title: "RMK",
                  width: 130,
                  onTap: ref.read(impellerListNotifier.notifier).sort,
                  onLongTap: () {
                    _navigateTo("rmk");
                  },
                  children: _buildAdditionalIcons("rmk"),
                ),
              ],
              rowBuilder: (context, index) {
                return state.when(
                  initial: (_) {
                    return TableLoadingRow();
                  },
                  loading: (results, page) {
                    if (index < orderListNotifier.filteredItems.length) {
                      return ImpellerSingleLoadedRow(
                        order: orderListNotifier.filteredItems[index],
                        color: _getColor(index),
                      );
                    } else {
                      return TableLoadingRow();
                    }
                  },
                  loaded: (_, __) {
                    return ImpellerSingleLoadedRow(
                      order: orderListNotifier.filteredItems[index],
                      color: _getColor(index),
                    );
                  },
                  failure: (results, message) {
                    if (index < orderListNotifier.filteredItems.length) {
                      return ImpellerSingleLoadedRow(
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
    final notifier = ref.watch(impellerListNotifier);

    if (notifier.items[index].status == ImpellerStatus.resuming) {
      color = Colors.amber;
    } else if (notifier.items[index].rmk != "") {
      color = Colors.cyan;
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
      right: ref.watch(impellerListNotifier).isMultiSelectMode
          ? 1.7 * LayoutConstant.spaceXL
          : -120,
      bottom: ref.watch(impellerListNotifier).isMultiSelectMode
          ? LayoutConstant.spaceM
          : -120,
      child: AnimatedScale(
        scale: ref.watch(impellerListNotifier).isMultiSelectMode ? 1 : 0,
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
                      .read(impellerSaveStateNotifierProvider.notifier)
                      .mapEventToState(
                        ImpellerSaveEvent.saveImpellerList(
                          ref.watch(impellerListNotifier).selectedItem,
                          ImpellerSaveStatus.start,
                          ref
                              .watch(impellerListNotifier)
                              .selectedIndex
                              .toList(),
                        ),
                      ),
                  title: "시작",
                  width: 60,
                  backgroundColor: ThemeConstant.accentColor,
                  active: ref.read(impellerListNotifier.notifier).isStartActive,
                ),
                const SizedBox(width: LayoutConstant.spaceM),
                _buildFabButton(
                  onTap: () => ref
                      .read(impellerSaveStateNotifierProvider.notifier)
                      .mapEventToState(
                        ImpellerSaveEvent.saveImpellerList(
                          ref.watch(impellerListNotifier).selectedItem,
                          ImpellerSaveStatus.end,
                          ref
                              .watch(impellerListNotifier)
                              .selectedIndex
                              .toList(),
                        ),
                      ),
                  title: "완료",
                  width: 60,
                  backgroundColor: Theme.of(context).primaryColorDark,
                  active: ref.read(impellerListNotifier.notifier).isEndActive,
                ),
              ],
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            _buildFabButton(
              onTap: () => ref
                  .read(impellerSaveStateNotifierProvider.notifier)
                  .mapEventToState(
                    ImpellerSaveEvent.saveImpellerList(
                      ref.watch(impellerListNotifier).selectedItem,
                      ImpellerSaveStatus.all,
                      ref.watch(impellerListNotifier).selectedIndex.toList(),
                    ),
                  ),
              title: "시작/완료",
              width: 120 + LayoutConstant.spaceM,
              backgroundColor: ThemeConstant.accentColor,
              active: true,
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            const Text(
              "또는",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {
                ref.read(impellerListNotifier.notifier).clearSelection();
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
        scale: ref.watch(impellerListNotifier).isMultiSelectMode ? 1 : 0,
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
    if (ref.watch(impellerListNotifier).sortedColumn[key] == null) {
    } else if (ref.watch(impellerListNotifier).sortedColumn[key]!) {
      children.add(const Icon(Icons.arrow_upward));
    } else {
      children.add(const Icon(Icons.arrow_downward));
    }

    // filter icon
    if (ref.watch(impellerListNotifier).filterMap[key] != null) {
      children.add(const Icon(Icons.filter_alt));
    }

    return children;
  }
}
