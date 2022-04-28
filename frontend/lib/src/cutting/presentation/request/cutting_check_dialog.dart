import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/layout_constant.dart';
import 'package:frontend/src/core/widgets/underline_widget.dart';
import 'package:frontend/src/cutting/presentation/request/cutting_check_list_widget.dart';
import 'package:frontend/src/cutting/presentation/request/view_models/cutting_checks_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CuttingCheckDialog extends ConsumerWidget {
  const CuttingCheckDialog({
    Key? key,
  }) : super(key: key);

  Widget _buildRow({
    required String title,
    required String standard,
    Widget? value,
    TextInputType? inputType,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(title),
        ),
        Expanded(
          child: Text(
            standard,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: value ??
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: inputType,
                ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final check = ref.watch(cuttingCheck);

    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        width: 800,
        height: 500,
        padding: const EdgeInsets.all(LayoutConstant.paddingL),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
          color: Theme.of(context).cardColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildRow(
                title: "",
                standard: "기준정보",
                value: const Text("Check"),
              ),
              UnderlineWidget(color: Theme.of(context).shadowColor),
              _buildRow(
                  title: "두께",
                  standard: "${check.thickness}",
                  inputType: TextInputType.number),
              _buildRow(
                  title: "가로",
                  standard: "${check.width}",
                  inputType: TextInputType.number),
              _buildRow(
                  title: "세로",
                  standard: "${check.height}",
                  inputType: TextInputType.number),
              _buildRow(title: "장비명", standard: "없음"),
              _buildRow(title: "원재료 LOT", standard: "없음"),
              _buildRow(title: "비고", standard: ""),
              _buildRow(title: "작업자", standard: ""),
              ElevatedButton(
                onPressed: () {
                  ref.read(cuttingChecksProvider.notifier).edit(check);
                  Navigator.of(context).pop();
                },
                child: const Text("확인"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
