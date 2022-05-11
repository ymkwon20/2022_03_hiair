import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/presentation/widgets/check_combobox.dart';
import 'package:frontend/src/checklist/presentation/widgets/check_textfield.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/checklist/domain/entities/check_type.dart';
import 'package:frontend/src/checklist/presentation/viewmodel/checklist_notifier.dart';
import 'package:frontend/src/core/presentation/index.dart';

class CheckitemWidget extends ConsumerStatefulWidget {
  const CheckitemWidget({
    Key? key,
    required this.focusNodes,
  }) : super(key: key);

  final List<FocusNode> focusNodes;

  @override
  ConsumerState<CheckitemWidget> createState() => _CheckitemWidgetState();
}

class _CheckitemWidgetState extends ConsumerState<CheckitemWidget> {
  static const _fontSize = 22.0;

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        final item = ref.watch(checkItemProvider);
        final index = ref.watch(checkIndexProvider);

        _controller.text = item.checkSheetValue;
        widget.focusNodes[index].addListener(_focusChanged);
      },
    );
  }

  @override
  void deactivate() {
    final index = ref.watch(checkIndexProvider);
    widget.focusNodes[index].removeListener(_focusChanged);
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _focusChanged() {
    final index = ref.watch(checkIndexProvider);
    final item = ref.watch(checkItemProvider);
    if (!widget.focusNodes[index].hasFocus) {
      ref.read(checklistNotifierProvider.notifier).editCheckItem(
            index,
            item.copyWith(checkSheetValue: _controller.text),
          );
    }
  }

  void _focusToNextValid(int index) {
    final items = ref.watch(checklistNotifierProvider).items;
    if (items.length == index + 1) return;

    for (var i = index + 1; i < items.length; i++) {
      if (isFocusable(items[i].checkType)) {
        widget.focusNodes[i].requestFocus();
        break;
      }
    }
  }

  bool isFocusable(CheckType checkType) {
    switch (checkType) {
      case CheckType.number:
        return true;
      case CheckType.string:
        return true;
      case CheckType.checkbox:
        return true;
      case CheckType.date:
        return true;
      case CheckType.combo:
        return true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(checkIndexProvider);
    final item = ref.watch(checkItemProvider);

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: LayoutConstant.paddingL,
        vertical: LayoutConstant.paddingM,
      ),
      padding: const EdgeInsets.all(LayoutConstant.paddingM),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: LayoutConstant.spaceXS,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "${index + 1}. ${item.checkSheetName}",
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: LayoutConstant.spaceS),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: LayoutConstant.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '기준값',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: LayoutConstant.spaceS),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: LayoutConstant.paddingS,
                  ),
                  decoration: item.standard != ""
                      ? BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(LayoutConstant.radiusS),
                          border: Border.all(
                            width: LayoutConstant.spaceXS,
                            color: Theme.of(context).dividerColor,
                          ),
                        )
                      : null,
                  child: Text(
                    item.standard,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: LayoutConstant.spaceM),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '실제값',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: _buildCheckPart(index, item),
                          ),
                        ),
                        if (item.unit != "")
                          Expanded(
                            flex: 1,
                            child: _buildUnitPart(item),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckPart(int index, CheckItem item) {
    switch (item.checkType) {
      case CheckType.number:
        return CheckTextfield(
          controller: _controller,
          type: TextInputType.number,
          focusNode: widget.focusNodes[index],
          fontSize: _fontSize,
          onComplete: () => _focusToNextValid(index),
        );
      case CheckType.string:
        return CheckTextfield(
          controller: _controller,
          type: TextInputType.text,
          focusNode: widget.focusNodes[index],
          fontSize: _fontSize,
          onComplete: () => _focusToNextValid(index),
        );
      case CheckType.date:
        return CheckTextfield(
          controller: _controller,
          type: TextInputType.datetime,
          focusNode: widget.focusNodes[index],
          fontSize: _fontSize,
          onComplete: () => _focusToNextValid(index),
        );
      case CheckType.checkbox:
        return Focus(
          focusNode: widget.focusNodes[index],
          child: Checkbox(
            value: item.checkSheetValue != "",
            onChanged: (value) {
              ref.read(checklistNotifierProvider.notifier).editCheckItem(
                    index,
                    item.copyWith(
                      checkSheetValue: value! ? "1" : "",
                    ),
                  );
            },
          ),
        );
      case CheckType.image:
        return Focus(
          focusNode: widget.focusNodes[index],
          child: ProviderScope(
            overrides: [
              checkIndexProvider.overrideWithValue(index),
              checkItemProvider.overrideWithValue(item),
            ],
            // child: const CheckImagebox(),
            child: const Text("image example"),
          ),
        );
      case CheckType.combo:
        return ProviderScope(
          overrides: [
            checkIndexProvider.overrideWithValue(index),
            checkItemProvider.overrideWithValue(item),
          ],
          child: Focus(
            focusNode: widget.focusNodes[index],
            child: const CheckComboBox(),
          ),
        );

      case CheckType.file:
        return const Text("file");
      case CheckType.readonly:
        return const Text("");
    }
  }

  Widget _buildUnitPart(CheckItem item) {
    switch (item.checkType) {
      case CheckType.number:
        return Text(
          item.unit,
          style: const TextStyle(fontSize: _fontSize),
        );
      case CheckType.combo:
        return GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: LayoutConstant.paddingS,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(LayoutConstant.radiusS),
              border: Border.all(
                width: LayoutConstant.spaceXS,
                color: item.combos.isNotEmpty
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).dividerColor,
              ),
            ),
            // todo: add logic for units
            child: const Text(
              "SELECT",
              style: TextStyle(
                fontSize: _fontSize,
              ),
            ),
          ),
        );

      default:
        return const Text(
          "",
          style: TextStyle(
            fontSize: 22,
          ),
        );
    }
  }
}

class _BottomModal extends StatefulWidget {
  const _BottomModal({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CheckItem item;

  @override
  State<_BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<_BottomModal> {
  int _currentIndex = 0;

  bool hasSameIndex(int index) => _currentIndex == index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            LayoutConstant.radiusL,
          ),
          topRight: Radius.circular(
            LayoutConstant.radiusL,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: LayoutConstant.paddingM),
            child: Text(
              widget.item.checkSheetName,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Container(
            width: double.infinity,
            height: LayoutConstant.spaceXS,
            color: Theme.of(context).dividerColor,
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).selectedRowColor,
                    ),
                  ),
                ),
                SizedBox.expand(
                  child: ListWheelScrollView.useDelegate(
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: widget.item.combos.length,
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            widget.item.combos[index].name,
                            style: TextStyle(
                              fontWeight: hasSameIndex(index)
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: hasSameIndex(index) ? 25 : 20,
                              color: hasSameIndex(index)
                                  ? Theme.of(context).colorScheme.secondary
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              LayoutConstant.paddingL,
            ),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    /// Caution: GoRoute의 pop을 이용하면
                    ///           페이지까지 같이 이동 되버리기
                    ///           때문에 주의
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(LayoutConstant.paddingS),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).unselectedWidgetColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: LayoutConstant.spaceM),
                TextButton(
                  onPressed: () {
                    /// Caution: GoRoute의 pop을 이용하면
                    ///           페이지까지 같이 이동 되버리기
                    ///           때문에 주의
                    Navigator.of(context)
                        .pop(widget.item.combos[_currentIndex]);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(LayoutConstant.paddingS),
                    child: Text(
                      'Select',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
