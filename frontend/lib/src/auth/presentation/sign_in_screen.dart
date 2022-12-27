import 'package:flutter/material.dart';
import 'package:frontend/src/auth/application/auth_state.dart';
import 'package:frontend/src/auth/presentation/sign_in_form_widget.dart';
import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/routes/app_route_observer.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/version/application/version_state.dart';
import 'package:frontend/src/version/infrastructure/dependency_injection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/auth/dependency_injection.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> with RouteAware {
  bool _isOn = false;
  Offset _offset = const Offset(-0.3, 0);

  static const _slideFadeMilliseconds = 900;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref
          .read(routeObserverProvider)
          .subscribe(this, ModalRoute.of(context)! as PageRoute);
      _slideRightIn();
    });
  }

  @override
  void deactivate() {
    ref.read(routeObserverProvider).unsubscribe(this);
    super.deactivate();
  }

  @override
  void didPush() {
    _slideRightIn();
  }

  @override
  void didPushNext() {
    // _slideLeftOut();
  }

  void _slideLeftOut() {
    setState(() {
      _isOn = false;
      _offset = const Offset(-0.7, 0);
    });
  }

  void _slideRightIn() {
    setState(() {
      _isOn = true;
      _offset = const Offset(0, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 로그인 성공시 다음 Screen과의 통일성을 위해 애니메이션 적용
    ref.listen<AuthState>(authStateNotifierProvider, (previous, current) {
      current.maybeWhen(
        authenticated: (_) {
          _slideLeftOut();
        },
        failure: (message) {
          showFlashBar(
            context,
            title: "조회 오류",
            content: "로그인에 실패했습니다. \n$message",
            backgroundColor: Theme.of(context).errorColor,
          );
        },
        orElse: () {},
      );
    });

    // ref.listen<VersionState>(
    //   versionStateNotifierProvider,
    //   (previous, current) {
    //     current.maybeWhen(
    //       outdated: (localVersion, latestVersion) {
    //         Navigator.of(context).push(
    //           CustomScaleRoute(
    //             builder: (context) => VersionDialog(
    //               localVersion: localVersion,
    //               latestVersion: latestVersion,
    //             ),
    //             backgroundColor: Colors.black.withOpacity(.2),
    //           ),
    //         );
    //       },
    //       orElse: () {},
    //     );
    //   },
    // );

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedSlide(
        offset: _offset,
        duration: const Duration(milliseconds: _slideFadeMilliseconds),
        curve: Curves.easeOutSine,
        child: AnimatedOpacity(
          opacity: _isOn || ref.watch(authChangeNotifierProvider).user == null
              ? 1.0
              : 0.0,
          duration: const Duration(milliseconds: _slideFadeMilliseconds),
          curve: Curves.easeOutCubic,
          child: Stack(
            children: [
              Positioned(
                top: size.height / 10,
                left: size.width / 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Hiair Fan',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).iconTheme.color,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: LayoutConstant.paddingS),
                      child: Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ),
              const SignInFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
