import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/presentation/viewmodel/checklist_notifier.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:frontend/src/checklist/application/load/checklist_event.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_image_popup.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_popup.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:frontend/src/qm/application/menu/qm_menu_event.dart';
import 'package:frontend/src/qm/application/menu/qm_menu_state.dart';
import 'package:frontend/src/qm/dependency_injection.dart';
import 'package:frontend/src/qm/presentation/view_models/qm_menulist_notifier.dart';
import 'package:frontend/src/workorder/application/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/application/save/work_order_save_state.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/presentation/screens/qm_details_widget.dart';
import 'package:frontend/src/workorder/presentation/screens/work_order_start_end_button.dart';
import 'package:frontend/src/workorder/presentation/viewmodel/qm_work_order_notifier.dart';
import 'package:frontend/src/workorder/presentation/viewmodel/work_order_list_notifier.dart';

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
  @override
  Widget build(BuildContext context) {
    ref.listen<WorkOrderSaveState>(
      workOrderSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          oneSaved: (index, date, status) {
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
              default:
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

            setState(() {});
          },
          orElse: () {
            ref.read(workOrderListNotifier.notifier).clearSelection();
          },
        );
      },
    );

    final workOrder = ref.watch(qmWorkOrderNotifierProvider).order!;

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
              const SizedBox(height: LayoutConstant.spaceM),
              WorkOrderStartEndButtons(
                dateStart: workOrder.dateStart,
                dateEnd: workOrder.dateEnd,
                onStartPressed: () {
                  ref
                      .read(workOrderSaveStateNotifierProvider.notifier)
                      .mapEventToState(
                        WorkOrderSaveEvent.saveWorkOrder(
                          workOrder,
                          WorkOrderSaveStatus.start,
                          ref.watch(workOrderIndexNotifier)!,
                        ),
                      );
                },
                onEndPressed: () {
                  ref
                      .read(workOrderSaveStateNotifierProvider.notifier)
                      .mapEventToState(
                        WorkOrderSaveEvent.saveWorkOrder(
                          workOrder,
                          WorkOrderSaveStatus.end,
                          ref.watch(workOrderIndexNotifier)!,
                        ),
                      );
                },
                onStartAndEndPressed: null,
                ignoring: ref.watch(workOrderSaveStateNotifierProvider) ==
                        const WorkOrderSaveState.saving() ||
                    ref.watch(checklistSaveStateNotifierProvider) ==
                        const ChecklistSaveState.saving(),
              )
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
                        ref.watch(qmWorkOrderNotifierProvider).order!,
                        ref.watch(qmMenulistNotifierProvider).menus[index].code,
                      ),
                    );
              } else {
                ref
                    .read(checklistStateNotifierProvider.notifier)
                    .mapEventToState(
                      ChecklistEvent.fetchCheckimagelist(
                        ref.watch(qmWorkOrderNotifierProvider).order!,
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
