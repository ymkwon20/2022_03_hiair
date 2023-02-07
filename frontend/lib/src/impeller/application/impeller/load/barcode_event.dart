import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/impeller/domain/entities/barcode.dart';
import 'package:frontend/src/impeller/domain/entities/impeller.dart';

part 'barcode_event.freezed.dart';

@freezed
class BarcodeEvent with _$BarcodeEvent {
  const BarcodeEvent._();
  const factory BarcodeEvent.getQRBarcode(Barcode barcode, Impeller impeller) =
      _GetQRBarcode;
}
