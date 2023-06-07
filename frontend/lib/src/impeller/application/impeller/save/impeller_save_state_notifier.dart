import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_and_save_checklist.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_event.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_state.dart';
import 'package:frontend/src/impeller/domain/entities/impeller.dart';
import 'package:frontend/src/impeller/domain/usecases/save_impeller.dart';
import 'package:frontend/src/impeller/domain/usecases/save_impeller_list.dart';
import 'package:frontend/src/impeller/domain/usecases/start_cancel_impeller.dart';
import 'package:frontend/src/impeller/domain/usecases/start_cancel_impeller_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ImpellerSaveStateNotifier extends StateNotifier<ImpellerSaveState> {
  ImpellerSaveStateNotifier({
    required SaveImpeller saveImpeller,
    required SaveImpellerList saveImpellerList,
    required StartCancelImpeller startCancelImpeller,
    required StartCancelImpellerList startCancelImpellerList,
    required FetchAndSaveChecklist fetchAndSaveChecklist,
    required AuthChangeNotifier authNotifier,
  })  : _saveImpeller = saveImpeller,
        _saveImpellerList = saveImpellerList,
        _startCancelImpeller = startCancelImpeller,
        _startCancelImpellerList = startCancelImpellerList,
        _fetchAndSaveChecklist = fetchAndSaveChecklist,
        _authNotifier = authNotifier,
        super(const ImpellerSaveState.none());

  final SaveImpeller _saveImpeller;
  final SaveImpellerList _saveImpellerList;
  final StartCancelImpeller _startCancelImpeller;
  final StartCancelImpellerList _startCancelImpellerList;
  final FetchAndSaveChecklist _fetchAndSaveChecklist;
  final AuthChangeNotifier _authNotifier;

  Future<void> mapEventToState(ImpellerSaveEvent event) async {
    event.when(
      saveImpeller: _processSaveImpeller,
      saveImpellerList: _processSaveImpellerList,
      resetToNone: () => state = const ImpellerSaveState.none(),
    );
  }

  Future<void> _processSaveImpeller(
      Impeller item, ImpellerSaveStatus status, int index) async {
    state = const ImpellerSaveState.saving();

    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());

    /// DB procedure parameter를 보낼 때,
    /// 다음과 같은 규칙의 문자로 보내게 되어 있음
    ///
    /// W: 대기
    /// S: 투입
    /// E: 종료
    late String qmStatus;
    switch (status) {
      case ImpellerSaveStatus.start:
        qmStatus = "S";
        break;
      case ImpellerSaveStatus.end:
        qmStatus = "E";
        break;
      case ImpellerSaveStatus.all:
        qmStatus = "A";
        break;
      case ImpellerSaveStatus.startCancel:
        qmStatus = "SC";
        break;
    }

    if (qmStatus == "SC") {
      final params = {
        "plan-seq": item.planSeq.toString(),
        "wo-nb": item.code,
        "wc-cd": item.wcCd,
        "wb-cd": item.wbCd,
      };

      final resultsOrFailure = await _startCancelImpeller(params);
      state = resultsOrFailure.fold(
        (l) => ImpellerSaveState.failure(mapFailureToString(l)),
        (r) => ImpellerSaveState.oneSaved(index, date, status),
      );
    } else {
      final params = {
        "plan-seq": item.planSeq.toString(),
        "wo-nb": item.code,
        "wb-cd": item.wbCd,
        "wc-cd": item.wcCd,
        "prod-gb": qmStatus,
        "date": date,
        "bldAngle": item.bldAngle,
        "shaft": item.shaft,
        "rmk": item.rmk,
        "qty": item.qty.toString(),
        "user-id": _authNotifier.user!.id,
      };

      final resultsOrFailure = await _saveImpeller(params);
      state = resultsOrFailure.fold(
        (l) => ImpellerSaveState.failure(mapFailureToString(l)),
        (r) => ImpellerSaveState.oneSaved(index, date, status),
      );
    }
  }

  Future<void> _processSaveImpellerList(
      List<Impeller> list, ImpellerSaveStatus status, List<int> indice) async {
    state = const ImpellerSaveState.saving();

    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());

    late String qmStatus;
    switch (status) {
      case ImpellerSaveStatus.start:
        qmStatus = "S";
        break;
      case ImpellerSaveStatus.end:
        qmStatus = "E";
        break;
      case ImpellerSaveStatus.all:
        qmStatus = "A";
        break;
      case ImpellerSaveStatus.startCancel:
        qmStatus = "SC";
        break;
    }

    if (qmStatus == "SC") {
      final params = <Map<String, dynamic>>[];
    } else {
      final params = <Map<String, dynamic>>[];

      var isSuccess = false;
      for (final item in list) {
        final mapData = {
          "plan-seq": item.planSeq.toString(),
          "wo-nb": item.code,
          "wb-cd": item.wbCd,
          "wc-cd": item.wcCd,
          "prod-gb": qmStatus,
          "date": date,
          "page-cd": "",
          "user-id": _authNotifier.user!.id,
          "bldAngle": item.bldAngle,
          "shaft": item.shaft,
          "rmk": item.rmk,
          "qty": item.qty.toString(),
        };

        switch (status) {
          case ImpellerSaveStatus.start:
            isSuccess = true;
            break;
          default:
            final failureOrSuccess = await _fetchAndSaveChecklist(mapData);

            failureOrSuccess.fold(
              (l) {
                state = ImpellerSaveState.failure(mapFailureToString(l));
                isSuccess = false;
              },
              (r) {
                isSuccess = true;
              },
            );
            break;
        }

        if (!isSuccess) {
          break;
        } else {
          params.add(mapData);
        }
      }

      if (isSuccess) {
        final resultsOrFailure = await _saveImpellerList(params);
        state = resultsOrFailure.fold(
          (l) => ImpellerSaveState.failure(mapFailureToString(l)),
          (r) => ImpellerSaveState.multipleSaved(indice, date, status),
        );
      }
    }
  }
}
