import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/underline_widget.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_event.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_state.dart';
import 'package:frontend/src/impeller/dependency_injection.dart';
import 'package:frontend/src/impeller/presentation/screens/impeller_start_end_button.dart';
import 'package:frontend/src/impeller/presentation/viewmodels/impeller_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImpellerPopup extends ConsumerWidget {
  const ImpellerPopup({
    Key? key,
    required this.canSaveBothStartAndEnd,
  }) : super(key: key);

  final bool canSaveBothStartAndEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width / 2.5;
    final impeller = ref.watch(impellerNotifier);

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
                          title: "품번",
                          value: impeller.itemNo,
                        ),
                        const UnderlineWidget(),
                        _ImpellerDrawerRow(
                          title: "BLADE",
                          value: impeller.bldAngle,
                        ),
                        const UnderlineWidget(),
                        _ImpellerDrawerRow(
                          title: "SHAFT",
                          value: impeller.shaft,
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
                          onEndPressed: () {
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
