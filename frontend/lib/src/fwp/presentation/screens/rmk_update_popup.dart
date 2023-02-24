import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/fwp/presentation/screens/rmk_control_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RMKUpdatePopup extends ConsumerStatefulWidget {
  const RMKUpdatePopup({
    Key? key,
    required this.code,
    required this.wonb,
    required this.planSeq,
  }) : super(key: key);

  final String code;
  final String wonb;
  final String planSeq;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RmkUpdatePopupState(code, wonb, planSeq);
}

class _RmkUpdatePopupState extends ConsumerState<RMKUpdatePopup> {
  _RmkUpdatePopupState(this.code, this.wonb, this.planSeq);

  final String code;
  final String wonb;
  final String planSeq;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              // ref.read(checklistNotifierProvider.notifier).clear();
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
                      Expanded(
                        child: RMKControlWidget(
                          code: code,
                          wonb: wonb,
                          planSeq: planSeq,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
