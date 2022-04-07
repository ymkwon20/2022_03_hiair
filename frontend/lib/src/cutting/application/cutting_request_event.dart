import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';

part 'cutting_request_event.freezed.dart';

@freezed
class CuttingRequestEvent with _$CuttingRequestEvent {
  const CuttingRequestEvent._();
  const factory CuttingRequestEvent.fetchRequest(CuttingSerial serial) =
      _FetchRequest;
}
