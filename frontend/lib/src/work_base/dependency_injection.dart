import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/work_base/application/work_base_state.dart';
import 'package:frontend/src/work_base/application/work_base_state_notifier.dart';
import 'package:frontend/src/work_base/domain/repositories/i_work_base_repository.dart';
import 'package:frontend/src/work_base/domain/usecase/fetch_work_bases.dart';
import 'package:frontend/src/work_base/infrastructure/datasources/remote/work_base_remote_service.dart';
import 'package:frontend/src/work_base/infrastructure/datasources/work_base_service.dart';
import 'package:frontend/src/work_base/infrastructure/repositories/work_base_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//! application
final workBaseStateNotifierProvider =
    StateNotifierProvider<WorkBaseStateNotifier, WorkBaseState>(
  (ref) => WorkBaseStateNotifier(
      auth: ref.watch(authChangeNotifierProvider),
      fetchWorkBases: ref.watch(fetchWorkBasesProvider)),
);

//! usecase
final fetchWorkBasesProvider = Provider(
  (ref) => FetchWorkBases(repository: ref.watch(workBaseRepositoryProvider)),
);

//! repository
final workBaseRepositoryProvider = Provider<IWorkBaseRepository>(
  (ref) => WorkBaseRepository(remote: ref.watch(workBaseRemoteServiceProvider)),
);

//! datasource
final workBaseRemoteServiceProvider = Provider<WorkBaseService>(
  (ref) => WorkBaseRemoteService(httpClient: ref.watch(dioProvider)),
);
