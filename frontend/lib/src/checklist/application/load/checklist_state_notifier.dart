import 'package:frontend/src/checklist/application/load/checklist_event.dart';
import 'package:frontend/src/checklist/application/load/checklist_state.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_checkimagelist.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_checklist_activate.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_cut_checklist.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_workorder_checklist.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/domain/usecases/fetch_checklist.dart';

class ChecklistStateNotifier extends StateNotifier<ChecklistState> {
  ChecklistStateNotifier({
    required FetchChecklist fetchChecklist,
    required FetchCutChecklist fetchCutChecklist,
    required FetchCheckimagelist fetchCheckimagelist,
    required FetchWorkOrderChecklist fetchWorkOrderChecklist,
    required FetchChecklistActivate fetchChecklistActivate,
  })  : _fetchChecklist = fetchChecklist,
        _fetchCutChecklist = fetchCutChecklist,
        _fetchCheckimagelist = fetchCheckimagelist,
        _fetchWorkOrderChecklist = fetchWorkOrderChecklist,
        _fetchChecklistActivate = fetchChecklistActivate,
        super(const ChecklistState.initial());

  final FetchChecklist _fetchChecklist;
  final FetchCutChecklist _fetchCutChecklist;
  final FetchCheckimagelist _fetchCheckimagelist;
  final FetchWorkOrderChecklist _fetchWorkOrderChecklist;
  final FetchChecklistActivate _fetchChecklistActivate;

  Future<void> mapEventToState(ChecklistEvent event) async {
    event.when(
      fetchChecklist: (order, code) async {
        state = const ChecklistState.loading();

        //! 관리자 요청으로 hard-coded parameter(wb-cd, wc-cd) 넘김

        final params = {
          "plan-seq": order.planSeq,
          "wo-nb": order.code,
          "wb-cd": "QML",
          "wc-cd": "999",
          "page-cd": code,
        };

        final failureOrResults = await _fetchChecklist(params);
        state = failureOrResults.fold(
          (l) => ChecklistState.failure(mapFailureToString(l)),
          (r) => ChecklistState.loaded(r),
        );
      },
      clear: () {
        state = const ChecklistState.initial();
      },
      fetchChecklistForCut: (order) async {
        state = const ChecklistState.loading();

        final params = {
          "plan-seq": order.seq,
          "wo-nb": order.workOrder,
          "wb-cd": order.wbCd,
          "wc-cd": order.wcCd,
        };

        final failureOrResults = await _fetchCutChecklist(params);
        state = failureOrResults.fold(
          (l) => ChecklistState.failure(mapFailureToString(l)),
          (r) => ChecklistState.loaded(r),
        );
      },
      fetchChecklistForWorkOrder: (order) async {
        state = const ChecklistState.loading();

        final params = {
          "plan-seq": order.planSeq,
          "wo-nb": order.code,
          "wb-cd": order.wbCd,
          "wc-cd": order.wcCd,
        };

        final failureOrResults = await _fetchWorkOrderChecklist(params);
        state = failureOrResults.fold(
          (l) => ChecklistState.failure(mapFailureToString(l)),
          (r) => ChecklistState.loaded(r),
        );
      },
      fetchCheckimagelist: (order) async {
        state = const ChecklistState.loading();

        final params = {
          "plan-seq": order.planSeq,
          "wo-nb": order.code,
          "wb-cd": "QML",
          "wc-cd": "999",
        };

        final failureOrResults = await _fetchCheckimagelist(params);
        state = failureOrResults.fold(
          (l) => ChecklistState.failure(mapFailureToString(l)),
          (r) => ChecklistState.imageLoaded(r),
        );
      },
      fetchChecklistActivate: (order) async {
        state = const ChecklistState.loading();

        final params = {
          "wb-cd": order.wbCd,
        };

        final failureOrResults = await _fetchChecklistActivate(params);
        state = failureOrResults.fold(
          (l) => ChecklistState.failure(mapFailureToString(l)),
          (r) => ChecklistState.loaded(r),
        );
      },
    );
  }
}
