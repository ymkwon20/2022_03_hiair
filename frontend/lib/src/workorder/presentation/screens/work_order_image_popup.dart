import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/image/domain/entities/image_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/presentation/viewmodels/checklist_notifier.dart';
import 'package:frontend/src/core/presentation/image_widget.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/no_glow_behavior.dart';
import 'package:package_info_plus/package_info_plus.dart';

class WorkOrderImagePopup extends ConsumerStatefulWidget {
  const WorkOrderImagePopup({Key? key}) : super(key: key);

  @override
  ConsumerState<WorkOrderImagePopup> createState() =>
      _WorkOrderImagePopupState();
}

class _WorkOrderImagePopupState extends ConsumerState<WorkOrderImagePopup> {
  bool openFlash = false;
  TextEditingController saveCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
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
                            if (saveCodeController.text == '') {
                              showFlashBar(
                                context,
                                title: "오류",
                                content: "저장 코드를 입력해주세요.",
                                backgroundColor: Theme.of(context).errorColor,
                              );
                              Future.delayed(
                                const Duration(seconds: 2),
                              );
                            } else {
                              final items = ref
                                  .watch(checkimagelistNotifierProvider)
                                  .items;

                              final formData = FormData();
                              final imageParams =
                                  <MapEntry<String, MultipartFile>>[];

                              if (items.isEmpty) {
                                showFlashBar(
                                  context,
                                  title: "오류",
                                  content: "사진이 선택되지 않았습니다.",
                                  backgroundColor: Theme.of(context).errorColor,
                                );
                              } else {
                                for (int i = 0; i < items.length; i++) {
                                  String _imagePath = items[i].path;
                                  String _fileName = _imagePath.split('/').last;
                                  final img = MultipartFile.fromFileSync(
                                      _imagePath,
                                      filename: _imagePath);
                                  imageParams.add(MapEntry("file", img));

                                  saveImageQuery(
                                    _fileName,
                                    saveCodeController.text,
                                  );
                                }

                                formData.files.addAll(imageParams);

                                save_images(formData);

                                showFlashBar(
                                  context,
                                  title: "저장 완료",
                                  content: "저장이 완료되었습니다.",
                                  backgroundColor:
                                      Theme.of(context).primaryColorLight,
                                );
                                ref
                                    .watch(checkimagelistNotifierProvider)
                                    .clear();
                                saveCodeController.text = '';

                                Future.delayed(
                                  const Duration(seconds: 2),
                                );

                                Navigator.of(context).pop();
                              }
                            }
                          },
                          child: const Text(
                            "저장",
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: LayoutConstant.spaceM,
                        horizontal: LayoutConstant.spaceL,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "공정별 사진 촬영",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: LayoutConstant.spaceM,
                            horizontal: LayoutConstant.spaceL,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "저장 코드",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            controller: saveCodeController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '저장코드',
                            ),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        )
                      ],
                    ),
                    const Expanded(child: WorkOrderImageListWidget()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> save_images(formData) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    await ref.watch(dioProvider).post(
      "/imagesByPath",
      data: formData,
      queryParameters: {"dirName": "D:\\FILE_UP_DOWN\\IMAGE\\PIC\\WB"},
    );
  }

  Future<void> saveImageQuery(_fileName, wbKey) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    await ref.watch(dioProvider).post(
      "/saveImageWorkOrder",
      queryParameters: {
        "WB_KEY": wbKey,
        "NEW1_FN": _fileName,
        "WORK_ID": ref.watch(authChangeNotifierProvider).user!.id,
      },
    );
  }
}

class WorkOrderImageListWidget extends ConsumerStatefulWidget {
  const WorkOrderImageListWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<WorkOrderImageListWidget> createState() =>
      _WorkOrderImageListWidgetState();
}

class _WorkOrderImageListWidgetState
    extends ConsumerState<WorkOrderImageListWidget> {
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
