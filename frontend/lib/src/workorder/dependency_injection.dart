import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/workorder/application/load/work_order_state.dart';
import 'package:frontend/src/workorder/application/load/work_order_state_notifier.dart';
import 'package:frontend/src/workorder/application/save/work_order_save_state.dart';
import 'package:frontend/src/workorder/application/save/work_order_save_state_notifier.dart';
import 'package:frontend/src/workorder/domain/repositories/i_work_order_repository.dart';
import 'package:frontend/src/workorder/domain/usecases/fetch_work_order_list.dart';
import 'package:frontend/src/workorder/domain/usecases/save_work_order.dart';
import 'package:frontend/src/workorder/domain/usecases/save_work_order_list.dart';
import 'package:frontend/src/workorder/infrastructure/datasources/remote/work_order_remote_service.dart';
import 'package:frontend/src/workorder/infrastructure/datasources/work_order_service.dart';
import 'package:frontend/src/workorder/infrastructure/repositories/qm_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//! application
final workOrderStateNotifierProvider =
    StateNotifierProvider<WorkOrderStateNotifier, WorkOrderState>(
  (ref) => WorkOrderStateNotifier(
    auth: ref.watch(authChangeNotifierProvider),
    fetchQmItems: ref.watch(fetchWorkOrderListProvider),
  ),
);

final workOrderSaveStateNotifierProvider =
    StateNotifierProvider<WorkOrderSaveStateNotifier, WorkOrderSaveState>(
  (ref) => WorkOrderSaveStateNotifier(
    auth: ref.watch(authChangeNotifierProvider),
    saveWorkOrder: ref.watch(saveWorkOrderProvider),
    saveWorkOrderList: ref.watch(saveWorkOrderListProvider),
  ),
);

//! usecase
final fetchWorkOrderListProvider = Provider(
  (ref) =>
      FetchWorkOrderList(repository: ref.watch(workOrderRepositoryProvider)),
);

final saveWorkOrderProvider = Provider(
  (ref) => SaveWorkOrder(repository: ref.watch(workOrderRepositoryProvider)),
);

final saveWorkOrderListProvider = Provider(
  (ref) =>
      SaveWorkOrderList(repository: ref.watch(workOrderRepositoryProvider)),
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
