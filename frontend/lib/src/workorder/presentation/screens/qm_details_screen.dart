import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/presentation/viewmodels/checklist_notifier.dart';
import 'package:frontend/src/core/presentation/fonts.gen.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/workorder/application/qm_work_order/save/qm_work_order_save_event.dart';
import 'package:frontend/src/workorder/application/qm_work_order/save/qm_work_order_save_state.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/presentation/screens/qm_work_order_screen.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/qm_work_order_list_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:frontend/src/checklist/application/load/checklist_event.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_image_popup.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_popup.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:frontend/src/qm/application/menu/qm_menu_event.dart';
import 'package:frontend/src/qm/application/menu/qm_menu_state.dart';
import 'package:frontend/src/qm/dependency_injection.dart';
import 'package:frontend/src/qm/presentation/viewmodels/qm_menulist_notifier.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/presentation/screens/qm_details_widget.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/work_order_list_notifier.dart';

class QmDetailsScreen extends StatelessWidget {
  const QmDetailsScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProviderScope(
              overrides: [
                workOrderIndexNotifier.overrideWithValue(index),
              ],
              child: const Expanded(
                child: QmDetailsPage(),
              ),
            ),
            Container(
              width: LayoutConstant.spaceXS,
              height: double.infinity,
              color: Theme.of(context).dividerColor,
            ),
            const Expanded(
              child: QmSelectionModePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class QmDetailsPage extends ConsumerStatefulWidget {
  const QmDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<QmDetailsPage> createState() => _QmDetailsPageState();
}

class _QmDetailsPageState extends ConsumerState<QmDetailsPage> {
  bool ignoring = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<QmWorkOrderSaveState>(
      qmWorkOrderSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          saving: () {
            ignoring = true;
          },
          saved: (index) {
            ignoring = true;

            ref
                .read(workOrderSaveStateNotifierProvider.notifier)
                .mapEventToState(const WorkOrderSaveEvent.resetToNone());

            ref.read(qmWorkOrderListNotifier.notifier).removeAt(index);

            showFlashBar(
              context,
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );

            context.pop();
          },
          orElse: () {
            ignoring = false;
            ref.read(workOrderListNotifier.notifier).clearSelection();
          },
        );
      },
    );

