import 'package:flutter/material.dart';
import 'package:frontend/src/impeller/presentation/viewmodels/impeller_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:frontend/src/auth/application/auth_event.dart';
import 'package:frontend/src/auth/dependency_injection.dart';
import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/no_glow_behavior.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/work_order_list_notifier.dart';

/// 팝업 dialo
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
              "공정 선택",
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
        padding: const EdgeInsets.symmetric(vertical: LayoutConstant.paddingM),
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

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({
    Key? key,
    required this.onCamera,
    required this.onGallery,
  }) : super(key: key);

  final VoidCallback onCamera;
  final VoidCallback onGallery;

  @override
  Widget build(BuildContext context) {
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
                    Navigator.of(context).pop();
                    onCamera.call();
                  },
                ),
              ),
              Expanded(
                child: _Button(
                  name: "갤러리",
                  onTap: () {
                    Navigator.of(context).pop();
                    onGallery.call();
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
    final textFieldController = TextEditingController();

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

    void _onTapByString(String filterString) {
      final newFilterList = <String>[];

      for (int i = 0; i < filterList.length; i++) {
        if (filterList[i].name.contains(filterString)) {
          newFilterList.add(filterList[i].name);
        }
      }

      ref.read(workOrderListNotifier.notifier).setFilter(
            filterKey,
            newFilterList,
          );
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: textFieldController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '입력',
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Icon(Icons.search),
                  onPressed: () => _onTapByString(textFieldController.text),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 40)),
                ),
              ],
            ),
          ),
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

class ImpellerFilterDialog extends ConsumerWidget {
  const ImpellerFilterDialog({
    Key? key,
    required this.filterKey,
  }) : super(key: key);

  final String filterKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterList = ref.watch(impellerColumnFilterProvider);
    final currentFilterMap = ref.watch(impellerListNotifier).filterMap;
    final textFieldController = TextEditingController();

    void _onTap(int index) {
      if (filterList[index].isSelected) {
        final newFilterList = currentFilterMap[filterKey]?.toList() ?? [];

        newFilterList.remove(filterList[index].name);

        ref
            .read(impellerListNotifier.notifier)
            .setFilter(filterKey, newFilterList);
      } else {
        final newFilterList = currentFilterMap[filterKey]?.toList() ?? [];

        newFilterList.add(filterList[index].name);

        ref.read(impellerListNotifier.notifier).setFilter(
              filterKey,
              newFilterList,
            );
      }
    }

    void _onTapByString(String filterString) {
      final newFilterList = <String>[];

      for (int i = 0; i < filterList.length; i++) {
        if (filterList[i].name.contains(filterString)) {
          newFilterList.add(filterList[i].name);
        }
      }

      ref.read(impellerListNotifier.notifier).setFilter(
            filterKey,
            newFilterList,
          );
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
                    .watch(impellerListNotifier)
                    .filterMap
                    .keys
                    .contains(filterKey)) {
                  ref
                      .read(impellerListNotifier.notifier)
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
                            .watch(impellerListNotifier)
                            .filterMap
                            .keys
                            .contains(filterKey)
                        ? Theme.of(context).primaryColorDark
                        : Theme.of(context).disabledColor,
                    fontSize: 22,
                    fontWeight: ref
                            .watch(impellerListNotifier)
                            .filterMap
                            .keys
                            .contains(filterKey)
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: textFieldController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '입력',
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Icon(Icons.search),
                  onPressed: () => _onTapByString(textFieldController.text),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 40)),
                ),
              ],
            ),
          ),
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

class VersionDialog extends StatelessWidget {
  const VersionDialog({
    Key? key,
    required this.localVersion,
    required this.latestVersion,
  }) : super(key: key);

  final String localVersion;
  final String latestVersion;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: LayoutConstant.paddingM,
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(LayoutConstant.radiusM),
                )),
            alignment: Alignment.center,
            child: const Text(
              "새 버전 다운로드",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: LayoutConstant.paddingL),
            child: Text.rich(
              TextSpan(
                text:
                    "$localVersion -> $latestVersion\n으로 업데이트가 필요합니다. 확인을 눌러 다운로드 합니다.\n",
                style: const TextStyle(
                  fontSize: 22,
                ),
                children: const [
                  TextSpan(
                    text: "(새 버전을 다운로드 하지 않아 발생한 오류는 책임지지 않습니다.)",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: _Button(
                  name: "취소",
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                child: _Button(
                  name: "확인",
                  onTap: () async {
                    final apkUrl =
                        "${LogicConstant.baseApiServerUrl}/apk/$latestVersion";
                    launchUrl(
                      Uri.parse(apkUrl),
                      mode: LaunchMode.externalApplication,
                    );
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

class RemarkDialog extends StatefulWidget {
  const RemarkDialog({
    Key? key,
    required this.remark,
  }) : super(key: key);

  final String remark;

  @override
  State<RemarkDialog> createState() => _RemarkDialogState();
}

class _RemarkDialogState extends State<RemarkDialog> {
  late TextEditingController _textController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: widget.remark,
    );
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      width: MediaQuery.of(context).size.width * 2 / 3,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                "비고 입력",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.only(
                top: LayoutConstant.paddingL,
                left: LayoutConstant.paddingL,
                right: LayoutConstant.paddingL,
              ),
              child: TextField(
                controller: _textController,
                focusNode: _focusNode,
                autofocus: true,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                maxLines: 5,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(LayoutConstant.radiusS),
                    borderSide: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: LayoutConstant.spaceXS,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      LayoutConstant.radiusS,
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: LayoutConstant.spaceXS,
                    ),
                  ),
                ),
                onEditingComplete: () {
                  Navigator.of(context).pop(_textController.text);
                },
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceL),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(LayoutConstant.paddingL),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(_textController.text);
                  },
                  child: const Text("완료"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CheckAlterResultDialog extends ConsumerWidget {
  const CheckAlterResultDialog({Key? key}) : super(key: key);

  static final _items = [
    "●",
    "▲",
    "X",
  ];

  void _onTap(BuildContext context, String name) {
    Navigator.of(context).pop(name);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              "점검 결과",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: LayoutConstant.paddingS,
                vertical: LayoutConstant.paddingL),
            child: Row(
              children: _items
                  .map((item) => Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => _onTap(context, item),
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 22,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM),
        ],
      ),
    );
  }
}
