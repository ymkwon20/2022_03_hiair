import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/qm/application/load/qm_state.dart';
import 'package:frontend/src/qm/application/load/qm_state_notifier.dart';
import 'package:frontend/src/qm/application/save/qm_save_state.dart';
import 'package:frontend/src/qm/application/save/qm_save_state_notifier.dart';
import 'package:frontend/src/qm/domain/repositories/i_qm_repository.dart';
import 'package:frontend/src/qm/domain/usecases/fetch_qm_items.dart';
import 'package:frontend/src/qm/domain/usecases/save_qm_item.dart';
import 'package:frontend/src/qm/domain/usecases/save_qm_list.dart';
import 'package:frontend/src/qm/infrastructure/datasources/qm_service.dart';
import 'package:frontend/src/qm/infrastructure/datasources/remote/qm_remote_service.dart';
import 'package:frontend/src/qm/infrastructure/repositories/qm_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//! application
final qmStateNotifierProvider = StateNotifierProvider<QmStateNotifier, QmState>(
  (ref) => QmStateNotifier(
    auth: ref.watch(authChangeNotifierProvider),
    fetchQmItems: ref.watch(fetchQmItemsProvider),
  ),
);

final qmSaveStateNotifierProvider =
    StateNotifierProvider<QmSaveStateNotifier, QmSaveState>(
  (ref) => QmSaveStateNotifier(
    auth: ref.watch(authChangeNotifierProvider),
    saveQmItem: ref.watch(saveQmItemProvider),
    saveQmList: ref.watch(saveQmListProvider),
  ),
);

//! usecase
final fetchQmItemsProvider = Provider(
  (ref) => FetchQmItems(repository: ref.watch(qmRepositoryProvider)),
);

final saveQmItemProvider = Provider(
  (ref) => SaveQmItem(repository: ref.watch(qmRepositoryProvider)),
);

final saveQmListProvider = Provider(
  (ref) => SaveQmList(repository: ref.watch(qmRepositoryProvider)),
);

//! repository
final qmRepositoryProvider = Provider<IQmRepository>(
  (ref) => QmRepository(remote: ref.watch(qmRemoteServiceProvider)),
);

//! datasource
final qmRemoteServiceProvider = Provider<QmService>(
  (ref) => QmRemoteService(httpClient: ref.watch(dioProvider)),
);
