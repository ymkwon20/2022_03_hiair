import 'package:flutter/material.dart';
import 'package:frontend/src/core/widgets/index.dart';
import 'package:frontend/src/inspection/presentation/fakes/inspect_spec.dart';
import 'package:frontend/src/inspection/presentation/prototypes/inspect_list_widget.dart';
import 'package:frontend/src/inspection/presentation/prototypes/qm_product_details_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/constants/index.dart';
import 'package:frontend/src/inspection/presentation/fakes/fake_data.dart';
import 'package:frontend/src/inspection/presentation/fakes/qm_product.dart';
import 'package:frontend/src/inspection/presentation/prototypes/insepct_mode.dart';
import 'package:intl/intl.dart';

final inspectMode = StateProvider.autoDispose<InspectMode>(
  (ref) => const InspectMode.none(),
);

final inspectSpec = StateProvider.autoDispose<InspectSpec>(
  (ref) => throw UnimplementedError(),
);

final _qmProduct = Provider.autoDispose<QmProduct>(
  (ref) => throw UnimplementedError(),
);

class QmProductDetailsScreen extends ConsumerStatefulWidget {
  const QmProductDetailsScreen({
    Key? key,
    required this.projectNo,
  }) : super(key: key);

  final String projectNo;

  @override
  ConsumerState<QmProductDetailsScreen> createState() =>
      _QmProductDetailsScreenState();
}

class _QmProductDetailsScreenState
    extends ConsumerState<QmProductDetailsScreen> {
  late QmProduct product;

  @override
  void initState() {
    super.initState();
    product = fakeQmProducts
        .where((QmProduct product) => product.projectNo == widget.projectNo)
        .single;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
      ),
      body: ProviderScope(
        overrides: [
          _qmProduct.overrideWithValue(product),
        ],
        child: ResponsiveWidget(
          mobile: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
          ),
          tablet: Container(color: Colors.blue),
          desktop: const QmProductDesktopPage(),
        ),
      ),
    );
  }
}

class QmProductDesktopPage extends StatelessWidget {
  const QmProductDesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            flex: 3,
            child: QmProductDetailsPage(),
          ),
          Container(
            width: LayoutConstant.spaceXS,
            height: double.infinity,
            color: Theme.of(context).dividerColor,
          ),
          const Expanded(
            flex: 4,
            child: QmSelectionModePage(),
          ),
        ],
      ),
    );
  }
}

class QmProductDetailsPage extends ConsumerWidget {
  const QmProductDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(_qmProduct);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LayoutConstant.paddingL,
        vertical: LayoutConstant.paddingS,
      ),
      child: ScrollConfiguration(
        behavior: NoGlowBehavior(),
        child: SingleChildScrollView(
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
              QmProductDetailsWidget(product: product),
              const SizedBox(height: LayoutConstant.spaceM),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Tooltip(
                    message: "Fan Performance",
                    child: IconButton(
                      onPressed: () {
                        ref.read(inspectMode.notifier).state =
                            const InspectMode.performance();
                      },
                      icon: const Icon(InspectIcon.fan),
                    ),
                  ),
                  const SizedBox(width: LayoutConstant.spaceM),
                  Tooltip(
                    message: "Paint Spec.",
                    child: IconButton(
                      onPressed: () {
                        ref.read(inspectMode.notifier).state =
                            const InspectMode.paint();
                      },
                      icon: const Icon(InspectIcon.paint_roller),
                    ),
                  ),
                  const SizedBox(width: LayoutConstant.spaceM),
                  Tooltip(
                    message: "Motor Info",
                    child: IconButton(
                      onPressed: () {
                        ref.read(inspectMode.notifier).state =
                            const InspectMode.motor();
                      },
                      icon: const Icon(InspectIcon.cog_alt),
                    ),
                  ),
                  const SizedBox(width: LayoutConstant.spaceM),
                  Tooltip(
                    message: "Photo",
                    child: IconButton(
                      onPressed: () {
                        ref.read(inspectMode.notifier).state =
                            const InspectMode.photo();
                      },
                      icon: const Icon(InspectIcon.photo_video),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 검사 기준정보 아래 버튼을 클릭했을 때 나오는 화면
///
/// 각 state에 따라 나올 수 있는 화면이 다르기 때문에
/// 이를 declarative하게 사용하기 Freezed Union type을 사용하여
/// enum, control statement을 사용할 때 보다
/// 간결하고 declarative함
class QmSelectionModePage extends ConsumerWidget {
  const QmSelectionModePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(inspectMode);

    return Container(
      child: mode.when(
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
            inspectSpec.overrideWithValue(StateController(fakePerformance)),
          ],
          child: const InspectListWidget(),
        ),
        paint: () => ProviderScope(
          overrides: [
            // TODO: change mock to real
            inspectSpec.overrideWithValue(StateController(fakePaint)),
          ],
          child: const InspectListWidget(),
        ),
        motor: () => Container(color: Colors.blue),
        photo: () => Container(color: Colors.yellow),
      ),
    );
  }
}
