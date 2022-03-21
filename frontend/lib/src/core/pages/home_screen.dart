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
                context.push(_mockMenus[index].route);
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
    title: 'Plasma',
    cardColor: Colors.red,
    route: '/plasma',
  ),
  MockMenu(
    title: 'Plange',
    cardColor: Colors.orange,
    route: '/plange',
  ),
  MockMenu(
    title: 'Fan',
    cardColor: Colors.yellow,
    route: '/fan',
  ),
];

class MockMenu {
  final String title;
  final Color cardColor;
  final String route;

  const MockMenu({
    required this.title,
    required this.cardColor,
    required this.route,
  });
}
