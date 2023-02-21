import 'package:flutter/material.dart';
import 'package:frontend/src/cutting/presentation/cutting_screen.dart';
import 'package:frontend/src/fay/presentation/screens/fay_screen.dart';
import 'package:frontend/src/fec/presentation/screens/fec_screen.dart';
import 'package:frontend/src/fel/presentation/screens/fel_screen.dart';
import 'package:frontend/src/ffa/presentation/screens/ffa_screen.dart';
import 'package:frontend/src/ffl/presentation/screens/ffl_screen.dart';
import 'package:frontend/src/fp2/presentation/screens/fp2_screen.dart';
import 'package:frontend/src/fp3/presentation/screens/fp3_screen.dart';
import 'package:frontend/src/fp4/presentation/screens/fp4_screen.dart';
import 'package:frontend/src/frl/presentation/screens/frl_screen.dart';
import 'package:frontend/src/fwp/presentation/screens/fwp_screen.dart';
import 'package:frontend/src/impeller/presentation/screens/impeller_screen.dart';
import 'package:frontend/src/impeller/presentation/screens/impeller_single_screen.dart';
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
    } else if (_selectedWorkBaseInfo!.wbCode == "FMP") {
      /// 작업 시작/완료 동시에 처리할 수 있는 페이지
      page = WorkOrderScreen(
        key: ValueKey<String>(
          "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
        ),
        canSaveBothStartAndEnd: true,
      );
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FIP") {
      // IMPELLER 화면 호출
      if (_selectedWorkBaseInfo!.wbName == "IMPELLER 제작") {
        page = ImpellerScreen(
          key: ValueKey<String>(
            "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
          ),
        );
        notifyListeners();
      } else if (_selectedWorkBaseInfo!.wbName == "IMPELLER 단품") {
        page = ImpellerSingleScreen(
          key: ValueKey<String>(
            "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
          ),
        );
        notifyListeners();
      }
    } else if (_selectedWorkBaseInfo!.wbCode == "FWP") {
      // 취부/용접 화면 호출
      page = FWPScreen(
        key: ValueKey<String>(
          "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
        ),
      );
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FEC") {
      // 명판/마무리 화면 호출
      page = FECScreen(
        key: ValueKey<String>(
          "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
        ),
      );
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FP2") {
      // FINAL PAINTING 화면 호출
      page = FP2Screen(
        key: ValueKey<String>(
          "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
        ),
      );
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FFA") {
      // 최종조립 화면 호출
      page = FFAScreen(
        key: ValueKey<String>(
          "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
        ),
      );
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FP3") {
      // SHOT 화면 호출
      page = FP3Screen(
        key: ValueKey<String>(
          "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
        ),
        canSaveBothStartAndEnd: true,
      );
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FP4") {
      // 하도 화면 호출
      page = FP4Screen(
        key: ValueKey<String>(
          "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
        ),
      );
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FAY") {
      // 조립 화면 호출
      page = FAYScreen(
        key: ValueKey<String>(
          "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
        ),
      );
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FEL") {
      // 결선 화면 호출
      page = FELScreen(
        key: ValueKey<String>(
          "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
        ),
      );
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FFL") {
      // FLANGING 화면 호출
      page = FFLScreen(
        key: ValueKey<String>(
          "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
        ),
        canSaveBothStartAndEnd: true,
      );
      notifyListeners();
    } else if (_selectedWorkBaseInfo!.wbCode == "FRL") {
      // ROLLING 화면 호출
      page = FRLScreen(
        key: ValueKey<String>(
          "${_selectedWorkBaseInfo!.wbCode}-${DateTime.now().millisecond}",
        ),
        canSaveBothStartAndEnd: true,
      );
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
