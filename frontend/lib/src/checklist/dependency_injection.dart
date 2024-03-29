import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/checklist/application/load/checklist_state.dart';
import 'package:frontend/src/checklist/application/load/checklist_state_notifier.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state_notifier.dart';
import 'package:frontend/src/checklist/domain/repositories/i_checklist_repository.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_and_save_checklist.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_checkimagelist.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_checklist.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_checklist_activate.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_cut_checklist.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_impeller_checklist.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_workorder_checklist.dart';
import 'package:frontend/src/checklist/domain/usecases/save_checklist.dart';
import 'package:frontend/src/checklist/domain/usecases/save_imagelist.dart';
import 'package:frontend/src/checklist/infrastructure/datasources/checklist_service.dart';
import 'package:frontend/src/checklist/infrastructure/datasources/remote/checklist_remote_service.dart';
import 'package:frontend/src/checklist/infrastructure/repositories/checklist_repository.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/image/dependency_injection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//! application
final checklistStateNotifierProvider =
    StateNotifierProvider<ChecklistStateNotifier, ChecklistState>(
  (ref) => ChecklistStateNotifier(
    fetchChecklist: ref.watch(fetchChecklistProvider),
    fetchCutChecklist: ref.watch(fetchCutChecklistProvider),
    fetchCheckimagelist: ref.watch(fetchCheckimagelistProvider),
    fetchWorkOrderChecklist: ref.watch(fetchWorkOrderChecklistProvider),
    fetchChecklistActivate: ref.watch(fetchChecklistActivateProvider),
    fetchImpellerChecklist: ref.watch(fetchImpellerChecklistProvider),
  ),
);

final checklistSaveStateNotifierProvider =
    StateNotifierProvider<ChecklistSaveStateNotifier, ChecklistSaveState>(
  (ref) => ChecklistSaveStateNotifier(
    saveChecklist: ref.watch(saveChecklistProvider),
    saveImagelist: ref.watch(saveImagelistProvider),
    saveImages: ref.watch(saveImagesProvider),
    authNotifier: ref.watch(authChangeNotifierProvider),
  ),
);

//! usecase
final fetchChecklistProvider = Provider(
  (ref) => FetchChecklist(
    repository: ref.watch(checklistRepositoryProvider),
  ),
);

final fetchCutChecklistProvider = Provider(
  (ref) => FetchCutChecklist(
    repository: ref.watch(checklistRepositoryProvider),
  ),
);

final fetchCheckimagelistProvider = Provider(
  (ref) => FetchCheckimagelist(
    repository: ref.watch(checklistRepositoryProvider),
  ),
);

final fetchWorkOrderChecklistProvider = Provider(
  (ref) => FetchWorkOrderChecklist(
    repository: ref.watch(checklistRepositoryProvider),
  ),
);

final fetchImpellerChecklistProvider = Provider(
  (ref) => FetchImpellerChecklist(
    repository: ref.watch(checklistRepositoryProvider),
  ),
);

final fetchChecklistActivateProvider = Provider(
  (ref) => FetchChecklistActivate(
    repository: ref.watch(checklistRepositoryProvider),
  ),
);

final fetchAndSaveChecklistProvider = Provider(
  (ref) => FetchAndSaveChecklist(
    repository: ref.watch(checklistRepositoryProvider),
  ),
);

final saveChecklistProvider = Provider(
  (ref) => SaveChecklist(
    repository: ref.watch(checklistRepositoryProvider),
  ),
);

final saveImagelistProvider = Provider(
  (ref) => SaveImagelist(
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
