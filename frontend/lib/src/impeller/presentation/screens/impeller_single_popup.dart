import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/application/load/checklist_event.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_popup.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_popup_for_impeller_single.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/widgets/underline_widget.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_event.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_state.dart';
import 'package:frontend/src/impeller/dependency_injection.dart';
import 'package:frontend/src/impeller/domain/entities/impeller.dart';
import 'package:frontend/src/impeller/presentation/screens/impeller_start_end_button.dart';
import 'package:frontend/src/impeller/presentation/viewmodels/barcode_notifier.dart';
import 'package:frontend/src/impeller/presentation/viewmodels/impeller_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImpellerSinglePopup extends ConsumerWidget {
  const ImpellerSinglePopup({
    Key? key,
    required this.canSaveBothStartAndEnd,
    required this.impeller,
  }) : super(key: key);

  final bool canSaveBothStartAndEnd;
  final Impeller impeller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width / 1.8;
    final barcode = ref.watch(barcodeNotifier);

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
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
                child: Container(
                  width: width,
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
                          title: "작업지시번호",
                          value: impeller.code,
                        ),
                        const UnderlineWidget(),
                        _ImpellerDrawerRow(
                          title: "품목코드",
                          value: impeller.partNo,
                        ),
                        const UnderlineWidget(),
                        _ImpellerDrawerRow(
                          title: "지시수량",
                          value: impeller.qty.toString(),
                        ),
                        const UnderlineWidget(),
                        _ImpellerDrawerRow(
                          title: "SHAFT",
                          value: impeller.shaft,
                        ),
                        const UnderlineWidget(),
                        _ImpellerDrawerRow(
                          title: "BLADE TYPE",
                          value: impeller.bldType,
                        ),
                        const UnderlineWidget(),
                        _ImpellerDrawerRow(
                          title: "FAN TYPE",
                          value: impeller.fanType,
                        ),
                        const UnderlineWidget(),
                        _ImpellerDrawerRow(
                          title: "BLADE 수량",
                          value: impeller.bldQTY,
                        ),
                        const UnderlineWidget(),
                        _ImpellerDrawerRow(
                          title: "RMK",
                          value: impeller.rmk,
                        ),
                        const Spacer(),
                        ImpellerStartEndButtons(
                          dateStart: impeller.dateStart,
                          dateEnd: impeller.dateEnd,
                          onStartPressed: () {
                            Navigator.of(context).pop();
                            ref
                                .read(
                                    impellerSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  ImpellerSaveEvent.saveImpeller(
                                    impeller,
                                    ImpellerSaveStatus.start,
                                    ref.watch(impellerIndexNotifier)!,
                                  ),
                                );
                          },
                          onStartCancelPressed: () {
                            Navigator.of(context).pop();
                            ref
                                .read(
                                    impellerSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  ImpellerSaveEvent.saveImpeller(
                                    impeller,
                                    ImpellerSaveStatus.startCancel,
                                    ref.watch(impellerIndexNotifier)!,
                                  ),
                                );
                          },
                          onEndPressed: () {
                            Navigator.of(context).pop();
                            // final impeller = ref.watch(impellerNotifier);
                            ref
                                .read(checklistStateNotifierProvider.notifier)
                                .mapEventToState(
                                  ChecklistEvent.fetchChecklistForImpeller(
                                      impeller),
                                );
                            Navigator.of(context).push(
                              CustomSlideRoute(
                                backgroundColor: Colors.black.withOpacity(.2),
                                builder: (context) =>
                                    ChecklistPopupImpellerSingle(
                                  impeller: impeller,
                                  index: ref.watch(impellerIndexNotifier)!,
                                  saveFlag: false,
                                ),
                              ),
                            );
                          },
                          onSavePressed: () {
                            Navigator.of(context).pop();
                            ref
                                .read(
                                    impellerSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  ImpellerSaveEvent.saveImpeller(
                                    impeller,
                                    ImpellerSaveStatus.end,
                                    ref.watch(impellerIndexNotifier)!,
                                  ),
                                );
                          },
                          onStartAndEndPressed: () {
                            Navigator.of(context).pop();
                            // final impeller = ref.watch(impellerNotifier);
                            ref
                                .read(checklistStateNotifierProvider.notifier)
                                .mapEventToState(
                                  ChecklistEvent.fetchChecklistForImpeller(
                                      impeller),
                                );

                            Navigator.of(context).push(
                              CustomSlideRoute(
                                backgroundColor: Colors.black.withOpacity(.2),
                                builder: (context) =>
                                    ChecklistPopupImpellerSingle(
                                  impeller: impeller,
                                  index: ref.watch(impellerIndexNotifier)!,
                                  saveFlag: true,
                                ),
                              ),
                            );
                          },
                          onStartAndSavePressed: () {
                            Navigator.of(context).pop();
                            ref
                                .read(
                                    impellerSaveStateNotifierProvider.notifier)
                                .mapEventToState(
                                  ImpellerSaveEvent.saveImpeller(
                                    impeller,
                                    ImpellerSaveStatus.all,
                                    ref.watch(impellerIndexNotifier)!,
                                  ),
                                );
                          },
                          ignoring:
                              ref.watch(impellerSaveStateNotifierProvider) ==
                                  const ImpellerSaveState.saving(),
                          onChecklistButtonPressed: () {
                            ref
                                .read(checklistStateNotifierProvider.notifier)
                                .mapEventToState(
                                  ChecklistEvent.fetchChecklistForImpeller(
                                      impeller),
                                );

                            Navigator.of(context).push(
                              CustomSlideRoute(
                                backgroundColor: Colors.black.withOpacity(.2),
                                builder: (context) => const ChecklistPopup(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
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
