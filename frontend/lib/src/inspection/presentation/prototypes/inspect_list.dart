import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/index.dart';
import 'package:frontend/src/inspection/presentation/fakes/fake_data.dart';

class InspectList extends StatelessWidget {
  const InspectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(LayoutConstant.paddingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      fakeInspectPerformanceItems[index].name,
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
                          children: [
                            const Text(
                              'Spec.',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(fakeInspectPerformanceItems[index].spec),
                          ],
                        ),
                        const SizedBox(width: LayoutConstant.spaceM),
                        Column(
                          children: [
                            const Text(
                              'Actual.',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(fakeInspectPerformanceItems[index]
                                    .inspectValue ??
                                ''),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        childCount: fakeInspectPerformanceItems.length,
      ),
    );
  }
}
