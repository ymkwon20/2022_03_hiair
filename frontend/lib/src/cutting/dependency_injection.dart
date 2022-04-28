import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/cutting/application/check/fetch/cutting_check_state.dart';
import 'package:frontend/src/cutting/application/check/fetch/cutting_check_state_notifier.dart';
import 'package:frontend/src/cutting/application/check/save/cutting_check_save_state.dart';
import 'package:frontend/src/cutting/application/check/save/cutting_check_save_state_notifier.dart';
import 'package:frontend/src/cutting/application/request/cutting_request_state.dart';
import 'package:frontend/src/cutting/application/request/cutting_request_state_notifier.dart';
import 'package:frontend/src/cutting/application/serial/cutting_serial_state.dart';
import 'package:frontend/src/cutting/application/serial/cutting_serial_state_notifier.dart';
import 'package:frontend/src/cutting/domain/repositories/i_cutting_repository.dart';
import 'package:frontend/src/cutting/domain/usecases/fetch_cutting_checks.dart';
import 'package:frontend/src/cutting/domain/usecases/fetch_cutting_requests.dart';
import 'package:frontend/src/cutting/domain/usecases/fetch_cuttings.dart';
import 'package:frontend/src/cutting/domain/usecases/save_cutting_check.dart';
import 'package:frontend/src/cutting/infrastructure/datasources/cutting_service.dart';
import 'package:frontend/src/cutting/infrastructure/datasources/remote/cutting_remote_service.dart';
import 'package:frontend/src/cutting/infrastructure/repositories/cutting_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ! Application
final cuttingSerialsStateNotifierProvider =
    StateNotifierProvider<CuttingSerialStateNotifier, CuttingSerialState>(
  (ref) => CuttingSerialStateNotifier(
      fetchCuttings: ref.watch(fetchCuttingsUsecaseProvider)),
);

final cuttingRequestsStateNotifierProvider =
    StateNotifierProvider<CuttingRequestStateNotifier, CuttingRequestState>(
  (ref) => CuttingRequestStateNotifier(
      fetchCuttingRequests: ref.watch(fetchCuttingRequestsUsecaseProvider)),
);

final cuttingChecksStateNotifierProvider =
    StateNotifierProvider<CuttingCheckStateNotifier, CuttingCheckState>(
  (ref) => CuttingCheckStateNotifier(
      fetchChecks: ref.watch(fetchCuttingChecksUsecaseProvider)),
);

final cuttingCheckSaveStateNotifierProvider =
    StateNotifierProvider<CuttingCheckSaveStateNotifier, CuttingCheckSaveState>(
  (ref) => CuttingCheckSaveStateNotifier(
      save: ref.watch(saveCuttingCheckUsecaseProvider)),
);

// ! Domain(usecase)
final fetchCuttingsUsecaseProvider = Provider<FetchCuttings>(
  (ref) => FetchCuttings(repository: ref.watch(cuttingRepositoryProvider)),
);

final fetchCuttingRequestsUsecaseProvider = Provider<FetchCuttingRequests>(
  (ref) =>
      FetchCuttingRequests(repository: ref.watch(cuttingRepositoryProvider)),
);

final fetchCuttingChecksUsecaseProvider = Provider<FetchCuttingChecks>(
  (ref) => FetchCuttingChecks(repository: ref.watch(cuttingRepositoryProvider)),
);

final saveCuttingCheckUsecaseProvider = Provider<SaveCuttingCheck>(
  (ref) => SaveCuttingCheck(repository: ref.watch(cuttingRepositoryProvider)),
);

// ! Repository
final cuttingRepositoryProvider = Provider<ICuttingRepository>(
  (ref) =>
      CuttingRepository(remoteService: ref.watch(cuttingRemoteServiceProvider)),
);

// ! Datasource
final cuttingRemoteServiceProvider = Provider<CuttingService>(
  (ref) => CuttingRemoteService(httpClient: ref.watch(dioProvider)),
);
