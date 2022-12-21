import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/impeller/domain/entities/impeller.dart';

part 'impeller_state.freezed.dart';

@freezed
class ImpellerState with _$ImpellerState {
  const ImpellerState._();
  const factory ImpellerState.initial(List<Impeller> items) = _Initial;
  const factory ImpellerState.loading(List<Impeller> items, int itemsPerPage) =
      _Loading;
  const factory ImpellerState.loaded(
      List<Impeller> items, bool isNextPageAvailable) = _Loaded;
  const factory ImpellerState.failure(List<Impeller> items, String message) =
      _Failure;
}
