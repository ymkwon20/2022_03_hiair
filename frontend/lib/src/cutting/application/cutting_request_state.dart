import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_request.dart';

part 'cutting_request_state.freezed.dart';

@freezed
class CuttingRequestState with _$CuttingRequestState {
  const CuttingRequestState._();
  const factory CuttingRequestState.initial() = _Initial;
  const factory CuttingRequestState.loading() = _Loadinig;
  const factory CuttingRequestState.loaded(List<CuttingRequest> requests) =
      _Loaded;
  const factory CuttingRequestState.failure(String message) = _Failure;
}
