import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/home_app_bar.dart';
import 'package:frontend/src/core/presentation/widgets/no_glow_behavior.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkbaseMenuScreen extends ConsumerWidget {
  const WorkbaseMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(workBaseChangeNotifierProvider).items;

    return Scaffold(
      appBar: const HomeAppBar(title: "공정 관리"),
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
                        context.pop();
                        context.push("/work-order");
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
