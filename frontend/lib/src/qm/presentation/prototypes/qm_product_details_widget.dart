import 'package:flutter/material.dart';

import 'package:frontend/src/core/constants/index.dart';
import 'package:frontend/src/core/widgets/index.dart';
import 'package:frontend/src/qm/presentation/fakes/qm_product.dart';

class QmProductDetailsWidget extends StatelessWidget {
  const QmProductDetailsWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final QmProduct product;

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.only(
              left: LayoutConstant.paddingXL,
              right: LayoutConstant.paddingXL,
              top: LayoutConstant.paddingL,
            ),
            child: Text(
              product.currentProcess,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headline4?.color,
                  ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutConstant.paddingXL,
              ),
              child: Text(
                product.progress,
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM),
          const UnderlineWidget(),
          _ItemRow(title: "Yard", value: product.yard),
          const UnderlineWidget(),
          _ItemRow(title: "Hull No.", value: product.hullNo),
          const UnderlineWidget(),
          _ItemRow(title: "Sys No.", value: product.sysNo),
          const UnderlineWidget(),
          _ItemRow(title: "Work Order", value: product.orderNo),
          const UnderlineWidget(),
          _ItemRow(title: "규격", value: product.standard),
          const UnderlineWidget(),
          _ItemRow(title: "Type", value: product.type),
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
