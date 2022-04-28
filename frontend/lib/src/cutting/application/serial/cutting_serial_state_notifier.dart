import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/cutting/application/serial/cutting_serial_event.dart';
import 'package:frontend/src/cutting/application/serial/cutting_serial_state.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/cutting/domain/usecases/fetch_cuttings.dart';

class CuttingSerialStateNotifier extends StateNotifier<CuttingSerialState> {
  CuttingSerialStateNotifier({
    required FetchCuttings fetchCuttings,
  })  : _fetchCuttings = fetchCuttings,
        super(const CuttingSerialState.initial());

  final FetchCuttings _fetchCuttings;

  Future<void> mapEventToState(CuttingSerialEvent event) async {
    event.when(
      getSerials: () async {
        state = const CuttingSerialState.loading();
        final failureOrResult = await _fetchCuttings();
        state = failureOrResult.fold(
          (Failure l) => CuttingSerialState.failure(mapFailureToString(l)),
          (List<CuttingSerial> r) => CuttingSerialState.loaded(r),
        );
      },
    );
  }
}
