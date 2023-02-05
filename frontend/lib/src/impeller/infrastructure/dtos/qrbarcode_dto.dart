import 'dart:convert';

import 'package:frontend/src/impeller/domain/entities/barcode.dart';

class QRBarcodeDto extends Barcode {
  const QRBarcodeDto({
    required String qrBarcodeString,
  }) : super(
          qrBarcodeString: qrBarcodeString,
        );

  factory QRBarcodeDto.fromDomain(Barcode domain) {
    return QRBarcodeDto(
      qrBarcodeString: domain.qrBarcodeString,
    );
  }

  Barcode toDomain() {
    return Barcode(
      qrBarcodeString: qrBarcodeString,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'QRBarcode': qrBarcodeString,
    };
  }

  factory QRBarcodeDto.fromMap(Map<String, dynamic> map) {
    return QRBarcodeDto(
      qrBarcodeString: map["QR_BAR"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory QRBarcodeDto.fromJson(String source) =>
      QRBarcodeDto.fromMap(json.decode(source));

  QRBarcodeDto copyWith({
    String? qrBarcodeString,
  }) {
    return QRBarcodeDto(
      qrBarcodeString: qrBarcodeString ?? this.qrBarcodeString,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QRBarcodeDto && other.qrBarcodeString == qrBarcodeString;
  }

  @override
  int get hashCode {
    return qrBarcodeString.hashCode;
  }
}
