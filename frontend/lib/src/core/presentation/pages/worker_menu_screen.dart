import 'package:flutter/material.dart';
import 'package:frontend/src/bad_control/presentation/widgets/bad_control_popup.dart';
import 'package:frontend/src/bad_control/presentation/widgets/bad_control_popup_for_safety.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/pages/menu_item.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/home_app_bar.dart';
import 'package:frontend/src/impeller/application/impeller/load/barcode_state.dart';
import 'package:frontend/src/impeller/dependency_injection.dart';
import 'package:frontend/src/impeller/presentation/viewmodels/barcode_notifier.dart';
import 'package:frontend/src/safety/application/info/safety_info_event.dart';
import 'package:frontend/src/safety/dependency_injection.dart';
import 'package:frontend/src/work_base/application/work_base_event.dart';
import 'package:frontend/src/work_base/application/work_base_state.dart';
import 'package:frontend/src/work_base/dependency_injection.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum WorkCode {
  work,
  cwork,
  safety,
  infra,
  qm,
  badControl,
}

class WorkerMenuScreen extends ConsumerStatefulWidget {
  const WorkerMenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<WorkerMenuScreen> createState() => _WorkerMenuScreenState();
}

class _WorkerMenuScreenState extends ConsumerState<WorkerMenuScreen> {
  bool onceClicked = false;
  String curVersion = "";
  String newVersion = "";
  String memo = "";

  @override
  void initState() {
    super.initState();

    getVersionInfo();
    getNoticeInfo();

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
              title: "조회 오류",
              content: "메뉴 목록을 조회하는데 실패했습니다.\n$message",
              backgroundColor: Theme.of(context).errorColor,
            );
          },
          orElse: () {},
        );
      }),
    );

    ref.listen<BarcodeState>(
      barcodeStateNotifierProvider,
      ((previous, current) {
        current.when(
          initial: (barcode) {},
          loading: (barcode) {},
          loaded: (barcode) {
            ref.read(barcodeNotifier.notifier).setOrderList(barcode);
          },
          failure: (barcode, message) {},
        );
      }),
    );

    // ref.listen<VersionState>(
    //   versionStateNotifierProvider,
    //   (previous, current) {
    //     current.maybeWhen(
    //       outdated: (localVersion, latestVersion) {
    //         curVersion = localVersion;
    //         newVersion = latestVersion;
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

    return Scaffold(
      appBar: const HomeAppBar(title: "작업 선택"),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildMenuButton(
              context,
              ref,
              code: WorkCode.work,
              title: "공정관리",
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            buildMenuButton(
              context,
              ref,
              code: WorkCode.cwork,
              title: "현공정조회",
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            buildMenuButton(
              context,
              ref,
              code: WorkCode.infra,
              title: "설장비 점검",
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            buildMenuButton(
              context,
              ref,
              code: WorkCode.safety,
              title: "안전 점검",
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            buildMenuButton(
              context,
              ref,
              code: WorkCode.qm,
              title: "QM 검사",
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            buildMenuButton(
              context,
              ref,
              code: WorkCode.badControl,
              title: "업체별 불량관리",
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            ElevatedButton(
              onPressed: () {
                if (newVersion == "") {
                  showFlashBar(
                    context,
                    title: "업데이트 오류",
                    content: "최신 버전 정보를 불러오지 못했습니다.",
                    backgroundColor: Theme.of(context).errorColor,
                  );
                } else if (newVersion == curVersion) {
                  showFlashBar(
                    context,
                    title: "버전 업데이트",
                    content: "이미 최신 버전입니다.",
                    backgroundColor: Theme.of(context).errorColor,
                  );
                } else {
                  Navigator.of(context).push(
                    CustomScaleRoute(
                      builder: (context) => VersionDialog(
                        localVersion: curVersion,
                        latestVersion: newVersion,
                      ),
                      backgroundColor: Colors.black.withOpacity(.2),
                    ),
                  );
                }
              },
              child: const Text(
                "버전 업데이트",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: getButtonColor(),
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceL),
            Text(
              "현재 버전 : " + curVersion + "    최신 버전 : " + newVersion,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
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
            case WorkCode.cwork:
              context.push("/cworkorder");
              break;
            case WorkCode.safety:
              // const code = "S";
              // ref.read(safetyInfoNotifierProvider.notifier).setCode(code);
              // ref
              //     .read(safetyInfoStateNotifierProvider.notifier)
              //     .mapEventToState(
              //       const SafetyInfoEvent.fetchSafetyInfos(code),
              //     );
              // context.push("/safety", extra: title);
              // break;
              Navigator.of(context).push(
                CustomSlideRoute(
                  backgroundColor: Colors.black.withOpacity(.2),
                  builder: (BuildContext context) {
                    return const BadControlForSafetyPopup();
                  },
                ),
              );
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
            case WorkCode.badControl:
              Navigator.of(context).push(
                CustomSlideRoute(
                  backgroundColor: Colors.black.withOpacity(.2),
                  builder: (BuildContext context) {
                    return const BadControlPopup();
                  },
                ),
              );
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
          color: getMenuButtonColor(code),
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

  Future<void> getVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final response = await ref.watch(dioProvider).get("/apk");

    setState(() {
      curVersion = packageInfo.version;
      newVersion = response.data[0]["APK_V"];
    });

    if (newVersion != curVersion) {
      Navigator.of(context).push(
        CustomScaleRoute(
          builder: (context) => VersionDialog(
            localVersion: curVersion,
            latestVersion: newVersion,
          ),
          backgroundColor: Colors.black.withOpacity(.2),
        ),
      );
    }
  }

  Future<void> getNoticeInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final response = await ref.watch(dioProvider).get("/notice");

    setState(() {
      memo = response.data[0]["MEMO"].replaceAll("&nbsp", " ");
    });

    Navigator.of(context).push(
      CustomScaleRoute(
        builder: (context) => NoticeDialog(
          memo: memo,
        ),
        backgroundColor: Colors.black.withOpacity(.2),
      ),
    );
  }

  Color getButtonColor() {
    if (curVersion == newVersion || newVersion == "") {
      return Colors.grey;
    } else {
      return Colors.blue;
    }
  }

  getMenuButtonColor(code) {
    if (code == WorkCode.badControl) {
      // return Colors.grey;
      return Theme.of(context).primaryColorDark;
    } else {
      return Theme.of(context).primaryColorDark;
    }
  }
}
