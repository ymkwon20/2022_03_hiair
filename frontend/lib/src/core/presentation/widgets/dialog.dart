import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/auth/application/auth_event.dart';
import 'package:frontend/src/auth/dependency_injection.dart';
import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/checklist/presentation/viewmodels/checklist_notifier.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/no_glow_behavior.dart';
import 'package:frontend/src/image/domain/entities/image_source.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/work_order_list_notifier.dart';

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
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM),
          Expanded(
            child: ScrollConfiguration(
              behavior: NoGlowBehavior(),
              child: ListView.separated(
                padding: EdgeInsets.zero,
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
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      LayoutConstant.paddingL),
                                  child: Text(
                                    items[index].wcName,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                )),
                            Container(
                              width: LayoutConstant.spaceXS,
                              height: 60,
                              color: Theme.of(context).dividerColor,
                            ),
                            Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      LayoutConstant.paddingL),
                                  child: Text(
                                    items[index].wbName,
                                    style: const TextStyle(fontSize: 20),
                                  ),
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
      width: MediaQuery.of(context).size.width / 3,
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
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM),
          Text.rich(
            TextSpan(
              text: "${user!.name} 님\n",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              children: const [
                TextSpan(
                  text: "로그아웃 하시겠습니까?",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
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
                  fontSize: 22,
                )
              : const TextStyle(fontSize: 22),
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
              style: TextStyle(color: Colors.white),
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

class CustomTableHeaderDialog extends ConsumerWidget {
  const CustomTableHeaderDialog({
    Key? key,
    required this.filterKey,
  }) : super(key: key);

  final String filterKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterList = ref.watch(columnFilterProvider);
    final currentFilterMap = ref.watch(workOrderListNotifier).filterMap;

    void _onTap(int index) {
      if (filterList[index].isSelected) {
        final newFilterList = currentFilterMap[filterKey]?.toList() ?? [];

        newFilterList.remove(filterList[index].name);

        ref
            .read(workOrderListNotifier.notifier)
            .setFilter(filterKey, newFilterList);
      } else {
        final newFilterList = currentFilterMap[filterKey]?.toList() ?? [];

        newFilterList.add(filterList[index].name);

        ref.read(workOrderListNotifier.notifier).setFilter(
              filterKey,
              newFilterList,
            );
      }
    }

    return Dialog(
      width: MediaQuery.of(context).size.width / 2,
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
              "필터",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (ref
                      .watch(workOrderListNotifier)
                      .filterMap
                      .keys
                      .contains(filterKey)) {
                    ref
                        .read(workOrderListNotifier.notifier)
                        .removeFilter(filterKey);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: LayoutConstant.paddingL,
                    vertical: LayoutConstant.paddingM,
                  ),
                  child: Text(
                    "필터 제거",
                    style: TextStyle(
                      color: ref
                              .watch(workOrderListNotifier)
                              .filterMap
                              .keys
                              .contains(filterKey)
                          ? Theme.of(context).primaryColorDark
                          : Theme.of(context).disabledColor,
                      fontSize: 22,
                      fontWeight: ref
                              .watch(workOrderListNotifier)
                              .filterMap
                              .keys
                              .contains(filterKey)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: ScrollConfiguration(
              behavior: NoGlowBehavior(),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: LayoutConstant.paddingS,
                        vertical: LayoutConstant.paddingL),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => _onTap(index),
                      child: Row(
                        children: [
                          Checkbox(
                            value: filterList[index].isSelected,
                            onChanged: (_) => _onTap(index),
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: filterList[index].name,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.color,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                padding: EdgeInsets.zero,
                itemCount: filterList.length,
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM),
        ],
      ),
    );
  }
}

class SavingDialog extends StatelessWidget {
  const SavingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(LayoutConstant.radiusM))),
        backgroundColor: Colors.black87,
        content: Padding(
          padding: const EdgeInsets.all(LayoutConstant.paddingL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLoadingIndicator(),
              _getHeader(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.only(bottom: LayoutConstant.paddingL),
      child: SizedBox(
        width: LayoutConstant.spaceXL,
        height: LayoutConstant.spaceXL,
        child: CircularProgressIndicator(
          strokeWidth: LayoutConstant.spaceXS,
        ),
      ),
    );
  }

  Widget _getHeader() {
    return const Padding(
      padding: EdgeInsets.only(bottom: LayoutConstant.paddingS),
      child: Text(
        "저장 중 ...",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
