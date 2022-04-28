import 'dart:async';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/index.dart';
import 'package:frontend/src/qm/application/load/qm_state.dart';
import 'package:frontend/src/qm/application/save/qm_save_event.dart';
import 'package:frontend/src/qm/application/save/qm_save_state.dart';
import 'package:frontend/src/qm/presentation/screens/tablerows/qm_failure_row.dart';
import 'package:frontend/src/qm/presentation/screens/tablerows/qm_loading_row.dart';
import 'package:frontend/src/qm/presentation/screens/tablerows/qm_loaded_row.dart';
import 'package:frontend/src/qm/presentation/screens/qm_start_end_button.dart';
import 'package:frontend/src/qm/presentation/viewmodel/qm_items_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/widgets/responsive_widget.dart';
import 'package:frontend/src/qm/application/load/qm_event.dart';
import 'package:frontend/src/qm/dependency_injection.dart';
import 'package:frontend/src/qm/domain/entities/qm_item.dart';
import 'package:frontend/src/qm/presentation/screens/custom_table.dart';

/// 검사 1화면: QM 검사 항목 리스트 제시
class QmScreen extends StatelessWidget {
  const QmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobile: QmListWidget(),
      tablet: QmListWidget(),
      desktop: QmListWidget(),
    );
  }
}

class QmListWidget extends ConsumerStatefulWidget {
  const QmListWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<QmListWidget> createState() => _QmProductListState();
}

