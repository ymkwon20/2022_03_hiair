import 'package:flutter/material.dart';
import 'package:frontend/src/auth/application/auth_event.dart';
import 'package:frontend/src/auth/dependency_injection.dart';
import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authChangeNotifierProvider).user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return _buildLogoutPopup(
                      context,
                      name: user!.name,
                      onNoTap: Navigator.of(context).pop,
                      onYesTap: () {
                        Navigator.of(context).pop();
                        ref
                            .read(authStateNotifierProvider.notifier)
                            .mapEventToState(
                              const AuthEvent.signOut(),
                            );
                      },
                    );
                  },
                );
              },
              icon: const Icon(Icons.settings))
        ],
        iconTheme: Theme.of(context).iconTheme,
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

  Widget _buildLogoutPopup(
    BuildContext context, {
    required String name,
    required VoidCallback onYesTap,
    required VoidCallback onNoTap,
  }) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      contentPadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: LayoutConstant.paddingM),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(LayoutConstant.radiusS - 1),
                )),
            alignment: Alignment.center,
            child: const Text(
              "로그 아웃",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const UnderlineWidget(),
          const SizedBox(height: LayoutConstant.spaceM),
          Text.rich(
            TextSpan(
              text: "$name 님\n",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              children: const [
                TextSpan(
                  text: "로그아웃 하시겠습니까?",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: LayoutConstant.spaceM),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: _buildButton(
                  context,
                  name: "No",
                  onTap: onNoTap,
                ),
              ),
              Expanded(
                child: _buildButton(
                  context,
                  name: "Yes",
                  onTap: onYesTap,
                  isPrimary: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    VoidCallback? onTap,
    required String name,
    bool isPrimary = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: LayoutConstant.paddingM,
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: isPrimary
              ? TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                )
              : null,
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
  // MockMenu(
  //   title: 'Alter-Cutting',
  //   cardColor: Colors.indigo,
  //   routeName: 'alter-cut',
  // ),
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
