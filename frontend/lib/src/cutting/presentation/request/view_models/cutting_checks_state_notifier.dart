import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

late StateNotifierProvider<CuttingChecks, List<CuttingCheck>>
    cuttingChecksProvider;

class CuttingChecks extends StateNotifier<List<CuttingCheck>> {
  CuttingChecks(List<CuttingCheck> checks) : super(checks);

  void edit(CuttingCheck check) {
    // TODO: 저장 이후에 바꿀지 말지 확인해보고 바꾸기
    state = state.map(
      (item) {
        if (item == check) {
          return check.copyWith(
            workOrder: "TestTest",
          );
        } else {
          return item;
        }
      },
    ).toList();
  }
}
