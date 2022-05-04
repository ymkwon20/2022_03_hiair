import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/qm/application/save/qm_save_event.dart';
import 'package:frontend/src/qm/application/save/qm_save_state.dart';
import 'package:frontend/src/qm/domain/usecases/save_qm_item.dart';
import 'package:frontend/src/qm/domain/usecases/save_qm_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/qm_item.dart';

class QmSaveStateNotifier extends StateNotifier<QmSaveState> {
  QmSaveStateNotifier({
    required SaveQmItem saveQmItem,
    required SaveQmList saveQmList,
    required AuthChangeNotifier auth,
  })  : _saveQmItem = saveQmItem,
        _saveQmList = saveQmList,
        _auth = auth,
        super(const QmSaveState.none());

  final SaveQmItem _saveQmItem;
  final SaveQmList _saveQmList;
  final AuthChangeNotifier _auth;

  Future<void> mapEventToState(QmSaveEvent event) async {
    event.when(
      saveQmItem: _processSaveQmItem,
      saveQmList: _processSaveQmList,
      resetToNone: () => state = const QmSaveState.none(),
    );
  }

  Future<void> _processSaveQmItem(
      QmItem item, QmStatus status, int index) async {
    state = const QmSaveState.saving();

    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());

    /// DB procedure parameter를 보낼 때,
    /// 다음과 같은 규칙의 문자로 보내게 되어 있음
    ///
    /// W: 대기
    /// S: 투입
    /// E: 종료
    late String qmStatus;
    switch (status) {
      case QmStatus.start:
        qmStatus = "S";
        break;
      case QmStatus.end:
        qmStatus = "E";
        break;
    }

    final params = {
      "plan-seq": item.planSeq.toString(),
      "wo-nb": item.workOrder,
      "wb-cd": _auth.user!.wbCd,
      "prod-gb": qmStatus,
      "date": date,
      "qty": item.qty.toString(),
    };

    final resultsOrFailure = await _saveQmItem(params);
    state = resultsOrFailure.fold(
      (l) => QmSaveState.failure(mapFailureToString(l)),
      (r) => QmSaveState.oneSaved(index, date, status),
    );
  }

  Future<void> _processSaveQmList(
      List<QmItem> list, QmStatus status, List<int> indice) async {
    state = const QmSaveState.saving();

    /// _processSaveQmItem(_,__,___) 참고
    late String qmStatus;
    switch (status) {
      case QmStatus.start:
        qmStatus = "S";
        break;
      case QmStatus.end:
        qmStatus = "E";
        break;
    }

    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());

    final params = <Map<String, dynamic>>[];

    for (final item in list) {
      final mapData = {
        "plan-seq": item.planSeq.toString(),
        "wo-nb": item.workOrder,
        "wb-cd": _auth.user!.wbCd,
        "prod-gb": qmStatus,
        "date": date,
        "qty": item.qty.toString(),
      };
      params.add(mapData);
    }

    final resultsOrFailure = await _saveQmList(params);
    state = resultsOrFailure.fold(
      (l) => QmSaveState.failure(mapFailureToString(l)),
      (r) => QmSaveState.multipleSaved(indice, date, status),
    );
  }
}
