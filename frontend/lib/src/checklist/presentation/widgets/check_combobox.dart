import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/domain/entities/combo.dart';
import 'package:frontend/src/checklist/presentation/viewmodel/checklist_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckComboBox extends ConsumerStatefulWidget {
  const CheckComboBox({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckComboBoxState();
}

class _CheckComboBoxState extends ConsumerState<CheckComboBox> {
  Combo? selectedCombo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        final item = ref.watch(checkItemProvider);
        if (item.checkSheetValue != "") {
          setState(() {
            selectedCombo = item.combos
                .firstWhere((combo) => combo.code == item.checkSheetValue);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = ref.watch(checkItemProvider);
    final index = ref.watch(checkIndexProvider);

    return DropdownButton<Combo?>(
      value: selectedCombo,
      elevation: 2,
      underline: const SizedBox(),
      onChanged: (Combo? combo) {
        setState(() {
          selectedCombo = combo;
          ref.read(checklistNotifierProvider.notifier).editCheckItem(
                index,
                item.copyWith(
                  checkSheetValue: combo!.code,
                ),
              );
        });
      },
      items: item.combos.map<DropdownMenuItem<Combo>>(
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
