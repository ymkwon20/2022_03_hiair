import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_event.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/viewmodels/checklist_notifier.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_widget.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChecklistPopup extends ConsumerStatefulWidget {
  const ChecklistPopup({Key? key}) : super(key: key);

  @override
  ConsumerState<ChecklistPopup> createState() => _ChecklistPopupState();
}

class _ChecklistPopupState extends ConsumerState<ChecklistPopup> {
  bool openFlash = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<ChecklistSaveState>(
      checklistSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          saved: () {
            showFlashBar(
              context,
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );
            Navigator.of(context).pop();
          },
          savedAndNext: (status) {
            showFlashBar(
              context,
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );
            Navigator.of(context).pop();
          },
          failure: (message) {
            showFlashBar(
              context,
              title: "오류",
              content: "입력을 완료하지 않았습니다.",
              backgroundColor: Theme.of(context).errorColor,
            );
          },
          orElse: () {},
        );
      },
    );

    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              ref.read(checklistNotifierProvider.notifier).clear();
              Navigator.of(context).pop();
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(LayoutConstant.radiusM),
                      bottomLeft: Radius.circular(LayoutConstant.radiusM),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: LayoutConstant.paddingS,
                          horizontal: LayoutConstant.paddingL,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              if (ref
                                  .watch(checklistNotifierProvider.notifier)
                                  .isNotCompleted) {
                                if (!openFlash) {
                                  openFlash = true;
                                  showFlashBar(
                                    context,
                                    title: "오류",
                                    content: "입력을 완료하지 않았습니다.",
                                    backgroundColor:
                                        Theme.of(context).errorColor,
                                  );
                                  Future.delayed(const Duration(seconds: 2),
                                      () => openFlash = false);
                                }
                              } else {
                                ref
                                    .read(checklistSaveStateNotifierProvider
                                        .notifier)
                                    .mapEventToState(
                                      ChecklistSaveEvent.saveChecklist(ref
                                          .watch(checklistNotifierProvider)
                                          .items),
                                    );
                              }
                            },
                            child: const Text(
                              "저장",
                            ),
                          ),
                        ),
                      ),
                      const Expanded(child: ChecklistWidget()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
