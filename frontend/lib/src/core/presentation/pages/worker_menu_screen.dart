import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/pages/menu_item.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/home_app_bar.dart';
import 'package:frontend/src/safety/application/info/safety_info_event.dart';
import 'package:frontend/src/safety/dependency_injection.dart';
import 'package:frontend/src/version/application/version_state.dart';
import 'package:frontend/src/version/infrastructure/dependency_injection.dart';
import 'package:frontend/src/work_base/application/work_base_event.dart';
import 'package:frontend/src/work_base/application/work_base_state.dart';
import 'package:frontend/src/work_base/dependency_injection.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum WorkCode {
  work,
  safety,
  infra,
  qm,
}

class WorkerMenuScreen extends ConsumerStatefulWidget {
  const WorkerMenuScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WorkerMenuScreen> createState() => _WorkerMenuScreenState();
}

class _WorkerMenuScreenState extends ConsumerState<WorkerMenuScreen> {
  bool onceClicked = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => ref
          .read(workBaseStateNotifierProvider.notifier)
          .mapEventToState(const WorkBaseEvent.fetchWorkBases()),
    );
  }

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
  Widget build(BuildContext context) {
    ref.listen<WorkBaseState>(
      workBaseStateNotifierProvider,
      ((previous, current) {
        current.maybeWhen(
          loaded: (items) {
            ref
                .read(workBaseChangeNotifierProvider.notifier)
                .setWorkBases(items);
          },
          failure: (message) {
            showFlashBar(
              context,
              title: "?????? ??????",
              content: "?????? ????????? ??????????????? ??????????????????.\n$message",
              backgroundColor: Theme.of(context).errorColor,
            );
          },
          orElse: () {},
        );
      }),
    );

    ref.listen<VersionState>(
      versionStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          outdated: (localVersion, latestVersion) {
            Navigator.of(context).push(
              CustomScaleRoute(
                builder: (context) => VersionDialog(
                  localVersion: localVersion,
                  latestVersion: latestVersion,
                ),
                backgroundColor: Colors.black.withOpacity(.2),
              ),
            );
          },
          orElse: () {},
        );
      },
    );

    return Scaffold(
      appBar: const HomeAppBar(title: "?????? ??????"),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildMenuButton(
              context,
              ref,
              code: WorkCode.work,
              title: "????????????",
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            buildMenuButton(
              context,
              ref,
              code: WorkCode.infra,
              title: "????????? ??????",
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            buildMenuButton(
              context,
              ref,
              code: WorkCode.safety,
              title: "?????? ??????",
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            buildMenuButton(
              context,
              ref,
              code: WorkCode.qm,
              title: "QM ??????",
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required double width,
    required double height,
    required WorkCode code,
  }) {
    return GestureDetector(
      onTap: () {
        if (!onceClicked) {
          onceClicked = true;

          switch (code) {
            case WorkCode.work:
              context.push("/workbase");
              break;
            case WorkCode.safety:
              const code = "S";
              ref.read(safetyInfoNotifierProvider.notifier).setCode(code);
              ref
                  .read(safetyInfoStateNotifierProvider.notifier)
                  .mapEventToState(
                    const SafetyInfoEvent.fetchSafetyInfos(code),
                  );
              context.push("/safety", extra: title);
              break;
            case WorkCode.infra:
              const code = "E";
              ref.read(safetyInfoNotifierProvider.notifier).setCode(code);
              ref
                  .read(safetyInfoStateNotifierProvider.notifier)
                  .mapEventToState(
                    const SafetyInfoEvent.fetchSafetyInfos(code),
                  );
              context.push("/safety", extra: title);
              break;
            case WorkCode.qm:
              context.push("/qm");
              break;
          }

          Future.delayed(
            const Duration(milliseconds: 300),
            () {
              onceClicked = false;
            },
          );
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
          color: Theme.of(context).primaryColorDark,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
