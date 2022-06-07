import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/presentation/widgets/checklist_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/checklist/domain/entities/check_type.dart';
import 'package:frontend/src/checklist/presentation/viewmodel/checklist_notifier.dart';
import 'package:frontend/src/core/presentation/index.dart';

import 'check_combobox.dart';
import 'check_imagebox.dart';
import 'check_textfield.dart';

class CheckitemWidget extends ConsumerStatefulWidget {
  const CheckitemWidget({
    Key? key,
    required this.focusNodes,
    required this.textControllers,
    required this.scrollController,
  }) : super(key: key);

  final List<FocusNode> focusNodes;
  final List<TextEditingController> textControllers;
  final ScrollController scrollController;

  @override
  ConsumerState<CheckitemWidget> createState() => _CheckitemWidgetState();
}

class _CheckitemWidgetState extends ConsumerState<CheckitemWidget> {
  static const _fontSize = 22.0;

  int get index => ref.watch(currentCheckItemIndex);
  CheckItem get item => ref.watch(currentCheckItem);

  TextEditingController get controller => widget.textControllers[index];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        controller.text = item.checkSheetValue;
        widget.focusNodes[index].addListener(_focusChanged);
      },
    );
  }

  @override
  void deactivate() {
    widget.focusNodes[index].removeListener(_focusChanged);
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _focusChanged() {
    if (!widget.focusNodes[index].hasFocus && isTextType) {
      ref.read(checklistNotifierProvider.notifier).editCheckItem(
            index,
            item.copyWith(checkSheetValue: controller.text),
          );
    }
  }

  void _focusToNextValid(int index) {
    final items = ref.watch(checklistNotifierProvider).items;

    if (index < items.length - 1) {
      widget.scrollController.jumpTo((index + 1) * 250);
    }

    _setSpecificValue();

    if (items.length == index + 1) return;

    for (var i = index + 1; i < items.length; i++) {
      if (isFocusable(items[i].checkType)) {
        widget.focusNodes[i].requestFocus();
        break;
      }
    }
  }

  bool get isTextType {
    return item.checkType == CheckType.string ||
        item.checkType == CheckType.date ||
        item.checkType == CheckType.number;
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

  /// PM 요구사항
  ///
  /// 메뉴얼로 특정값이 채워지면 특정 값을 집어넣으라 함
  /// 유지보수성이 매우 떨어짐
  /// 변경하고 싶으면 PM에게 문의
  /// "8.HI-AIR자료/QM팀/검사report data_검토R1의 복사본.xlsx" 참고
  void _setSpecificValue() {
    final items = ref.watch(checklistNotifierProvider).items;
    if (items[index].checkSheetName == "Test Duct Φ") {
      final velocity =
          double.tryParse(widget.textControllers[index - 1].text) ?? 0;

      final duct =
          (math.pow(double.tryParse(controller.text) ?? 0, 2) * math.pi / 4);

      /// Test Duct A
      widget.textControllers[index + 1].text = duct.toStringAsFixed(2);
      ref.read(checklistNotifierProvider.notifier).editCheckItem(
            index + 1,
            items[index + 1].copyWith(checkSheetValue: duct.toStringAsFixed(2)),
          );

      /// Air Volume
      final volume1 = duct * velocity * 60;
      widget.textControllers[index + 2].text = volume1.toStringAsFixed(2);
      ref.read(checklistNotifierProvider.notifier).editCheckItem(
            index + 2,
            items[index + 2]
                .copyWith(checkSheetValue: volume1.toStringAsFixed(2)),
          );

      final volume2 = volume1 * 60;
      widget.textControllers[index + 3].text = volume2.toStringAsFixed(2);
      ref.read(checklistNotifierProvider.notifier).editCheckItem(
            index + 3,
            items[index + 3]
                .copyWith(checkSheetValue: volume2.toStringAsFixed(2)),
          );

      final volume3 = volume2 * 60;
      widget.textControllers[index + 4].text = volume3.toStringAsFixed(2);
      ref.read(checklistNotifierProvider.notifier).editCheckItem(
            index + 4,
            items[index + 4]
                .copyWith(checkSheetValue: volume3.toStringAsFixed(2)),
          );
    }

    if (items[index].checkSheetName == "Current 1") {
      final value1 = double.tryParse(controller.text) ?? 0;
      final value2 =
          double.tryParse(widget.textControllers[index + 1].text) ?? 0;
      final value3 =
          double.tryParse(widget.textControllers[index + 2].text) ?? 0;

      final value = ((value1 + value2 + value3) / 3).toStringAsFixed(2);
      widget.textControllers[index + 3].text = value;
      ref.read(checklistNotifierProvider.notifier).editCheckItem(
            index + 3,
            items[index + 3].copyWith(checkSheetValue: value),
          );
    }

    if (items[index].checkSheetName == "Current 2") {
      final value1 =
          double.tryParse(widget.textControllers[index - 1].text) ?? 0;
      final value2 = double.tryParse(widget.textControllers[index].text) ?? 0;
      final value3 =
          double.tryParse(widget.textControllers[index + 1].text) ?? 0;

      final value = ((value1 + value2 + value3) / 3).toStringAsFixed(2);
      widget.textControllers[index + 2].text = value;
      ref.read(checklistNotifierProvider.notifier).editCheckItem(
            index + 2,
            items[index + 2].copyWith(checkSheetValue: value),
          );
    }

    if (items[index].checkSheetName == "Current 3") {
      final value1 =
          double.tryParse(widget.textControllers[index - 2].text) ?? 0;
      final value2 =
          double.tryParse(widget.textControllers[index - 1].text) ?? 0;
      final value3 = double.tryParse(widget.textControllers[index].text) ?? 0;

      final value = ((value1 + value2 + value3) / 3).toStringAsFixed(2);
      widget.textControllers[index + 1].text = value;
      ref.read(checklistNotifierProvider.notifier).editCheckItem(
            index + 1,
            items[index + 1].copyWith(checkSheetValue: value),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  width: double.infinity,
                  height: LayoutConstant.spaceXL * 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: LayoutConstant.paddingS,
                        ),
                        decoration: item.standard != ""
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    LayoutConstant.radiusS),
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
                    ],
                  ),
                ),
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
                    SizedBox(
                      width: double.infinity,
                      height: LayoutConstant.spaceXL * 2,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: _buildCheckPart(index, item),
                            ),
                          ),
                          const SizedBox(width: LayoutConstant.spaceM),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: _buildUnitPart(item),
                            ),
                          ),
                        ],
                      ),
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
          controller: controller,
          type: TextInputType.number,
          focusNode: widget.focusNodes[index],
          fontSize: _fontSize,
          onComplete: () => _focusToNextValid(index),
        );
      case CheckType.string:
        return CheckTextfield(
          controller: controller,
          type: TextInputType.text,
          focusNode: widget.focusNodes[index],
          fontSize: _fontSize,
          onComplete: () => _focusToNextValid(index),
        );
      case CheckType.date:
        return CheckTextfield(
          controller: controller,
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
          child: CheckImagebox(
            index: index,
            item: item,
          ),
        );
      case CheckType.combo:
        return Focus(
          focusNode: widget.focusNodes[index],
          child: CheckComboBox(
            item: item,
            index: index,
            isUnitType: false,
          ),
        );

      case CheckType.file:
        return const Text("file");
      case CheckType.readonly:
        return const Text("");
    }
  }

  Widget _buildUnitPart(CheckItem item) {
    switch (item.unitType) {
      case UnitType.string:
        return Text(
          item.unit,
          style: const TextStyle(fontSize: _fontSize),
        );
      case UnitType.combo:
        return Focus(
          focusNode: widget.focusNodes[index],
          child: CheckComboBox(
            item: item,
            index: index,
            isUnitType: true,
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
                      childCount: widget.item.valueCombos.length,
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            widget.item.valueCombos[index].name,
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
                        .pop(widget.item.valueCombos[_currentIndex]);
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