import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:frontend/src/workorder/application/qm_work_order/load/qm_work_order_state.dart';
import 'package:frontend/src/workorder/application/qm_work_order/load/qm_work_order_state_notifier.dart';
import 'package:frontend/src/workorder/application/qm_work_order/save/qm_work_order_save_state.dart';
import 'package:frontend/src/workorder/application/qm_work_order/save/qm_work_order_save_state_notifier.dart';
import 'package:frontend/src/workorder/application/work_order/load/work_order_search_result_notifier.dart';
import 'package:frontend/src/workorder/application/work_order/load/work_order_state.dart';
import 'package:frontend/src/workorder/application/work_order/load/work_order_state_notifier.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_state.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_state_notifier.dart';
import 'package:frontend/src/workorder/domain/repositories/i_work_order_repository.dart';
import 'package:frontend/src/workorder/domain/usecases/fetch_qm_work_order_list.dart';
import 'package:frontend/src/workorder/domain/usecases/fetch_work_order_list.dart';
import 'package:frontend/src/workorder/domain/usecases/save_qm_work_order.dart';
import 'package:frontend/src/workorder/domain/usecases/save_work_order.dart';
import 'package:frontend/src/workorder/domain/usecases/save_work_order_list.dart';
import 'package:frontend/src/workorder/domain/usecases/search_work_order_list.dart';
import 'package:frontend/src/workorder/infrastructure/datasources/remote/work_order_remote_service.dart';
import 'package:frontend/src/workorder/infrastructure/datasources/work_order_service.dart';
import 'package:frontend/src/workorder/infrastructure/repositories/work_order_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//! application
final workOrderStateNotifierProvider =
    StateNotifierProvider<WorkOrderStateNotifier, WorkOrderState>(
  (ref) => WorkOrderStateNotifier(
    workbase: ref.watch(workBaseChangeNotifierProvider),
    fetchItems: ref.watch(fetchWorkOrderListProvider),
    searchItems: ref.watch(searchWorkOrderListProvider),
  ),
);

final workOrderSearchNotifierProvider =
    StateNotifierProvider<WorkOrderSearchResultNotifier, WorkOrderState>(
  (ref) => WorkOrderSearchResultNotifier(
    workbase: ref.watch(workBaseChangeNotifierProvider),
    searchItems: ref.watch(searchWorkOrderListProvider),
  ),
);

final qmWorkOrderStateNotifierProvider =
    StateNotifierProvider<QmWorkOrderStateNotifier, QmWorkOrderState>(
  (ref) => QmWorkOrderStateNotifier(
    fetchQmItems: ref.watch(fetchQmWorkOrderListProvider),
  ),
);

final workOrderSaveStateNotifierProvider =
    StateNotifierProvider<WorkOrderSaveStateNotifier, WorkOrderSaveState>(
  (ref) => WorkOrderSaveStateNotifier(
    saveWorkOrder: ref.watch(saveWorkOrderProvider),
    saveWorkOrderList: ref.watch(saveWorkOrderListProvider),
    authNotifier: ref.watch(authChangeNotifierProvider),
    fetchAndSaveChecklist: ref.watch(fetchAndSaveChecklistProvider),
  ),
);

final qmWorkOrderSaveStateNotifierProvider =
    StateNotifierProvider<QmWorkOrderSaveStateNotifier, QmWorkOrderSaveState>(
  (ref) => QmWorkOrderSaveStateNotifier(
    saveQmWorkOrder: ref.watch(saveQmWorkOrderProvider),
    authNotifier: ref.watch(authChangeNotifierProvider),
  ),
);

//! usecase
final fetchWorkOrderListProvider = Provider(
  (ref) =>
      FetchWorkOrderList(repository: ref.watch(workOrderRepositoryProvider)),
);

final searchWorkOrderListProvider = Provider(
  (ref) =>
      SearchWorkOrderList(repository: ref.watch(workOrderRepositoryProvider)),
);

final fetchQmWorkOrderListProvider = Provider(
  (ref) =>
      FetchQmWorkOrderList(repository: ref.watch(workOrderRepositoryProvider)),
);

final saveWorkOrderProvider = Provider(
  (ref) => SaveWorkOrder(repository: ref.watch(workOrderRepositoryProvider)),
);

final saveWorkOrderListProvider = Provider(
  (ref) =>
      SaveWorkOrderList(repository: ref.watch(workOrderRepositoryProvider)),
);

final saveQmWorkOrderProvider = Provider(
  (ref) => SaveQmWorkOrder(repository: ref.watch(workOrderRepositoryProvider)),
);

//! repository
final workOrderRepositoryProvider = Provider<IWorkOrderRepository>(
  (ref) =>
      WorkOrderRepository(remote: ref.watch(workOrderRemoteServiceProvider)),
);

//! datasource
final workOrderRemoteServiceProvider = Provider<WorkOrderService>(
  (ref) => WorkOrderRemoteService(httpClient: ref.watch(dioProvider)),
);
