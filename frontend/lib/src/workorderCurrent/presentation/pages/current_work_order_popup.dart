import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/underline_widget.dart';
import 'package:frontend/src/workorderCurrent/domain/entities/current_work_order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentWorkOrderPopup extends ConsumerWidget {
  const CurrentWorkOrderPopup({
    Key? key,
    required this.workOrder,
  }) : super(key: key);

  final CurrentWorkOrder workOrder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width / 2.5;

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  width: width,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(LayoutConstant.radiusL),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(2, -1),
                        blurRadius: LayoutConstant.radiusXS,
                        color: Theme.of(context).shadowColor.withOpacity(.7),
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(LayoutConstant.paddingL),
                    width: width,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: LayoutConstant.spaceM),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "상세내용",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        const SizedBox(height: LayoutConstant.spaceM),
                        _WorkOrderDrawerRow(
                            title: "현공정", value: workOrder.wbNm),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "현공정코드", value: workOrder.wbCd),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "Yard", value: workOrder.yard),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "Hull No", value: workOrder.hullNo),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(title: "구역", value: workOrder.ship),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "Sys No", value: workOrder.sysNo),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "SPEC", value: workOrder.pjtNo),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "PND", value: workOrder.pndDate),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "작업지시번호", value: workOrder.wonb),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "작업장명", value: workOrder.wcNm),
                        const UnderlineWidget(),
                        _WorkOrderDrawerRow(
                            title: "작업장코드", value: workOrder.wcCd),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WorkOrderDrawerRow extends StatelessWidget {
  const _WorkOrderDrawerRow({
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
        horizontal: LayoutConstant.paddingM,
        vertical: LayoutConstant.paddingXS,
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
