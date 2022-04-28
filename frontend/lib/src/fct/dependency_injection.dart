import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/fct/application/fct/fct_state.dart';
import 'package:frontend/src/fct/application/fct/fct_state_notifier.dart';
import 'package:frontend/src/fct/application/save/fct_save_state.dart';
import 'package:frontend/src/fct/application/save/fct_save_state_notifier.dart';
import 'package:frontend/src/fct/application/serial/fct_serial_state.dart';
import 'package:frontend/src/fct/application/serial/fct_serial_state_notifier.dart';
import 'package:frontend/src/fct/domain/repositories/i_fct_repository.dart';
import 'package:frontend/src/fct/domain/usecases/get_fct_items.dart';
import 'package:frontend/src/fct/domain/usecases/get_fct_serials.dart';
import 'package:frontend/src/fct/domain/usecases/save_fct_items.dart';
import 'package:frontend/src/fct/infrastructure/datasources/i_fct_service.dart';
import 'package:frontend/src/fct/infrastructure/datasources/remote/fct_remote_service.dart';
import 'package:frontend/src/fct/infrastructure/repositories/fct_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//! application
final fctSerialStateNotifierProvider =
    StateNotifierProvider<FctSerialStateNotifier, FctSerailState>(
  (ref) =>
      FctSerialStateNotifier(getFctSerials: ref.watch(getFctSerialsProvider)),
);

final fctStateNotifierProvider =
    StateNotifierProvider<FctStateNotifier, FctState>(
  (ref) => FctStateNotifier(getFctItem: ref.watch(getFctItemProvider)),
);

final fctSaveStateNotifierProvider =
    StateNotifierProvider<FctSaveStateNotifier, FctSaveState>(
  (ref) => FctSaveStateNotifier(
      saveFctItem: ref.watch(saveFctItemProvider),
      auth: ref.watch(authChangeNotifierProvider)),
);

//! usecase
final getFctSerialsProvider = Provider(
  (ref) => GetFctSerials(repository: ref.watch(fctRepositoryProvider)),
);

final getFctItemProvider = Provider(
  (ref) => GetFctItems(repository: ref.watch(fctRepositoryProvider)),
);

final saveFctItemProvider = Provider(
  (ref) => SaveFctItems(repository: ref.watch(fctRepositoryProvider)),
);

//! repository
final fctRepositoryProvider = Provider<IFctRepository>(
  (ref) => FctRepository(remote: ref.watch(fctRemoteServiceProvider)),
);

//! datasource
final fctRemoteServiceProvider = Provider<IFctService>(
  (ref) => FctRemoteService(httpClient: ref.watch(dioProvider)),
);