    final saveState = ref.watch(qmWorkOrderSaveStateNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LayoutConstant.paddingL,
        vertical: LayoutConstant.paddingS,
      ),
      child: ScrollConfiguration(
        behavior: NoGlowBehavior(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '날짜: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              const SizedBox(height: LayoutConstant.spaceM),
              const QmDetailsWidget(),
              const SizedBox(height: LayoutConstant.spaceL),
              IgnorePointer(
                ignoring: ignoring,
                child: InkWell(
                  onTap: () {
                    ref
                        .read(qmWorkOrderSaveStateNotifierProvider.notifier)
                        .mapEventToState(
                          QmWorkOrderSaveEvent.saveQmWorkOrder(
                            ref.watch(currentQmWorkOrder),
                            ref.watch(currentQmWorkOrderIndex),
                          ),
                        );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: LayoutConstant.paddingM,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ThemeConstant.dominantColor,
                      borderRadius:
                          BorderRadius.circular(LayoutConstant.radiusS),
                    ),
                    // CircularProgressIndicator등 다른 자식 Widget에 의해
                    // 높이가 변경되어 바뀔수 있으므로 SizedBox에 height 처리
                    child: SizedBox(
                      height: LayoutConstant.spaceXL,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: saveState.maybeWhen(
                          none: () {
                            return const Text(
                              "검사완료",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamily.iropke,
                              ),
                            );
                          },
                          saving: () {
                            // CircularProgressIndicator의 크기 조절이 불가능하여
                            // SizedBox안에 처리
                            return const SizedBox(
                              height: LayoutConstant.spaceL,
                              width: LayoutConstant.spaceL,
                              child: CircularProgressIndicator(
                                strokeWidth: LayoutConstant.spaceXS,
                                color: Colors.white,
                              ),
                            );
                          },
                          saved: (_) {
                            return const Icon(
                              Icons.check,
                              color: Colors.white,
                            );
                          },
                          failure: (message) {
                            return const Icon(
                              Icons.close,
                              color: Colors.white,
                            );
                          },
                          orElse: () {
                            return const Icon(
                              Icons.check,
                              color: Colors.white,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // WorkOrderStartEndButtons(
              //   dateStart: workOrder.dateStart,
              //   dateEnd: workOrder.dateEnd,
              //   onStartPressed: () {
              //     ref
              //         .read(workOrderSaveStateNotifierProvider.notifier)
              //         .mapEventToState(
              //           WorkOrderSaveEvent.saveWorkOrder(
              //             workOrder,
              //             WorkOrderSaveStatus.start,
              //             ref.watch(workOrderIndexNotifier)!,
              //           ),
              //         );
              //   },
              //   onEndPressed: () {
              //     ref
              //         .read(workOrderSaveStateNotifierProvider.notifier)
              //         .mapEventToState(
              //           WorkOrderSaveEvent.saveWorkOrder(
              //             workOrder,
              //             WorkOrderSaveStatus.end,
              //             ref.watch(workOrderIndexNotifier)!,
              //           ),
              //         );
              //   },
              //   onStartAndEndPressed: null,
              //   ignoring: ref.watch(workOrderSaveStateNotifierProvider) ==
              //           const WorkOrderSaveState.saving() ||
              //       ref.watch(checklistSaveStateNotifierProvider) ==
              //           const ChecklistSaveState.saving(),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

/// 검사 기준정보 아래 버튼을 클릭했을 때 나오는 화면
class QmSelectionModePage extends ConsumerStatefulWidget {
  const QmSelectionModePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<QmSelectionModePage> createState() =>
      _QmSelectionModePageState();
}

class _QmSelectionModePageState extends ConsumerState<QmSelectionModePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(qmMenuStateNotifierProvider.notifier)
          .mapEventToState(const QmMenuEvent.fetchQmMenulist()),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<QmMenuState>(
      qmMenuStateNotifierProvider,
      ((previous, current) {
        current.maybeWhen(
          loaded: (items) {
            ref.read(qmMenulistNotifierProvider.notifier).setNewMenus(items);
          },
          orElse: () {},
        );
      }),
    );

    return ScrollConfiguration(
      behavior: NoGlowBehavior(),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: LayoutConstant.spaceL);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ref
                  .read(checklistNotifierProvider.notifier)
                  .setQm(ref.watch(qmMenulistNotifierProvider).menus[index]);

              if (index < 3) {
                ref
                    .read(checklistStateNotifierProvider.notifier)
                    .mapEventToState(
                      ChecklistEvent.fetchChecklist(
                        ref.watch(currentQmWorkOrder),
                        ref.watch(qmMenulistNotifierProvider).menus[index].code,
                      ),
                    );
              } else {
                ref
                    .read(checklistStateNotifierProvider.notifier)
                    .mapEventToState(
                      ChecklistEvent.fetchCheckimagelist(
                        ref.watch(currentQmWorkOrder),
                      ),
                    );
              }
              Navigator.of(context).push(
                CustomSlideRoute(
                  builder: (context) {
                    if (index < 3) {
                      return const ChecklistPopup();
                    } else {
                      return const ChecklistImagePopup();
                    }
                  },
                  backgroundColor: Colors.black.withOpacity(.2),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              margin:
                  const EdgeInsets.symmetric(horizontal: LayoutConstant.spaceM),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(LayoutConstant.radiusM)),
              alignment: Alignment.center,
              child: Text(
                ref.watch(qmMenulistNotifierProvider).menus[index].name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          );
        },
        itemCount: ref.watch(qmMenulistNotifierProvider).menus.length,
      ),
    );
  }
}
