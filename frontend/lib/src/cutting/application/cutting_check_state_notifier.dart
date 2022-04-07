import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/cutting/application/cutting_check_event.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/cutting/application/cutting_check_state.dart';
import 'package:frontend/src/cutting/domain/usecases/fetch_cutting_checks.dart';

class CuttingCheckStateNotifier extends StateNotifier<CuttingCheckState> {
  CuttingCheckStateNotifier({required FetchCuttingChecks fetchChecks})
      : _fetchChecks = fetchChecks,
        super(const CuttingCheckState.initial());

  final FetchCuttingChecks _fetchChecks;

  Future<void> mapEventToState(CuttingCheckEvent event) async {
    event.when(
      fetchChecks: (CuttingSerial serial) async {
        state = const CuttingCheckState.loading();
        final failureOrResults = await _fetchChecks(serial);
        state = failureOrResults.fold(
          (Failure l) => CuttingCheckState.failure(mapFailureToString(l)),
          (List<CuttingCheck> r) => CuttingCheckState.loaded(r),
        );
      },
    );
  }
}
