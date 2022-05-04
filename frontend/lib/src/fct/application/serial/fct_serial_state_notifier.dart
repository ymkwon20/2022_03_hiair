import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/fct/application/serial/fct_serial_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/fct/application/serial/fct_serial_state.dart';
import 'package:frontend/src/fct/domain/usecases/get_fct_serials.dart';

class FctSerialStateNotifier extends StateNotifier<FctSerailState> {
  FctSerialStateNotifier({
    required GetFctSerials getFctSerials,
  })  : _getFctSerials = getFctSerials,
        super(const FctSerailState.init());

  final GetFctSerials _getFctSerials;

  Future<void> mapEventToState(FctSerialEvent event) async {
    event.when(
      getFctSerials: () async {
        state = const FctSerailState.loading();

        final failureOrSuccess = await _getFctSerials();
        state = failureOrSuccess.fold(
          (l) => FctSerailState.failure(mapFailureToString(l)),
          (r) => FctSerailState.loaded(r),
        );
      },
    );
  }
}
