import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/application/load/checklist_state.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/checklist/presentation/viewmodels/checklist_notifier.dart';
import 'package:frontend/src/checklist/presentation/widgets/checkitem_widget.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:frontend/src/core/presentation/widgets/no_glow_behavior.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChecklistPage extends StatelessWidget {
  const ChecklistPage({
    Key? key,
    required this.widthController,
  }) : super(key: key);

  final AnimationController widthController;
  static final _widthCurve = CurveTween(curve: Curves.ease);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widthController,
      builder: (context, child) {
        return SizedBox(
          width: _widthCurve.animate(widthController).value *
              MediaQuery.of(context).size.width /
              2.5,
          child: Row(
            children: [
              widthController.value == 1.0
                  ? Container(
                      color: Theme.of(context).dividerColor,
                      width: LayoutConstant.spaceXS,
                      height: double.infinity,
                    )
                  : const SizedBox(),
              const Expanded(
                child: ChecklistWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}

final currentCheckItem = Provider<CheckItem>(
  (ref) => throw UnimplementedError(),
);

final currentCheckItemIndex = Provider<int>(
  (ref) => throw UnimplementedError(),
);

class ChecklistWidget extends ConsumerStatefulWidget {
  const ChecklistWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChecklistWidgetState();
}

class _ChecklistWidgetState extends ConsumerState<ChecklistWidget> {
  final List<FocusNode> itemsFocus = [];
  final List<TextEditingController> textControllers = [];

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _disposeControllers();
    super.dispose();
  }

  void _addCheckItemControllers(int length) {
    for (var i = 0; i < length; i++) {
      itemsFocus.add(FocusNode(debugLabel: "checkitem$i"));
      textControllers.add(TextEditingController());
    }
  }

  void _disposeControllers() {
    itemsFocus.map((e) => e.dispose());
    textControllers.map((e) => e.dispose());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ChecklistState>(checklistStateNotifierProvider,
        (previous, current) {
      current.maybeWhen(
        loaded: (checklist) {
          ref.read(checklistNotifierProvider.notifier).setChecklist(checklist);
          _addCheckItemControllers(checklist.length);
        },
        failure: (message) {},
        orElse: () {},
      );
    });

    final state = ref.watch(checklistStateNotifierProvider);

    return state.maybeWhen(
      initial: () => const SizedBox(),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (_) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: LayoutConstant.spaceM,
                horizontal: LayoutConstant.spaceL,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "체크리스트",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: NoGlowBehavior(),
                child: ListView.builder(
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return ProviderScope(
                      overrides: [
                        currentCheckItem.overrideWithValue(
                            ref.watch(checklistNotifierProvider).items[index]),
                        currentCheckItemIndex.overrideWithValue(index),
                      ],
                      child: CheckitemWidget(
                        focusNodes: itemsFocus,
                        textControllers: textControllers,
                        scrollController: _scrollController,
                      ),
                    );
                  },
                  itemCount: ref.watch(checklistNotifierProvider).items.length,
                ),
              ),
            ),
          ],
        ),
      ),
      failure: (message) => Center(child: Text(message)),
      orElse: () => const SizedBox(),
    );
  }
}
