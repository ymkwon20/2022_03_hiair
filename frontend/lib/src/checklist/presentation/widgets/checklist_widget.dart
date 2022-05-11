import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/application/load/checklist_state.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/presentation/viewmodel/checklist_notifier.dart';
import 'package:frontend/src/checklist/presentation/widgets/checkitem_widget.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:frontend/src/core/presentation/widgets/no_glow_behavior.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChecklistWidget extends ConsumerStatefulWidget {
  const ChecklistWidget({
    Key? key,
    required this.widthController,
  }) : super(key: key);

  final AnimationController widthController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChecklistWidgetState();
}

class _ChecklistWidgetState extends ConsumerState<ChecklistWidget> {
  static final _widthCurve = CurveTween(curve: Curves.ease);

  late ScrollController _scrollController;

  final List<FocusNode> itemsFocus = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _disposeCheckItemFocus();
    super.dispose();
  }

  void _addCheckItemFocus(int length) {
    for (var i = 0; i < length; i++) {
      itemsFocus.add(FocusNode(debugLabel: "checkitem$i"));
    }
  }

  void _disposeCheckItemFocus() {
    for (final focusNode in itemsFocus) {
      focusNode.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ChecklistState>(checklistStateNotifierProvider,
        (previous, current) {
      current.maybeWhen(
        loaded: (checklist) {
          ref.read(checklistNotifierProvider.notifier).setChecklist(checklist);
          _addCheckItemFocus(checklist.length);
        },
        failure: (message) {},
        orElse: () {},
      );
    });

    final state = ref.watch(checklistStateNotifierProvider);

    return AnimatedBuilder(
      animation: widget.widthController,
      builder: (context, child) {
        return Container(
          width: _widthCurve.animate(widget.widthController).value *
              5 *
              MediaQuery.of(context).size.width /
              11,
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: Row(
            children: [
              Container(
                color: Theme.of(context).dividerColor,
                width: LayoutConstant.spaceXS,
                height: double.infinity,
              ),
              Expanded(
                child: Center(
                  child: state.when(
                    initial: () => const SizedBox(),
                    loading: () => const CircularProgressIndicator(),
                    loaded: (_) => Scaffold(
                      backgroundColor: Theme.of(context).cardColor,
                      body: Column(
                        children: [
                          const SizedBox(height: LayoutConstant.spaceM),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: LayoutConstant.spaceL,
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
                                      checkItemProvider.overrideWithValue(ref
                                          .watch(checklistNotifierProvider)
                                          .items[index]),
                                      checkIndexProvider
                                          .overrideWithValue(index),
                                    ],
                                    child: CheckitemWidget(
                                      focusNodes: itemsFocus,
                                    ),
                                  );
                                },
                                itemCount: ref
                                    .watch(checklistNotifierProvider)
                                    .items
                                    .length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    failure: (message) => Text(message),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
