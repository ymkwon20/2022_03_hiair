import 'package:frontend/src/impeller/domain/entities/i_barcode.dart';

class Barcode extends IBarcode {
  const Barcode({
    required String qrBarcodeString,
  }) : super(
          qrBarcodeString: qrBarcodeString,
        );
}
