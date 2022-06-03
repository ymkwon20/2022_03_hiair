import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:frontend/src/workorder/presentation/viewmodel/qm_work_order_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QmDetailsWidget extends ConsumerWidget {
  const QmDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workOrder = ref.watch(qmWorkOrderNotifierProvider).order!;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: LayoutConstant.spaceXS,
        ),
        borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: LayoutConstant.paddingXL,
          //     right: LayoutConstant.paddingXL,
          //     top: LayoutConstant.paddingL,
          //   ),
          //   child: Text(
          //     workOrder.code,
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //     style: Theme.of(context).textTheme.headline4?.copyWith(
          //           fontWeight: FontWeight.bold,
          //           color: Theme.of(context).textTheme.headline4?.color,
          //         ),
          //   ),
          // ),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: LayoutConstant.paddingXL,
          //     ),
          //     child: Text(
          //       workOrder.itemNo,
          //       style: Theme.of(context).textTheme.headline3?.copyWith(
          //             fontWeight: FontWeight.bold,
          //           ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: LayoutConstant.spaceM),
          _ItemRow(title: "작업지시", value: workOrder.code),
          const UnderlineWidget(),
          _ItemRow(title: "PND", value: workOrder.datePlanned),
          const UnderlineWidget(),
          _ItemRow(title: "Yard", value: workOrder.yard),
          const UnderlineWidget(),
          _ItemRow(title: "Hull No.", value: workOrder.hullNo),
          const UnderlineWidget(),
          _ItemRow(title: "구역", value: workOrder.ship),
          const UnderlineWidget(),
          _ItemRow(title: "Sys No.", value: workOrder.sysNo),
          const UnderlineWidget(),
          _ItemRow(title: "품번", value: workOrder.itemNo),
          const UnderlineWidget(),
          _ItemRow(title: "수량", value: "${workOrder.qty}"),
          const SizedBox(height: LayoutConstant.spaceM),
        ],
      ),
    );
  }
}

/// 테이블 형태의 값 세트의 title, value 값을 받아 보여주는 위젯
///
/// 반복되서 사용되기 때문에 가독성을 위해 생성
class _ItemRow extends StatelessWidget {
  const _ItemRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LayoutConstant.paddingXL,
        vertical: LayoutConstant.paddingXS,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: LayoutConstant.spaceM),
              child: Text(
                value,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
