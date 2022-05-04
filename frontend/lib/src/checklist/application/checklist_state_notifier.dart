import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/application/checklist_event.dart';
import 'package:frontend/src/checklist/application/checklist_state.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_checklist.dart';

class ChecklistStateNotifier extends StateNotifier<ChecklistState> {
  ChecklistStateNotifier({
    required FetchChecklist fetchChecklist,
  })  : _fetchChecklist = fetchChecklist,
        super(const ChecklistState.initial());

  final FetchChecklist _fetchChecklist;

  Future<void> mapEventToState(ChecklistEvent event) async {
    event.when(
      fetchChecklist: (params) async {
        state = const ChecklistState.loading();

        final failureOrResults = await _fetchChecklist(params);
        state = failureOrResults.fold(
          (l) => ChecklistState.failure(mapFailureToString(l)),
          (r) => ChecklistState.loaded(r),
        );
      },
    );
  }
}
