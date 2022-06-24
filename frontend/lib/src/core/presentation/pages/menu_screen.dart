import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/no_glow_behavior.dart';
import 'package:frontend/src/version/application/version_state.dart';
import 'package:frontend/src/version/infrastructure/dependency_injection.dart';
import 'package:frontend/src/work_base/application/work_base_state.dart';
import 'package:frontend/src/work_base/dependency_injection.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(workBaseChangeNotifierProvider).items;

    ref.listen<WorkBaseState>(
      workBaseStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          loaded: (items) {
            ref
                .read(workBaseChangeNotifierProvider.notifier)
                .setWorkBases(items);
          },
          failure: (message) {
            showFlashBar(
              context,
              title: "조회 오류",
              content: "메뉴 목록을 조회하는데 실패했습니다.\n$message",
              backgroundColor: Theme.of(context).errorColor,
            );
          },
          orElse: () {},
        );
      },
    );

    ref.listen<VersionState>(
      versionStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          outdated: (localVersion, latestVersion) {
            Navigator.of(context).push(
              CustomScaleRoute(
                builder: (context) => VersionDialog(
                  localVersion: localVersion,
                  latestVersion: latestVersion,
                ),
                backgroundColor: Colors.black.withOpacity(.2),
              ),
            );
          },
          orElse: () {},
        );
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: LayoutConstant.paddingM),
              alignment: Alignment.center,
              child: const Text(
                "페이지 선택",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            Row(
              children: [
                _buildCell(name: "순서"),
                _buildCell(name: "작업장", flex: 2),
                _buildCell(name: "공정명", flex: 2),
              ],
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            Container(
              width: double.infinity,
              height: LayoutConstant.spaceXS,
              color: Theme.of(context).dividerColor,
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: NoGlowBehavior(),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container(
                      height: LayoutConstant.spaceXS,
                      color: Theme.of(context).dividerColor,
                    );
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        ref
                            .read(workBaseChangeNotifierProvider.notifier)
                            .setCurrentBase(index);
                        context.go("/");
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: LayoutConstant.paddingM,
                          vertical: LayoutConstant.paddingL,
                        ),
                        child: Row(
                          children: [
                            _buildCell(name: "${index + 1}", fontSize: 20),
                            _buildCell(
                                name: items[index].wcName,
                                flex: 2,
                                fontSize: 20),
                            _buildCell(
                                name: items[index].wbName,
                                flex: 2,
                                fontSize: 20),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: items.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCell({
    int flex = 1,
    required String name,
    double fontSize = 24,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
