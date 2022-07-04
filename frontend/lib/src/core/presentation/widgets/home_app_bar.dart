import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/auth/domain/entities/user_type.dart';
import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/pages/menu_item.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

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
    return AppBar(
      title: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: LayoutConstant.paddingM),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: Theme.of(context).iconTheme,
      actions: [
        PopupMenuButton<MenuEntity>(
          onSelected: (item) => onSelected(context, item),
          itemBuilder: (context) => buildMenus(
              context, ref.watch(authChangeNotifierProvider).user!.type),
        ),
      ],
    );
  }

  List<PopupMenuEntry<MenuEntity>> buildMenus(
      BuildContext context, UserType type) {
    final items = <PopupMenuEntry<MenuEntity>>[];

    // switch (type) {
    //   case UserType.admin:
    //     items.addAll(MenuItems.admin
    //         .map((item) => buildMenuItem(context, item))
    //         .toList());

    //     items.add(
    //       const PopupMenuDivider(),
    //     );

    //     break;
    //   case UserType.worker:
    //     break;
    // }

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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
