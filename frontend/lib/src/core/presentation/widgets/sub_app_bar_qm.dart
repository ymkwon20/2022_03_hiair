import 'package:flutter/material.dart';
import 'package:frontend/src/workorder/application/qm_work_order/load/qm_work_order_event.dart';
import 'package:frontend/src/workorder/dependency_injection.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/qm_work_order_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class SubAppBarQM extends ConsumerWidget implements PreferredSizeWidget {
  const SubAppBarQM({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController startDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();
    startDateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    endDateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(children: <Widget>[
        Text(
          "검사신청일",
          style: Theme.of(context).textTheme.headline6,
        ),
        Flexible(
          child: TextField(
            controller: startDateController,
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              border: OutlineInputBorder(),
            ),
            style: Theme.of(context).textTheme.bodyText1,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                      1900), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2300));

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                startDateController.text = formattedDate;
              }
            },
          ),
        ),
        const SizedBox(width: 40),
        Text(
          "~   ",
          style: Theme.of(context).textTheme.headline5,
        ),
        Flexible(
          child: TextField(
            controller: endDateController,
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              border: OutlineInputBorder(),
            ),
            style: Theme.of(context).textTheme.bodyText1,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                      1900), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2300));

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                endDateController.text = formattedDate;
              }
            },
          ),
        ),
        ElevatedButton(
          child: const Icon(Icons.search),
          onPressed: () => _onTap(
            ref,
            startDateController.text,
            endDateController.text,
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 68, 68, 68),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
          ),
        ),
        ElevatedButton(
          child: const Icon(
            Icons.refresh,
            color: Colors.black,
          ),
          onPressed: () => _onRefresh(context, ref),
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          ),
        ),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _onTap(WidgetRef ref, String startDate, String endDate) async {
    ref.read(qmWorkOrderListNotifier.notifier).clear();
    await searchListUpdate(ref, startDate, endDate);
  }

  Future<void> searchListUpdate(ref, startDate, endDate) async {
    await ref.read(qmWorkOrderStateNotifierProvider.notifier).mapEventToState(
          QmWorkOrderEvent.searchQMList(startDate, endDate),
        );
  }

  void _onRefresh(BuildContext context, WidgetRef ref) async {
    ref.read(qmWorkOrderListNotifier.notifier).clear();

    await refreshList(ref);
  }

  Future<void> refreshList(ref) async {
    await ref.read(qmWorkOrderStateNotifierProvider.notifier).mapEventToState(
          const QmWorkOrderEvent.fetchListByPage(),
        );
  }
}
