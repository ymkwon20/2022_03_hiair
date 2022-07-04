import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/home_app_bar.dart';
import 'package:frontend/src/safety/application/check/fetch/safety_check_event.dart';
import 'package:frontend/src/safety/domain/entities/safety_info.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:frontend/src/core/presentation/pages/custom_route.dart';
import 'package:frontend/src/core/presentation/pages/table_failure_row.dart';
import 'package:frontend/src/core/presentation/widgets/dialog.dart';
import 'package:frontend/src/safety/application/info/safety_info_event.dart';
import 'package:frontend/src/safety/application/info/safety_info_state.dart';
import 'package:frontend/src/safety/dependency_injection.dart';
import 'package:frontend/src/safety/presentation/screens/tablerows/safety_info_loaded_row.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/core/presentation/widgets/table_loading_row.dart';
import 'package:frontend/src/workorder/presentation/viewmodels/work_order_list_notifier.dart';

late AutoDisposeStateProvider<SafetyInfo> currentSafetyInfo;

class SafetyScreen extends ConsumerStatefulWidget {
  const SafetyScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  ConsumerState<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends ConsumerState<SafetyScreen> {
  void _navigateTo(String filterKey) {
    ref.watch(safetyInfoStateNotifierProvider).maybeWhen(
          loaded: (_) {
            ref.read(tableColumnNotifier.notifier).state = filterKey;
            Navigator.of(context).push(
              CustomScaleRoute(
                backgroundColor: Colors.black.withOpacity(.2),
                builder: (_) => CustomTableHeaderDialog(filterKey: filterKey),
              ),
            );
          },
          orElse: () {},
        );
  }

  void _onRowTap(int index) {
    currentSafetyInfo = StateProvider.autoDispose(
      (ref) => ref.watch(safetyInfoNotifierProvider).items[index],
    );

    ref.read(safetyCheckStateNotifierProvider.notifier).mapEventToState(
          SafetyCheckEvent.fetchSafetyChecks(
            ref.watch(safetyInfoNotifierProvider).items[index].equipCd,
            ref.watch(safetyInfoNotifierProvider).code,
            DateFormat("yyyy-MM-dd").format(DateTime.now()),
          ),
        );

    context.push("/safety/check");
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SafetyInfoState>(
      safetyInfoStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          loaded: (items) {
            ref.read(safetyInfoNotifierProvider.notifier).setItems(items);
          },
          orElse: () {},
        );
      },
    );

    final state = ref.watch(safetyInfoStateNotifierProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HomeAppBar(title: widget.title),
      body: CustomTable(
        onRowPressed: (index) {
          state.maybeWhen(
            loaded: (_) {
              _onRowTap(index);
            },
            orElse: () {},
          );
        },
        onRefresh: () async {
          ref.read(safetyInfoStateNotifierProvider.notifier).mapEventToState(
                SafetyInfoEvent.fetchSafetyInfos(
                  ref.watch(safetyInfoNotifierProvider).code,
                ),
              );
        },
        headers: [
          CustomTableHeader(
            name: "plantNm",
            title: "공장명",
            width: 200,
            onTap: ref.read(safetyInfoNotifierProvider.notifier).sort,
            onLongTap: () {
              _navigateTo("plantNm");
            },
            children: _buildAdditionalIcons("plantNm"),
          ),
          CustomTableHeader(
            name: "equipCd",
            title: "설비 코드",
            width: 200,
            onTap: ref.read(safetyInfoNotifierProvider.notifier).sort,
            onLongTap: () {
              _navigateTo("equipCd");
            },
            children: _buildAdditionalIcons("equipCd"),
          ),
          CustomTableHeader(
            name: "equipNm",
            title: "설비명",
            width: 500,
            onTap: ref.read(safetyInfoNotifierProvider.notifier).sort,
            onLongTap: () {
              _navigateTo("equipNm");
            },
            children: _buildAdditionalIcons("equipNm"),
          ),
          CustomTableHeader(
            name: "type",
            title: "설비 유형",
            width: 100,
            onTap: ref.read(safetyInfoNotifierProvider.notifier).sort,
            onLongTap: () {
              _navigateTo("type");
            },
            children: _buildAdditionalIcons("type"),
          ),
          CustomTableHeader(
            name: "location",
            title: "위치",
            width: 300,
            onTap: ref.read(safetyInfoNotifierProvider.notifier).sort,
            onLongTap: () {
              _navigateTo("location");
            },
            children: _buildAdditionalIcons("location"),
          ),
        ],
        rowBuilder: (context, index) {
          return state.when(
            init: () {
              return TableLoadingRow();
            },
            loading: () {
              return TableLoadingRow();
            },
            loaded: (_) {
              return SafetyInfoLoadedRow(
                info: ref.watch(safetyInfoNotifierProvider).items[index],
              );
            },
            failure: (message) {
              return TableFailureRow(message: message);
            },
          );
        },
        rowCount: state.when(
          init: () => 1,
          loading: () => 1,
          loaded: (current) => current.length,
          failure: (_) => 1,
        ),
      ),
    );
  }

  List<Widget> _buildAdditionalIcons(String key) {
    final children = <Widget>[];

    // sort icon
    if (ref.watch(safetyInfoNotifierProvider).sortedColumn[key] == null) {
    } else if (ref.watch(safetyInfoNotifierProvider).sortedColumn[key]!) {
      children.add(const Icon(Icons.arrow_upward));
    } else {
      children.add(const Icon(Icons.arrow_downward));
    }

    // filter icon
    if (ref.watch(safetyInfoNotifierProvider).filterMap[key] != null) {
      children.add(const Icon(Icons.filter_alt));
    }

    return children;
  }
}
