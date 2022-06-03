import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/qm/application/menu/qm_menu_state.dart';
import 'package:frontend/src/qm/application/menu/qm_menu_state_notifier.dart';
import 'package:frontend/src/qm/domain/repositories/i_qm_repository.dart';
import 'package:frontend/src/qm/domain/usecases/fetch_qm_menulist.dart';
import 'package:frontend/src/qm/infrastructure/datasources/qm_service.dart';
import 'package:frontend/src/qm/infrastructure/datasources/remote/qm_remote_service.dart';
import 'package:frontend/src/qm/infrastructure/repositories/qm_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//! application
final qmMenuStateNotifierProvider =
    StateNotifierProvider<QmMenuStateNotifier, QmMenuState>(
  (ref) =>
      QmMenuStateNotifier(fetchQmMenulist: ref.watch(fetchQmMenulistProvider)),
);

//! useacse
final fetchQmMenulistProvider = Provider(
  (ref) => FetchQmMenulist(repository: ref.watch(qmRepositoryProvider)),
);

//! repository
final qmRepositoryProvider = Provider<IQmRepository>(
  (ref) => QmRepository(remote: ref.watch(qmRemoteServiceProvider)),
);

//! datasources
final qmRemoteServiceProvider = Provider<QmService>(
  (ref) => QmRemoteService(httpClient: ref.watch(dioProvider)),
);
