import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/checklist/infrastructure/dtos/check_item_dto.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/application/save/checklist_save_event.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/domain/usecases/save_checklist.dart';

class ChecklistSaveStateNotifier extends StateNotifier<ChecklistSaveState> {
  ChecklistSaveStateNotifier({
    required SaveChecklist saveChecklist,
    required AuthChangeNotifier authNotifier,
  })  : _saveChecklist = saveChecklist,
        _authNotifier = authNotifier,
        super(const ChecklistSaveState.init());

  final SaveChecklist _saveChecklist;
  final AuthChangeNotifier _authNotifier;

  Future<void> mapEventToState(ChecklistSaveEvent event) async {
    event.when(
      saveChecklist: (items) async {
        state = const ChecklistSaveState.saving();
        final List<Map<String, dynamic>> parameterList = items.map((item) {
          final params = CheckItemDto.fromDomain(item).toMap();
          params["user-id"] = _authNotifier.user!.id;
          return params;
        }).toList();

        final resultsOrFailure = await _saveChecklist(parameterList);
        state = resultsOrFailure.fold(
          (l) => ChecklistSaveState.failure(mapFailureToString(l)),
          (r) => const ChecklistSaveState.saved(),
        );
      },
    );
  }
}
