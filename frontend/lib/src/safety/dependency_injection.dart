import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/safety/application/check/fetch/safety_check_state.dart';
import 'package:frontend/src/safety/application/check/fetch/safety_check_state_notifier.dart';
import 'package:frontend/src/safety/application/check/save/safety_check_save_state.dart';
import 'package:frontend/src/safety/application/check/save/safety_check_save_state_notifier.dart';
import 'package:frontend/src/safety/application/info/safety_info_state.dart';
import 'package:frontend/src/safety/application/info/safety_info_state_notifier.dart';
import 'package:frontend/src/safety/application/repair/save/safety_repair_save_state.dart';
import 'package:frontend/src/safety/application/repair/save/safety_repair_save_state_notifier.dart';
import 'package:frontend/src/safety/domain/repositories/i_safety_repository.dart';
import 'package:frontend/src/safety/domain/usecases/fetch_safety_checks.dart';
import 'package:frontend/src/safety/domain/usecases/fetch_safety_infos.dart';
import 'package:frontend/src/safety/domain/usecases/save_safety_checks.dart';
import 'package:frontend/src/safety/domain/usecases/save_safety_repair_info.dart';
import 'package:frontend/src/safety/infrastructure/datasources/remote/safety_remote_service.dart';
import 'package:frontend/src/safety/infrastructure/datasources/safety_service.dart';
import 'package:frontend/src/safety/infrastructure/repositories/safety_repository.dart';
import 'package:frontend/src/safety/presentation/screens/safety_screen.dart';
import 'package:frontend/src/safety/presentation/viewmodels/safety_check_change_notifier.dart';
import 'package:frontend/src/safety/presentation/viewmodels/safety_info_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//! application
final safetyInfoStateNotifierProvider =
    StateNotifierProvider<SafetyInfoStateNotifier, SafetyInfoState>(
  (ref) => SafetyInfoStateNotifier(
    fetchSafetyInfos: ref.watch(fetchSafetyInfosProvider),
  ),
);

final safetyCheckStateNotifierProvider =
    StateNotifierProvider<SafetyCheckStateNotifier, SafetyCheckState>(
  (ref) => SafetyCheckStateNotifier(
    fetchSafetyChecks: ref.watch(fetchSafetyChecksProvider),
    infoNotifier: ref.watch(safetyInfoNotifierProvider),
  ),
);

final safetyCheckSaveStateNotifierProvider = StateNotifierProvider.autoDispose<
    SafetyCheckSaveStateNotifier, SafetyCheckSaveState>(
  (ref) => SafetyCheckSaveStateNotifier(
    saveSafetyChecks: ref.watch(saveSafetyChecksProvider),
    notifier: ref.watch(safetyCheckNotifierProvider),
    workType: ref.watch(safetyInfoNotifierProvider).code,
    workCode: ref.watch(currentSafetyInfo).equipCd,
  ),
);

final safetyRepairSaveStateNotifierProvider =
    StateNotifierProvider<SafetyRepairSaveStateNotifier, SafetyRepairSaveState>(
  (ref) => SafetyRepairSaveStateNotifier(
    saveSafetyRepairInfo: ref.watch(saveSafetyRepairInfoProvider),
    authNotifier: ref.watch(authChangeNotifierProvider),
  ),
);

//! viewmodel
final safetyInfoNotifierProvider = ChangeNotifierProvider(
  (ref) => SafetyInfoChangeNotifier(),
);

final safetyCheckNotifierProvider = ChangeNotifierProvider(
  (ref) => SafetyCheckChangeNotifier(),
);

//! usecase
final fetchSafetyInfosProvider = Provider(
  (ref) => FetchSafetyInfos(repository: ref.watch(safetyRepositoryProvider)),
);

final fetchSafetyChecksProvider = Provider(
  (ref) => FetchSafetyChecks(repository: ref.watch(safetyRepositoryProvider)),
);
final saveSafetyChecksProvider = Provider(
  (ref) => SaveSafetyChecks(repository: ref.watch(safetyRepositoryProvider)),
);

final saveSafetyRepairInfoProvider = Provider(
  (ref) =>
      SaveSafetyRepairInfo(repository: ref.watch(safetyRepositoryProvider)),
);

//! repository
final safetyRepositoryProvider = Provider<ISafetyRepository>(
  (ref) => SafetyRepository(remote: ref.watch(safetyRemoteServiceProvider)),
);

//! datasource
final safetyRemoteServiceProvider = Provider<SafetyService>(
  (ref) => SafetyRemoteService(
    httpClient: ref.watch(dioProvider),
  ),
);
