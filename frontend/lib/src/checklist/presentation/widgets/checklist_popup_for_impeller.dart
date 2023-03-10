import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_event.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/viewmodels/checklist_notifier.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_widget.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/underline_widget.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_event.dart';
import 'package:frontend/src/impeller/dependency_injection.dart';
import 'package:frontend/src/impeller/domain/entities/impeller.dart';
import 'package:frontend/src/impeller/presentation/screens/impeller_finish_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChecklistPopupImpeller extends ConsumerWidget {
  const ChecklistPopupImpeller({
    Key? key,
    required this.impeller,
    required this.index,
    required this.saveFlag,
  }) : super(key: key);

  final Impeller impeller;
  final int index;
  final bool saveFlag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width / 2.5;
    bool openFlash = false;

    ref.listen<ChecklistSaveState>(
      checklistSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          saved: () {},
          savedAndNext: (status) {},
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
            right: 471,
            child: SafeArea(
              child: Container(
                width: 400,
                height: double.infinity,
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
                child: Container(
                  padding: const EdgeInsets.all(LayoutConstant.paddingL),
                  width: width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: LayoutConstant.spaceM),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "상세내용",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: LayoutConstant.spaceM),
                      _ImpellerDrawerRow(
                        title: "BLADE",
                        value: impeller.bldAngle,
                      ),
                      const UnderlineWidget(),
                      _ImpellerDrawerRow(
                        title: "Yard",
                        value: impeller.yard,
                      ),
                      const UnderlineWidget(),
                      _ImpellerDrawerRow(
                        title: "Hull No",
                        value: impeller.hullNo,
                      ),
                      const UnderlineWidget(),
                      _ImpellerDrawerRow(
                        title: "구역",
                        value: impeller.ship,
                      ),
                      const UnderlineWidget(),
                      _ImpellerDrawerRow(
                        title: "Sys No",
                        value: impeller.sysNo,
                      ),
                      const UnderlineWidget(),
                      _ImpellerDrawerRow(
                        title: "Fan Type",
                        value: impeller.fanType,
                      ),
                      const UnderlineWidget(),
                      _ImpellerDrawerRow(
                        title: "SHAFT",
                        value: impeller.shaft,
                      ),
                      const UnderlineWidget(),
                      _ImpellerDrawerRow(
                        title: "규격",
                        value: impeller.spec,
                      ),
                      const UnderlineWidget(),
                      _ImpellerDrawerRow(
                        title: "RMK",
                        value: impeller.rmk,
                      ),
                      const Spacer(),
                      ImpellerFinishButtons(
                        dateStart: impeller.dateStart,
                        dateEnd: impeller.dateEnd,
                        onFinishPressed: () {
                          Navigator.of(context).pop();
                          if (saveFlag) {
                            ref
                                .read(
                                    impellerSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  ImpellerSaveEvent.saveImpeller(
                                    impeller,
                                    ImpellerSaveStatus.all,
                                    index,
                                  ),
                                );
                          } else {
                            ref
                                .read(
                                    impellerSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  ImpellerSaveEvent.saveImpeller(
                                    impeller,
                                    ImpellerSaveStatus.end,
                                    index,
                                  ),
                                );
                          }

                          ref
                              .read(checklistSaveStateNotifierProvider.notifier)
                              .mapEventToState(
                                ChecklistSaveEvent.saveChecklist(
                                    ref.watch(checklistNotifierProvider).items),
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ),
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
                          // child: ElevatedButton(
                          //   onPressed: () {
                          //     if (ref
                          //         .watch(checklistNotifierProvider.notifier)
                          //         .isNotCompleted) {
                          //       if (!openFlash) {
                          //         openFlash = true;
                          //         showFlashBar(
                          //           context,
                          //           title: "오류",
                          //           content: "입력을 완료하지 않았습니다.",
                          //           backgroundColor:
                          //               Theme.of(context).errorColor,
                          //         );
                          //         Future.delayed(const Duration(seconds: 2),
                          //             () => openFlash = false);
                          //       }
                          //     } else {
                          //       ref
                          //           .read(checklistSaveStateNotifierProvider
                          //               .notifier)
                          //           .mapEventToState(
                          //             ChecklistSaveEvent.saveChecklist(ref
                          //                 .watch(checklistNotifierProvider)
                          //                 .items),
                          //           );
                          //     }
                          //   },
                          //   child: const Text(
                          //     "저장",
                          //   ),
                          // ),
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

class _ImpellerDrawerRow extends StatelessWidget {
  const _ImpellerDrawerRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
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
                  fontSize: 20,
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
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
