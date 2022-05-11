import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/checklist/application/load/checklist_state.dart';
import 'package:frontend/src/checklist/application/load/checklist_state_notifier.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state_notifier.dart';
import 'package:frontend/src/checklist/domain/repositories/i_checklist_repository.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_checklist.dart';
import 'package:frontend/src/checklist/domain/usecases/save_checklist.dart';
import 'package:frontend/src/checklist/infrastructure/datasources/checklist_service.dart';
import 'package:frontend/src/checklist/infrastructure/datasources/remote/checklist_remote_service.dart';
import 'package:frontend/src/checklist/infrastructure/repositories/checklist_repository.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//! application
final checklistStateNotifierProvider =
    StateNotifierProvider<ChecklistStateNotifier, ChecklistState>(
  (ref) =>
      ChecklistStateNotifier(fetchChecklist: ref.watch(fetchChecklistProvider)),
);

final checklistSaveStateNotifierProvider =
    StateNotifierProvider<ChecklistSaveStateNotifier, ChecklistSaveState>(
  (ref) => ChecklistSaveStateNotifier(
    saveChecklist: ref.watch(saveChecklistProvider),
    authNotifier: ref.watch(authChangeNotifierProvider),
  ),
);

//! usecase
final fetchChecklistProvider = Provider(
  (ref) => FetchChecklist(
    repository: ref.watch(checklistRepositoryProvider),
  ),
);

final saveChecklistProvider = Provider(
  (ref) => SaveChecklist(
    repository: ref.watch(checklistRepositoryProvider),
  ),
);

//! repository
final checklistRepositoryProvider = Provider<IChecklistRepository>(
  (ref) => ChecklistRepository(
    remote: ref.watch(checklistRemoteProvider),
  ),
);

//! datasource
final checklistRemoteProvider = Provider<ChecklistService>(
  (ref) => ChecklistRemoteService(
    httpClient: ref.watch(dioProvider),
  ),
);