class _QmProductListState extends ConsumerState<QmListWidget>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _controller;

  static final _opacityTween = CurveTween(curve: Curves.easeInQuart);
  static final _slideTween = CurveTween(curve: Curves.ease);

  /// Pressed 관련
  int? _selectedIndex;
  QmItem? _selectedQm;

  /// scroll에 따른 새 아이템 불러오기 관련
  bool canLoadeNextPage = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    Future.delayed(
      Duration.zero,
      () {
        _fetchQmItemsByPage(page: 1, qmItems: []);
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

  Future<void> _fetchQmItemsByPage(
      {required int page, required List<QmItem> qmItems}) async {
    ref
        .read(qmStateNotifierProvider.notifier)
        .mapEventToState(QmEvent.fetchQmItemsByPage(page, qmItems));
  }

  void _openDrawer(int index) {
    _selectedIndex = index;
    _selectedQm = ref.watch(qmItemsNotifier).qmItems[_selectedIndex!];
    _controller.forward();
  }

  Future<void> _closeDrawer() async {
    await _controller.reverse();
    _selectedQm = null;
    ref
        .read(qmSaveStateNotifierProvider.notifier)
        .mapEventToState(const QmSaveEvent.resetToNone());
  }

  void _showFlashBar({
    required String title,
    required String content,
    Color? backgroundColor,
    Color? textColor,
  }) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      builder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.all(LayoutConstant.paddingM),
          child: Flash.bar(
            position: FlashPosition.top,
            enableVerticalDrag: true,
            horizontalDismissDirection: HorizontalDismissDirection.horizontal,
            borderRadius: BorderRadius.circular(LayoutConstant.radiusS),
            backgroundColor: backgroundColor,
            controller: controller,
            child: FlashBar(
              content: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: textColor),
                  ),
                  const SizedBox(width: LayoutConstant.spaceM),
                  Text(
                    content,
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<QmSaveState>(
      qmSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          oneSaved: (index, date, status) {
            switch (status) {
              case QmStatus.start:
                ref
                    .read(qmItemsNotifier.notifier)
                    .setNewItemDateStart(index, date);
                break;
              case QmStatus.end:
                ref
                    .read(qmItemsNotifier.notifier)
                    .setNewItemDateEnd(index, date);
                break;
            }
            Future.delayed(const Duration(milliseconds: 500), _closeDrawer);
            _showFlashBar(
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );
          },
          multipleSaved: (indice, date, status) {
            switch (status) {
              case QmStatus.start:
                ref
                    .read(qmItemsNotifier.notifier)
                    .setNewListDateStart(indice, date);
                break;
              case QmStatus.end:
                ref
                    .read(qmItemsNotifier.notifier)
                    .setNewListDateEnd(indice, date);
                break;
            }
            Future.delayed(const Duration(milliseconds: 500), _closeDrawer);
            _showFlashBar(
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );
          },
          failure: (message) {
            Future.delayed(const Duration(milliseconds: 500), _closeDrawer);
            _showFlashBar(
              title: "저장 오류",
              content: message,
              backgroundColor: Theme.of(context).errorColor,
            );
          },
          orElse: () {
            ref.read(qmItemsNotifier.notifier).clearSelection();
          },
        );
      },
    );

    ref.listen<QmState>(
      qmStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          loaded: (items) {
            ref.read(qmItemsNotifier.notifier).setQmItems(items);
          },
          orElse: () {},
        );
      },
    );

    final state = ref.watch(qmStateNotifierProvider);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: ((notification) {
              // TODO: scroll refresh 구현하기
              // ignore: avoid_print
              print(notification.metrics.axisDirection);
              return false;
            }),
            child: Padding(
              padding: const EdgeInsets.symmetric(),
              child: CustomTable(
                onRowLongPressed: ref.read(qmItemsNotifier).toggleSelectState,
                onRowPressed: (index) {
                  if (ref.watch(qmItemsNotifier).isMultiSelectMode) {
                    ref.read(qmItemsNotifier).toggleSelectState(index);
                  } else {
                    _openDrawer(index);
                  }
                },
                onRefresh: () async => await _fetchQmItemsByPage(
                  page: 1,
                  qmItems: [],
                ),
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
                  final notifier = ref.watch(qmItemsNotifier);
                  return state.when(
                    initial: (_) {
                      return QmLoadingRow();
                    },
                    loading: (items, page) {
                      if (index < items.length) {
                        return QmLoadedRow(
                          qmItem: notifier.qmItems[index],
                          color: notifier.selectedIndex.contains(index)
                              ? Theme.of(context).selectedRowColor
                              : Colors.transparent,
                        );
                      } else {
                        return QmLoadingRow();
                      }
                    },
                    loaded: (_) {
                      return QmLoadedRow(
                        qmItem: notifier.qmItems[index],
                        color: notifier.selectedIndex.contains(index)
                            ? Colors.grey
                            : Colors.transparent,
                      );
                    },
                    failure: (items, message) {
                      if (index < items.length) {
                        return QmLoadedRow(qmItem: notifier.qmItems[index]);
                      } else {
                        return FailureRow(message: message);
                      }
                    },
                  );
                },
                rowCount: state.when(
                    initial: (_) => 0,
                    loading: (prev, length) => prev.length + length,
                    loaded: (current) => current.length,
                    failure: (prev, message) => prev.length + 1),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return _controller.value > 0
                  ? FadeTransition(
                      opacity: _opacityTween.animate(_controller),
                      child: GestureDetector(
                        onTap: _closeDrawer,
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).shadowColor.withOpacity(.2),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            },
          ),
          _buildDrawer(),
          _buildFabBackground(),
          _buildFab(),
        ],
      ),
    );
  }

  /// 아이템 선택시 나오는 drawer
  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final width = MediaQuery.of(context).size.width / 2;
        return Positioned(
          top: LayoutConstant.spaceXS,
          bottom: LayoutConstant.spaceXS,
          right: (_slideTween.animate(_controller).value - 1) * width,
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(LayoutConstant.radiusL),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, -1),
                  blurRadius: LayoutConstant.radiusXS,
                  color: Theme.of(context).shadowColor.withOpacity(.7),
                ),
              ],
            ),
            child: _controller.value > 0
                ? Padding(
                    padding: const EdgeInsets.all(LayoutConstant.paddingL),
                    child: Column(
                      children: [
                        const SizedBox(height: LayoutConstant.spaceM),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "상세내용",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(height: LayoutConstant.spaceM),
                        _buildDrawerRow(
                            title: "작업지시", value: _selectedQm!.workOrder),
                        _buildDrawerRow(
                            title: "PND", value: _selectedQm!.datePlanned),
                        _buildDrawerRow(
                            title: "Yard", value: _selectedQm!.yard),
                        _buildDrawerRow(
                            title: "Hull No", value: _selectedQm!.hullNo),
                        _buildDrawerRow(title: "구역", value: _selectedQm!.ship),
                        _buildDrawerRow(
                            title: "Sys No", value: _selectedQm!.sysNo),
                        _buildDrawerRow(
                            title: "품번", value: _selectedQm!.itemNo),
                        _buildDrawerRow(
                            title: "수량", value: "${_selectedQm!.qty}"),
                        const Spacer(),
                        QmStartEndButtons(
                          item: _selectedQm!,
                          onStartPressed: () {
                            ref
                                .read(qmSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  QmSaveEvent.saveQmItem(
                                    _selectedQm!,
                                    QmStatus.start,
                                    _selectedIndex!,
                                  ),
                                );
                          },
                          onStopPressed: () {
                            ref
                                .read(qmSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  QmSaveEvent.saveQmItem(
                                    _selectedQm!,
                                    QmStatus.end,
                                    _selectedIndex!,
                                  ),
                                );
                          },
                        ),
                      ],
                    ))
                : const SizedBox(),
          ),
        );
      },
    );
  }

  Widget _buildDrawerRow({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LayoutConstant.paddingM,
        vertical: LayoutConstant.paddingXS,
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFab() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      right: ref.watch(qmItemsNotifier).isMultiSelectMode
          ? LayoutConstant.spaceXL
          : -100,
      bottom: ref.watch(qmItemsNotifier).isMultiSelectMode
          ? LayoutConstant.spaceL
          : -100,
      child: AnimatedScale(
        scale: ref.watch(qmItemsNotifier).isMultiSelectMode ? 1 : 0,
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
                      .read(qmSaveStateNotifierProvider.notifier)
                      .mapEventToState(
                        QmSaveEvent.saveQmList(
                          ref.watch(qmItemsNotifier).selectedQmItem,
                          QmStatus.start,
                          ref.watch(qmItemsNotifier).selectedIndex.toList(),
                        ),
                      ),
                  tooltip: "Start",
                  backgroundColor: ThemeConstant.accentColor,
                  icon: Icons.play_arrow,
                  active: ref.read(qmItemsNotifier.notifier).isStartActive,
                ),
                const SizedBox(width: LayoutConstant.spaceM),
                _buildFabButton(
                  onTap: () => ref
                      .read(qmSaveStateNotifierProvider.notifier)
                      .mapEventToState(
                        QmSaveEvent.saveQmList(
                          ref.watch(qmItemsNotifier).selectedQmItem,
                          QmStatus.end,
                          ref.watch(qmItemsNotifier).selectedIndex.toList(),
                        ),
                      ),
                  tooltip: "End",
                  icon: Icons.stop,
                  backgroundColor: Theme.of(context).primaryColorDark,
                  active: ref.read(qmItemsNotifier.notifier).isEndActive,
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
                ref.read(qmItemsNotifier.notifier).clearSelection();
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
        scale: ref.watch(qmItemsNotifier).isMultiSelectMode ? 1 : 0,
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
