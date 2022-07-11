import 'package:flutter/material.dart';
import 'package:frontend/src/image/domain/entities/image_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/application/load/checklist_state.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_event.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/viewmodels/checklist_notifier.dart';
import 'package:frontend/src/core/presentation/image_widget.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/no_glow_behavior.dart';

class ChecklistImagePopup extends ConsumerStatefulWidget {
  const ChecklistImagePopup({Key? key}) : super(key: key);

  @override
  ConsumerState<ChecklistImagePopup> createState() => _ChecklistPopupState();
}

class _ChecklistPopupState extends ConsumerState<ChecklistImagePopup> {
  bool openFlash = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<ChecklistState>(checklistStateNotifierProvider,
        (previous, current) {
      current.maybeWhen(
        imageLoaded: (images) {
          ref
              .read(checkimagelistNotifierProvider.notifier)
              .setCheckimagelist(images);
        },
        orElse: () {},
      );
    });

    ref.listen<ChecklistSaveState>(checklistSaveStateNotifierProvider,
        ((previous, current) {
      current.maybeWhen(
        saved: () {
          ref.read(checkimagelistNotifierProvider.notifier).clear();
          Navigator.pop(context);
          showFlashBar(
            context,
            title: "저장 완료",
            content: "",
            backgroundColor: Theme.of(context).primaryColorLight,
          );
        },
        failure: (message) {
          showFlashBar(
            context,
            title: "저장 오류",
            content: message,
            backgroundColor: Theme.of(context).errorColor,
          );
        },
        orElse: () {},
      );
    }));

    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              // ref.read(checkimagelistNotifierProvider.notifier).clear();
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
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!ref
                                .read(checkimagelistNotifierProvider.notifier)
                                .shouldSave) {
                              Navigator.of(context).pop();
                            } else {
                              ref
                                  .read(checklistSaveStateNotifierProvider
                                      .notifier)
                                  .mapEventToState(
                                    ChecklistSaveEvent.saveImagelist(
                                      ref
                                          .watch(checkimagelistNotifierProvider)
                                          .items,
                                    ),
                                  );
                            }
                          },
                          child: const Text(
                            "저장",
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: CheckImageListWidget()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckImageListWidget extends ConsumerStatefulWidget {
  const CheckImageListWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<CheckImageListWidget> createState() =>
      _CheckImageListWidgetState();
}

class _CheckImageListWidgetState extends ConsumerState<CheckImageListWidget> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(checkimagelistNotifierProvider).items;
    return Padding(
      padding: const EdgeInsets.all(LayoutConstant.paddingM),
      child: ScrollConfiguration(
        behavior: NoGlowBehavior(),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: LayoutConstant.spaceM);
          },
          itemBuilder: (context, index) {
            if (index < items.length) {
              return Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.all(LayoutConstant.paddingM),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
                  border: Border.all(
                    width: LayoutConstant.spaceXS,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: ImageWidget(
                        imagePath: items[index].isLocal
                            ? items[index].path
                            : "${LogicConstant.baseFileServerUrl}/${items[index].path}",
                        isLocal: items[index].isLocal,
                      ),
                    ),
                    const SizedBox(width: LayoutConstant.spaceM),
                    Expanded(
                      child: CheckImageRemarkWidget(
                        remark: items[index].remark,
                        onEditingComplete: (remark) {
                          ref
                              .read(checkimagelistNotifierProvider.notifier)
                              .editRemarkAt(index, remark);
                        },
                      ),
                    ),
                    const SizedBox(width: LayoutConstant.spaceM),
                    if (items[index].isLocal)
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          ref
                              .read(checkimagelistNotifierProvider.notifier)
                              .removeAt(index);
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.all(LayoutConstant.paddingM),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.close),
                              SizedBox(height: LayoutConstant.spaceS),
                              Text("삭제"),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    CustomScaleRoute(
                      backgroundColor: Colors.black.withOpacity(.2),
                      builder: (context) => ImagePickerDialog(
                        onCamera: () {
                          ref
                              .read(checkimagelistNotifierProvider.notifier)
                              .setImage(ImageSource.camera);
                        },
                        onGallery: () {
                          ref
                              .read(checkimagelistNotifierProvider.notifier)
                              .setImage(ImageSource.gallery);
                        },
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(LayoutConstant.paddingM),
                  child: Row(
                    children: const [
                      Icon(Icons.add),
                      SizedBox(width: LayoutConstant.spaceM),
                      Text("사진 추가하기"),
                    ],
                  ),
                ),
              );
            }
          },
          itemCount: ref.watch(checkimagelistNotifierProvider).items.length + 1,
        ),
      ),
    );
  }
}

class CheckImageRemarkWidget extends StatefulWidget {
  const CheckImageRemarkWidget({
    Key? key,
    required this.remark,
    required this.onEditingComplete,
  }) : super(key: key);

  final String remark;
  final void Function(String) onEditingComplete;

  @override
  State<CheckImageRemarkWidget> createState() => _CheckImageRemarkWidgetState();
}

class _CheckImageRemarkWidgetState extends State<CheckImageRemarkWidget> {
  late FocusNode _node;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _node = FocusNode(debugLabel: widget.remark);
    _controller = TextEditingController();
    _controller.text = widget.remark;
  }

  @override
  void dispose() {
    _node.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _node,
      onFocusChange: (isFocus) {
        if (!isFocus) {
          if (widget.remark != _controller.text) {
            widget.onEditingComplete.call(_controller.text);
          }
        }
      },
      child: TextField(
        controller: _controller,
      ),
    );
  }
}
