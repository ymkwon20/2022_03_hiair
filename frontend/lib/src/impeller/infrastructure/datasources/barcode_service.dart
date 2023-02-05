import 'package:frontend/src/impeller/infrastructure/dtos/qrbarcode_dto.dart';

abstract class BarcodeService {
  Future<QRBarcodeDto> getQRCode(Map<String, dynamic> params);
}
