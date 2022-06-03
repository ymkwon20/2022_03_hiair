import 'package:flutter/material.dart';
import 'package:frontend/src/auth/application/auth_event.dart';
import 'package:frontend/src/auth/dependency_injection.dart';
import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/checklist/presentation/viewmodel/checklist_notifier.dart';

import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/no_glow_behavior.dart';
import 'package:frontend/src/image/domain/entities/image_source.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 팝업 dialog
class Dialog extends StatelessWidget {
  const Dialog({
    Key? key,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: Container(
              width: width ?? MediaQuery.of(context).size.width / 4,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(.5),
                    blurRadius: LayoutConstant.radiusXS,
                    offset: const Offset(
                      LayoutConstant.spaceXS,
                      LayoutConstant.spaceXS,
                    ),
                  ),
                ],
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class PageListDialog extends ConsumerWidget {
  const PageListDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(workBaseChangeNotifierProvider).items;
    return Dialog(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: LayoutConstant.paddingM),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(LayoutConstant.radiusM),
                )),
            alignment: Alignment.center,
            child: const Text(
              "페이지 선택",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM),
          Expanded(
            child: ScrollConfiguration(
              behavior: NoGlowBehavior(),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: LayoutConstant.spaceXS,
                    color: Theme.of(context).dividerColor,
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      ref
                          .read(workBaseChangeNotifierProvider.notifier)
                          .setCurrentBase(index);
                    },
                    child: Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.all(LayoutConstant.paddingL),
                              child: Text(items[index].wcName),
                            )),
                            Container(
                              width: LayoutConstant.spaceXS,
                              height: 50,
                              color: Theme.of(context).dividerColor,
                            ),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      LayoutConstant.paddingL),
                                  child: Text(items[index].wbName),
                                )),
                          ],
                        )),
                  );
                },
                itemCount: items.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignOutDialog extends ConsumerWidget {
  const SignOutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authChangeNotifierProvider).user;

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: LayoutConstant.paddingM),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(LayoutConstant.radiusM),
                )),
            alignment: Alignment.center,
            child: const Text(
              "로그 아웃",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM),
          Text.rich(
            TextSpan(
              text: "${user!.name} 님\n",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              children: const [
                TextSpan(
                  text: "로그아웃 하시겠습니까?",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: LayoutConstant.spaceM),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: _Button(
                  name: "No",
                  onTap: Navigator.of(context).pop,
                ),
              ),
              Expanded(
                child: _Button(
                  name: "Yes",
                  onTap: () => ref
                      .read(authStateNotifierProvider.notifier)
                      .mapEventToState(const AuthEvent.signOut()),
                  isPrimary: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.name,
    this.isPrimary = false,
    this.onTap,
  }) : super(key: key);

  final String name;
  final bool isPrimary;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: LayoutConstant.paddingM,
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: isPrimary
              ? TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                )
              : null,
        ),
      ),
    );
  }
}

class ImagePickerDialog extends ConsumerWidget {
  const ImagePickerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: LayoutConstant.paddingM),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(LayoutConstant.radiusM),
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              "이미지 추가",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM),
          const Text("이미지 경로 선택"),
          const SizedBox(height: LayoutConstant.spaceM),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: _Button(
                  name: "카메라",
                  onTap: () {
                    ref
                        .read(checkimagelistNotifierProvider.notifier)
                        .setImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                child: _Button(
                  name: "갤러리",
                  onTap: () {
                    ref
                        .read(checkimagelistNotifierProvider.notifier)
                        .setImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                  isPrimary: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
