import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:frontend/src/core/pages/home_index_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/auth/application/auth_event.dart';
import 'package:frontend/src/auth/dependency_injection.dart';
import 'package:frontend/src/core/constants/index.dart';
import 'package:frontend/src/core/pages/sign_out_dialog.dart';

class HomeSideBar extends ConsumerStatefulWidget {
  const HomeSideBar({
    Key? key,
    required this.fadeController,
  }) : super(key: key);

  final AnimationController fadeController;

  @override
  ConsumerState<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends ConsumerState<HomeSideBar>
    with SingleTickerProviderStateMixin, RouteAware {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;

  // drawer related field
  static const _fullSize = 270.0;
  static final _widthTween = CurveTween(curve: Curves.easeInOutQuint);

  // dialog related field
  bool _visibleDialog = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _angleAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.5, curve: Curves.easeOutCirc),
      reverseCurve: const Interval(0.5, 1, curve: Curves.easeInCirc),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    if (_controller.value > 0) {
      _closeDrawer();
    } else {
      _openDrawer();
    }
  }

  void _openDrawer() {
    _controller.forward();
  }

  void _closeDrawer() {
    _controller.reverse();
  }

  void _inDialog() {
    setState(() {
      _visibleDialog = true;
    });
  }

  void _outDialog() {
    setState(() {
      _visibleDialog = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildDrawerCloser(),
        _buildDrawer(),
        SignOutDialog(
          visible: _visibleDialog,
          onCancel: _outDialog,
          onYes: () async {
            _outDialog();
            _controller.reverse();
            await widget.fadeController.reverse();
            ref
                .read(authStateNotifierProvider.notifier)
                .mapEventToState(const AuthEvent.signOut());
          },
        ),
      ],
    );
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          child: Container(
            width: LayoutConstant.overhangWidth +
                _fullSize * _widthTween.animate(_controller).value,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(LayoutConstant.radiusM),
              ),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(.4),
                  blurRadius: LayoutConstant.radiusXS,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            margin:
                const EdgeInsets.symmetric(vertical: LayoutConstant.paddingS),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: LayoutConstant.spaceM),
                      DrawerItem(
                        onTap: (index) {
                          _controller.reverse();
                          ref.watch(homeIndexNotifier).moveTo(index);
                        },
                        index: 0,
                        homeIndex: ref.watch(homeIndexNotifier).currentIndex,
                        title: "Inspect",
                        icon: Icons.checklist_rounded,
                        value: _controller.value,
                      ),
                      const SizedBox(height: LayoutConstant.spaceM),
                      DrawerItem(
                        onTap: (index) {
                          _controller.reverse();
                          ref.watch(homeIndexNotifier).moveTo(index);
                        },
                        index: 1,
                        homeIndex: ref.watch(homeIndexNotifier).currentIndex,
                        title: "Cutting",
                        icon: Icons.cut,
                        value: _controller.value,
                      ),
                      const SizedBox(height: LayoutConstant.spaceM),
                      DrawerItem(
                        onTap: (index) {
                          _controller.reverse();
                          ref.watch(homeIndexNotifier).moveTo(index);
                        },
                        index: 2,
                        homeIndex: ref.watch(homeIndexNotifier).currentIndex,
                        title: "Nesting",
                        icon: Icons.checklist_rtl_rounded,
                        value: _controller.value,
                      ),
                      const SizedBox(height: LayoutConstant.spaceM),
                      DrawerItem(
                        onTap: (index) {
                          _controller.reverse();
                          ref.watch(homeIndexNotifier).moveTo(index);
                        },
                        index: 3,
                        homeIndex: ref.watch(homeIndexNotifier).currentIndex,
                        title: "FCT",
                        icon: Icons.change_circle,
                        value: _controller.value,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: _inDialog,
                    child: const SizedBox(
                      width: LayoutConstant.overhangWidth,
                      height: LayoutConstant.overhangWidth,
                      child: Icon(Icons.logout),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Transform.rotate(
                    angle: -math.pi * _angleAnimation.value,
                    child: GestureDetector(
                      onTap: _toggleDrawer,
                      child: const SizedBox(
                        width: LayoutConstant.overhangWidth,
                        height: LayoutConstant.overhangWidth,
                        child: Icon(
                          Icons.chevron_right,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDrawerCloser() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return _controller.value > 0
            ? GestureDetector(
                onTap: _closeDrawer,
                behavior: HitTestBehavior.translucent,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                ),
              )
            : const SizedBox();
      },
    );
  }
}

/// 각 drawer에서 고를 수 있는 아이템들
class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.index,
    required this.homeIndex,
    required this.title,
    required this.icon,
    required this.value,
    this.threshold = 0.8,
    this.onTap,
  }) : super(key: key);

  final int index;
  final int homeIndex;
  final String title;
  final IconData icon;
  final double value;
  final double threshold;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(index),
      child: Row(
        children: [
          const SizedBox(
              width: (LayoutConstant.spaceM + LayoutConstant.spaceL) / 2),
          Container(
            padding: const EdgeInsets.all(LayoutConstant.paddingM),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: homeIndex == index
                  ? Theme.of(context).primaryColorLight
                  : null,
              border: Border.all(
                color: Theme.of(context).primaryColorDark,
                width: LayoutConstant.spaceXS,
              ),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          if (value > threshold) ...[
            const SizedBox(width: LayoutConstant.spaceL),
            AnimatedOpacity(
              opacity: (value - 0.8) / 0.2,
              duration: const Duration(milliseconds: 100),
              curve: Curves.ease,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: homeIndex == index
                      ? Theme.of(context).primaryColorDark
                      : null,
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
