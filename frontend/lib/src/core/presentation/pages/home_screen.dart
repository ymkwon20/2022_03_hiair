import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/pages/dialog.dart';
import 'package:frontend/src/core/presentation/pages/menu_item.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeAlterScreenState();
}

class _HomeAlterScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // static final _opacitySideBarTween =
  //     CurveTween(curve: const Interval(0.3, 0.7, curve: Curves.ease));

  static final _opacityHomeTween =
      CurveTween(curve: const Interval(0.6, 1, curve: Curves.ease));

  // static final _slideSideBarTween = Tween<Offset>(
  //   begin: const Offset(0, 1),
  //   end: const Offset(0, 0),
  // ).chain(CurveTween(curve: const Interval(0, 0.8, curve: Curves.ease)));

  static final _slideHomeTween = Tween<Offset>(
    begin: const Offset(0, 1),
    end: const Offset(0, 0),
  ).chain(CurveTween(curve: const Interval(0.2, 1.0, curve: Curves.ease)));

  /// transition 전환에 이어 seamless한 경험을 주기 위해 애니메이션을 발동시키는 타이밍
  static const int _transitionMilliseconds = 600;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        Future.delayed(
          const Duration(
            milliseconds: _transitionMilliseconds,
          ),
          () => _controller.forward(),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              fit: StackFit.expand,
              children: [
                SlideTransition(
                  position: _slideHomeTween.animate(_controller),
                  child: FadeTransition(
                    opacity: _opacityHomeTween.animate(_controller),
                    child: const HomeWidget(),
                  ),
                ),
                // SlideTransition(
                //   position: _slideSideBarTween.animate(_controller),
                //   child: FadeTransition(
                //     opacity: _opacitySideBarTween.animate(_controller),
                //     child: HomeSideBar(
                //       fadeController: _controller,
                //     ),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class HomeWidget extends ConsumerWidget {
  const HomeWidget({Key? key}) : super(key: key);

  void onSelected(BuildContext context, MenuEntity item) {
    switch (item) {
      case MenuItems.itemPages:
        Navigator.of(context).push(
          CustomScaleRoute(
            builder: (context) => const PageListDialog(),
            backgroundColor: Colors.black.withOpacity(.2),
          ),
        );
        break;
      case MenuItems.itemSignOut:
        Navigator.of(context).push(
          CustomScaleRoute(
            builder: (context) => const SignOutDialog(),
            backgroundColor: Colors.black.withOpacity(.2),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: LayoutConstant.paddingM),
          child: Text(
            "${ref.watch(workBaseChangeNotifierProvider).workBase?.wcName ?? ""} | ${ref.watch(workBaseChangeNotifierProvider).workBase?.wbName ?? ""}",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        actions: [
          PopupMenuButton<MenuEntity>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    ...MenuItems.admin
                        .map((item) => buildMenuItem(context, item))
                        .toList(),
                    const PopupMenuDivider(),
                    ...MenuItems.notAdmin
                        .map((item) => buildMenuItem(context, item))
                        .toList(),
                  ]),
        ],
      ),
      body: ref.watch(workBaseChangeNotifierProvider).page,
    );
  }

  PopupMenuItem<MenuEntity> buildMenuItem(
      BuildContext context, MenuEntity item) {
    return PopupMenuItem<MenuEntity>(
      value: item,
      child: Row(
        children: [
          Icon(item.icon, color: Theme.of(context).iconTheme.color),
          const SizedBox(width: LayoutConstant.spaceL),
          Text(item.text),
        ],
      ),
    );
  }
}
