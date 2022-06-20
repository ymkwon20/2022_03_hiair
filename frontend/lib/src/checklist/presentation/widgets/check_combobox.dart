import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/checklist/domain/entities/combo.dart';
import 'package:frontend/src/checklist/presentation/viewmodels/checklist_notifier.dart';

class CheckComboBox extends ConsumerStatefulWidget {
  const CheckComboBox({
    Key? key,
    required this.index,
    required this.item,
    required this.isUnitType,
  }) : super(key: key);

  final int index;
  final CheckItem item;
  final bool isUnitType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckComboBoxState();
}

class _CheckComboBoxState extends ConsumerState<CheckComboBox> {
  Combo? selectedCombo;

  bool get isUnitType => widget.isUnitType;
  int get index => widget.index;
  CheckItem get item => widget.item;

  List<Combo> get combos => isUnitType ? item.unitCombos : item.valueCombos;

  bool get hasValue =>
      isUnitType ? item.unit != "" : item.checkSheetValue != "";

  String get value => isUnitType ? item.unit : item.checkSheetValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        _setInitialValue();
      },
    );
  }

  void _setInitialValue() {
    if (hasValue) {
      setState(() {
        selectedCombo = combos.firstWhere((combo) => combo.code == value);
      });
    }
  }

  void _setSelectedValue(Combo? combo) {
    setState(() {
      selectedCombo = combo;

      if (isUnitType) {
        ref.read(checklistNotifierProvider.notifier).editCheckItem(
              index,
              item.copyWith(
                unit: combo!.code,
              ),
            );
      } else {
        ref.read(checklistNotifierProvider.notifier).editCheckItem(
              index,
              item.copyWith(
                checkSheetValue: combo!.code,
              ),
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Combo?>(
      value: selectedCombo,
      elevation: 2,
      underline: const SizedBox(),
      onChanged: _setSelectedValue,
      items: combos.map<DropdownMenuItem<Combo>>(
        ((combo) {
          return DropdownMenuItem<Combo>(
            value: combo,
            child: Text(
              combo.name,
              style: const TextStyle(fontSize: 22),
            ),
          );
        }),
      ).toList(),
    );
  }
}
