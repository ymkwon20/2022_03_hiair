import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/home_index_notifier.dart';
import 'package:frontend/src/core/presentation/pages/home_side_bar.dart';
import 'package:frontend/src/cutting/presentation/serial/cutting_serials_screen.dart';
import 'package:frontend/src/fct/presentation/fct_serial_screen.dart';
import 'package:frontend/src/workorder/presentation/prototypes/qm_product_details_screen.dart';
import 'package:frontend/src/workorder/presentation/screens/work_order_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeAlterScreen extends ConsumerStatefulWidget {
  const HomeAlterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeAlterScreen> createState() => _HomeAlterScreenState();
}

class _HomeAlterScreenState extends ConsumerState<HomeAlterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static final _opacitySideBarTween =
      CurveTween(curve: const Interval(0.3, 0.7, curve: Curves.ease));

  static final _opacityHomeTween =
      CurveTween(curve: const Interval(0.6, 1, curve: Curves.ease));

  static final _slideSideBarTween = Tween<Offset>(
    begin: const Offset(0, 1),
    end: const Offset(0, 0),
  ).chain(CurveTween(curve: const Interval(0, 0.8, curve: Curves.ease)));

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

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(
          milliseconds: _transitionMilliseconds,
        ),
        () => _controller.forward(),
      );
    });
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
                    child: const HomeAlterWidget(),
                  ),
                ),
                SlideTransition(
                  position: _slideSideBarTween.animate(_controller),
                  child: FadeTransition(
                    opacity: _opacitySideBarTween.animate(_controller),
                    child: HomeSideBar(
                      fadeController: _controller,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class HomeAlterWidget extends ConsumerWidget {
  const HomeAlterWidget({Key? key}) : super(key: key);

  static const _homeWidgetList = [
    WorkOrderScreen(),
    CuttingSerialsScreen(),
    QmProductDetailsScreen(),
    FctSerialScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const SizedBox(
          width: LayoutConstant.overhangWidth,
        ),
        Expanded(
          child: _homeWidgetList[ref.watch(homeIndexNotifier).currentIndex],
        ),
      ],
    );
  }
}
