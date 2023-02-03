import 'package:flutter/material.dart';
import 'package:frontend/src/impeller/application/impeller/load/impeller_event.dart';
import 'package:frontend/src/impeller/dependency_injection.dart';
import 'package:frontend/src/workorder/application/work_order/load/work_order_event.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/work_order_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final textFieldControllerYard = TextEditingController();
final textFieldControllerHullNo = TextEditingController();

class SubAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const SubAppBar({
    Key? key,
    required this.code,
  }) : super(key: key);

  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: <Widget>[
          Text(
            "Yard ",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(width: 20),
          Flexible(
            child: TextField(
              controller: textFieldControllerYard,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Yard',
              ),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(width: 40),
          Text(
            "Hull No ",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(width: 20),
          Flexible(
            child: TextField(
              controller: textFieldControllerHullNo,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Hull No',
              ),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          ElevatedButton(
            child: const Icon(Icons.search),
            onPressed: () => _onTap(context, ref, textFieldControllerYard.text,
                textFieldControllerHullNo.text),
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 68, 68, 68),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _onTap(
      BuildContext context, WidgetRef ref, String yard, String hullNo) async {
    ref.read(workOrderListNotifier.notifier).clear();
    await searchListUpdate(ref);
  }

  Future<void> searchListUpdate(ref) async {
    if (code == 'IMP') {
      await ref.read(impellerStateNotifierProvider.notifier).mapEventTostate(
            ImpellerEvent.searchByYardHullNo(
              ref.watch(workOrderListNotifier).items,
              ref.watch(workOrderListNotifier).page,
              textFieldControllerYard.text,
              textFieldControllerHullNo.text,
            ),
          );
    } else {
      await ref.read(workOrderStateNotifierProvider.notifier).mapEventToState(
            WorkOrderEvent.searchByYardHullNo(
              ref.watch(workOrderListNotifier).items,
              ref.watch(workOrderListNotifier).page,
              textFieldControllerYard.text,
              textFieldControllerHullNo.text,
            ),
          );
    }
  }
}
