import 'package:flutter/material.dart';
import 'package:frontend/src/bad_control/presentation/screens/bad_control_widget.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BadControlPopup extends ConsumerStatefulWidget {
  const BadControlPopup({Key? key}) : super(key: key);

  @override
  ConsumerState<BadControlPopup> createState() => _BadControlPopupState();
}

class _BadControlPopupState extends ConsumerState<BadControlPopup> {
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: LayoutConstant.paddingS,
                          horizontal: LayoutConstant.paddingL,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "저장",
                            ),
                          ),
                        ),
                      ),
                      const Expanded(child: BadControlWidget()),
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
