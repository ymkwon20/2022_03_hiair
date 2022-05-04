import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check_detail.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';
import 'package:frontend/src/cutting/domain/usecases/fetch_cutting_requests.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cutting_request_event.dart';
import 'cutting_request_state.dart';

class CuttingRequestStateNotifier extends StateNotifier<CuttingRequestState> {
  CuttingRequestStateNotifier(
      {required FetchCuttingRequests fetchCuttingRequests})
      : _fetchCuttingRequests = fetchCuttingRequests,
        super(const CuttingRequestState.initial());

  final FetchCuttingRequests _fetchCuttingRequests;

  Future<void> mapEventToState(CuttingRequestEvent event) async {
    event.when(
      fetchRequest: (CuttingSerial serial) async {
        state = const CuttingRequestState.loading();
        final failureOrResults = await _fetchCuttingRequests(serial);
        state = failureOrResults.fold(
          (Failure l) => CuttingRequestState.failure(mapFailureToString(l)),
          (List<CuttingCheckDetail> r) => CuttingRequestState.loaded(r),
        );
      },
    );
  }
}
