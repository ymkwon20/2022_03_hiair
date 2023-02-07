import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/impeller/domain/entities/barcode.dart';

part 'barcode_state.freezed.dart';

@freezed
class BarcodeState with _$BarcodeState {
  const BarcodeState._();
  const factory BarcodeState.initial(Barcode barcode) = _Initial;
  const factory BarcodeState.loading(Barcode barcode) = _Loading;
  const factory BarcodeState.loaded(Barcode barcode) = _Loaded;
  const factory BarcodeState.failure(Barcode barcode, String meessage) =
      _Failure;
}
