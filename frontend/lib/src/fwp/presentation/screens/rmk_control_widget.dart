import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/workorder/application/work_order/load/work_order_event.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/work_order_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RMKControlWidget extends ConsumerStatefulWidget {
  const RMKControlWidget({
    Key? key,
    required this.code,
    required this.wonb,
    required this.planSeq,
  }) : super(key: key);

  final String code;
  final String wonb;
  final String planSeq;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RMKControlWidgetState(code, wonb, planSeq);
}

class _RMKControlWidgetState extends ConsumerState<RMKControlWidget> {
  final TextEditingController textController = TextEditingController();
  final String code;
  final String wonb;
  final String planSeq;

  _RMKControlWidgetState(this.code, this.wonb, this.planSeq);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SizedBox(height: LayoutConstant.spaceM),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "리마크 수정",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM * 2),
          Flexible(
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '리마크 수정',
              ),
              maxLength: 300,
              maxLines: 5,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => {
                  _onTap(context, ref, textController.text),
                },
                child: const Text(
                  "수정",
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 77, 165, 247)),
              ),
              const SizedBox(width: LayoutConstant.spaceM * 2),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "닫기",
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 77, 165, 247)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _onTap(
      BuildContext context, WidgetRef ref, String rmkText) async {
    await ref.read(workOrderStateNotifierProvider.notifier).mapEventToState(
          WorkOrderEvent.rmkUpdate(
              ref.watch(workOrderListNotifier).items, planSeq, wonb, rmkText),
        );

    showFlashBar(
      context,
      title: "저장 완료",
      content: "",
      backgroundColor: Theme.of(context).primaryColorLight,
    );
    Navigator.of(context).pop();
  }
}
