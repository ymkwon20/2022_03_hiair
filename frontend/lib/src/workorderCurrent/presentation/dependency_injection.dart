import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/workorderCurrent/application/current_work_order_state.dart';
import 'package:frontend/src/workorderCurrent/application/current_work_order_state_notifier.dart';
import 'package:frontend/src/workorderCurrent/domain/repositories/i_current_work_order_repository.dart';
import 'package:frontend/src/workorderCurrent/domain/usecases/fetch_current_work_order_list.dart';
import 'package:frontend/src/workorderCurrent/infrastructure/datasources/current_work_order_service.dart';
import 'package:frontend/src/workorderCurrent/infrastructure/datasources/remote/current_work_order_remote_service.dart';
import 'package:frontend/src/workorderCurrent/infrastructure/repositories/current_work_order_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentWorkOrderStateNotifierProvider =
    StateNotifierProvider<CurrentWorkOrderStateNotifier, CurrentWorkOrderState>(
  (ref) => CurrentWorkOrderStateNotifier(
    fetchCurrentItems: ref.watch(fetchCurrentWorkOrderListProvider),
  ),
);

final fetchCurrentWorkOrderListProvider = Provider(
  (ref) => FetchCurrentWorkOrderList(
      repository: ref.watch(currentWorkOrderRepositoryProvider)),
);

final currentWorkOrderRepositoryProvider =
    Provider<ICurrentWorkOrderRepository>(
  (ref) => CurrentWorkOrderRepository(
      remote: ref.watch(currentWorkOrderRemoteServiceProvider)),
);

final currentWorkOrderRemoteServiceProvider = Provider<CurrentWorkOrderService>(
  (ref) => CurrentWorkOrderRemoteService(httpClient: ref.watch(dioProvider)),
);
