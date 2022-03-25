import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/layout_constant.dart';
import 'package:frontend/src/inspection/presentation/prototypes/inspect_list.dart';

class InspectScreen extends StatefulWidget {
  const InspectScreen({Key? key}) : super(key: key);

  @override
  State<InspectScreen> createState() => _InspectScreenState();
}

class _InspectScreenState extends State<InspectScreen> {
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
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          snap: true,
          floating: true,
          leading: const SizedBox(),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Fan Performance',
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

  Padding backup(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LayoutConstant.paddingL,
        vertical: LayoutConstant.paddingS,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: LayoutConstant.spaceXL),
          Text(
            'Fan Performance',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
          ),
          const SizedBox(height: LayoutConstant.spaceL),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(.6),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(
                LayoutConstant.radiusM,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(LayoutConstant.paddingL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Air Volume',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: LayoutConstant.spaceS),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_a_photo_outlined),
                          ),
                          const Expanded(child: SizedBox()),
                          Column(
                            children: const [
                              Text(
                                'Spec.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text('600P'),
                            ],
                          ),
                          const SizedBox(width: LayoutConstant.spaceM),
                          Column(
                            children: const [
                              Text(
                                'Actual.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(''),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
