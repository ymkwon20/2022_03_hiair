import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                context.push('/settings');
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: SizedBox.expand(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.pushNamed(_mockMenus[index].routeName);
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: _mockMenus[index].cardColor,
                ),
                alignment: Alignment.center,
                child: Text(
                  _mockMenus[index].title,
                ),
              ),
            );
          },
          itemCount: _mockMenus.length,
        ),
      ),
    );
  }
}

const _mockMenus = <MockMenu>[
  MockMenu(
    title: 'QM',
    cardColor: Colors.red,
    routeName: 'qm1',
  ),
  MockMenu(
    title: 'Cutting',
    cardColor: Colors.blue,
    routeName: 'cut',
  ),
];

class MockMenu {
  final String title;
  final Color cardColor;
  final String routeName;

  const MockMenu({
    required this.title,
    required this.cardColor,
    required this.routeName,
  });
}
