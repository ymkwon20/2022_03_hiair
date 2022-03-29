import 'package:flutter/material.dart';
import 'package:frontend/src/inspection/presentation/fakes/inspect_spec.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:frontend/src/core/constants/index.dart';
import 'package:frontend/src/core/constants/layout_constant.dart';
import 'package:frontend/src/core/widgets/index.dart';
import 'package:frontend/src/inspection/presentation/fakes/fake_data.dart';
import 'package:frontend/src/inspection/presentation/fakes/qm_product.dart';
import 'package:frontend/src/inspection/presentation/prototypes/inpsect_screen.dart';
import 'package:frontend/src/inspection/presentation/prototypes/insepct_mode.dart';

class QmProductDetailsScreen2 extends StatefulWidget {
  const QmProductDetailsScreen2({
    Key? key,
    required this.projectNo,
  }) : super(key: key);

  final String projectNo;

  @override
  State<QmProductDetailsScreen2> createState() =>
      _QmProductDetailsScreen2State();
}

class _QmProductDetailsScreen2State extends State<QmProductDetailsScreen2> {
  late QmProduct product;

  InspectMode mode = const InspectMode.none();

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    product = fakeQmProducts
        .where((QmProduct product) => product.projectNo == widget.projectNo)
        .single;

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(LayoutConstant.paddingL),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '날짜: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const SizedBox(height: LayoutConstant.spaceM),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                          width: 2,
                        ),
                        borderRadius:
                            BorderRadius.circular(LayoutConstant.radiusM),
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
                              bottom: LayoutConstant.paddingS,
                            ),
                            child: Text(
                              product.currentProcess,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: LayoutConstant.paddingXL,
                                vertical: LayoutConstant.paddingS,
                              ),
                              child: Text(
                                product.progress,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(height: LayoutConstant.spaceL),
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
                    ),
                    const SizedBox(height: LayoutConstant.spaceM),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              mode = const InspectMode.performance();
                            });
                          },
                          child: const Text(
                            'Fan Performance',
                          ),
                        ),
                        const SizedBox(width: LayoutConstant.spaceM),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              mode = const InspectMode.paint();
                            });
                          },
                          child: const Text(
                            'Paint Spec.',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 2,
            height: double.infinity,
            color: Theme.of(context).dividerColor,
          ),
          Expanded(
            child: QmSelectionModeScreen(mode: mode),
          ),
        ],
      ),
    );
  }
}

final inspectSpec = Provider<InspectSpec>(
  (ref) => throw UnimplementedError(),
);

/// 검사 기준정보 아래 버튼을 클릭했을 때 나오는 화면
///
/// 각 state에 따라 나올 수 있는 화면이 다르기 때문에
/// 이를 declarative하게 사용하기 Freezed Union type을 사용하여
/// enum, control statement을 사용할 때 보다
/// 간결하고 declarative함
class QmSelectionModeScreen extends StatefulWidget {
  const QmSelectionModeScreen({
    Key? key,
    required this.mode,
  }) : super(key: key);

  final InspectMode mode;

  @override
  State<QmSelectionModeScreen> createState() => _QmSelectionModeScreenState();
}

class _QmSelectionModeScreenState extends State<QmSelectionModeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(LayoutConstant.paddingL),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 2,
        ),
      ),
      child: widget.mode.when(
        none: () => const Center(
          child: Text(
            'No Selection',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        performance: () => ProviderScope(
          overrides: [
            // TODO: change mock data to real
            inspectSpec.overrideWithValue(fakePerformance),
          ],
          child: const InspectScreen(),
        ),
        paint: () => ProviderScope(
          overrides: [
            // TODO: change mock to real
            inspectSpec.overrideWithValue(fakePaint),
          ],
          child: const InspectScreen(),
        ),
        motor: () => Container(color: Colors.blue),
        photo: () => Container(color: Colors.yellow),
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
        vertical: LayoutConstant.paddingS,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: LayoutConstant.spaceL),
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
