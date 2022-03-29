import 'package:flutter/material.dart';
import 'package:frontend/src/inspection/presentation/prototypes/inspect_list.dart';
import 'package:frontend/src/inspection/presentation/prototypes/qm_product_details_screen2.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InspectScreen extends ConsumerStatefulWidget {
  const InspectScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<InspectScreen> createState() => _InspectScreenState();
}

class _InspectScreenState extends ConsumerState<InspectScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _inspectSpec = ref.watch(inspectSpec);

    return CustomScrollView(
      key: ValueKey(_inspectSpec.name),
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          snap: true,
          floating: true,
          leading: const SizedBox(),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            _inspectSpec.name,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
          ),
        ),
        const InspectList(),
      ],
    );
  }
}
