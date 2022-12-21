import 'package:flutter/material.dart';
import 'package:frontend/src/cutting/presentation/cutting_screen.dart';
import 'package:frontend/src/impeller/presentation/screens/impeller_screen.dart';
import 'package:frontend/src/work_base/domain/entities/work_base_info.dart';
import 'package:frontend/src/workorder/presentation/screens/work_order_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final workBaseChangeNotifierProvider = ChangeNotifierProvider(
  (ref) => WorkBaseChangeNotifier(),
);

class WorkBaseChangeNotifier extends ChangeNotifier {
  List<WorkBaseInfo> items = [];

  WorkBaseInfo? _selectedWorkBaseInfo;

  WorkBaseInfo? get workBase => _selectedWorkBaseInfo;

  Widget page = const WorkOrderScreen();

  void setWorkBases(List<WorkBaseInfo> infos) {
    items = infos;
    notifyListeners();
  }

  void setCurrentBase(int index) {
    _selectedWorkBaseInfo = items[index];
    _setPage();
  }

  /// 공정 코드에 맞는 화면
  ///
  /// "타블렛 공정 처리 문의 V~.xlsx" 문서 참고
  void _setPage() {
    if (_selectedWorkBaseInfo!.wbCode == "FCT") {
      /// cutting 공정
      page = const CuttingScreen();
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FRL" ||
        _selectedWorkBaseInfo!.wbCode == "FFL" ||
        _selectedWorkBaseInfo!.wbCode == "FP3" ||
        _selectedWorkBaseInfo!.wbCode == "FMP") {
      /// 작업 시작/완료 동시에 처리할 수 있는 페이지
      page = WorkOrderScreen(
        key: ValueKey<String>(
            "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}"),
        canSaveBothStartAndEnd: true,
      );
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FIP") {
      // IMPELLER 화면 호출
      page = const ImpellerScreen();
      notifyListeners();
    } else {
      /// 나머지
      page = WorkOrderScreen(
        key: ValueKey<String>(
            "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}"),
      );
      notifyListeners();
    }
  }
}
