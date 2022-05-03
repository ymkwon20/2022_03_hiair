import 'package:frontend/src/cutting/domain/entities/cutting_check_result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cuttingCheckResultNotifier =
    StateNotifierProvider<CuttingCheckResultNotifier, CuttingCheckResult>(
  (ref) => CuttingCheckResultNotifier(),
);

class CuttingCheckResultNotifier extends StateNotifier<CuttingCheckResult> {
  CuttingCheckResultNotifier()
      : super(
          const CuttingCheckResult(
            width: 0,
            height: 0,
            thickness: 0,
            angle: 0,
            workId: "",
            equipCd: "",
            lot: "",
            remark: "",
            userId: "",
          ),
        );

  void editState(CuttingCheckResult check) {
    state = check;
  }
}
