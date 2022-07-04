import 'package:flutter/material.dart';
import 'package:frontend/src/auth/domain/entities/user_type.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/core/presentation/pages/menu_item.dart';
import 'package:frontend/src/core/presentation/widgets/home_app_bar.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkOrderHomeScreen extends ConsumerWidget {
  const WorkOrderHomeScreen({Key? key}) : super(key: key);

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
      resizeToAvoidBottomInset: false,
      appBar: HomeAppBar(
        title:
            "${ref.watch(workBaseChangeNotifierProvider).workBase?.wcName ?? ""} | ${ref.watch(workBaseChangeNotifierProvider).workBase?.wbName ?? ""}",
      ),
      body: ref.watch(workBaseChangeNotifierProvider).page,
    );
  }

  List<PopupMenuEntry<MenuEntity>> buildMenus(
      BuildContext context, UserType type) {
    final items = <PopupMenuEntry<MenuEntity>>[];

    switch (type) {
      case UserType.admin:
        items.addAll(MenuItems.admin
            .map((item) => buildMenuItem(context, item))
            .toList());

        items.add(
          const PopupMenuDivider(),
        );

        break;
      case UserType.worker:
        break;
    }

    items.addAll(MenuItems.notAdmin
        .map((item) => buildMenuItem(context, item))
        .toList());

    return items;
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
