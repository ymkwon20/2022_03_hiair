import 'dart:convert';

import 'package:frontend/src/cutting/domain/entities/cutting_check_detail.dart';

/// Cutting 요청서 양식
class CuttingCheckDetailDTO {
  ///  METAL_CODE : 원판품번
  final String metalCd;

  ///  THICKNESS : 원판두께
  final double thickness;

  ///  WIDTH : 원판폭
  final double width;

  ///  LENGTH : 원판길이
  final double length;

  ///  CAM_NO : 파일번호
  final String camNo;

  ///  METAL_QTY : 원판수량
  final int qty;

  ///  METAL_REM_YN :  잔재여부
  final String metalRemNm;

  ///  ORG1_FN : 파일명
  // final String originalFileNm;

  const CuttingCheckDetailDTO({
    required this.metalCd,
    required this.thickness,
    required this.width,
    required this.length,
    required this.camNo,
    required this.qty,
    required this.metalRemNm,
  });

  factory CuttingCheckDetailDTO.fromDomain(CuttingCheckDetail domain) {
    return CuttingCheckDetailDTO(
      metalCd: domain.metalCd,
      thickness: domain.thickness,
      width: domain.width,
      length: domain.length,
      camNo: domain.camNo,
      qty: domain.qty,
      metalRemNm: domain.metalRemNm,
    );
  }

  CuttingCheckDetail toDomain() {
    return CuttingCheckDetail(
      metalCd: metalCd,
      thickness: thickness,
      width: width,
      length: length,
      camNo: camNo,
      qty: qty,
      metalRemNm: metalRemNm,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CuttingCheckDetailDTO &&
        other.metalCd == metalCd &&
        other.thickness == thickness &&
        other.width == width &&
        other.length == length &&
        other.camNo == camNo &&
        other.qty == qty &&
        other.metalRemNm == metalRemNm;
  }

  @override
  int get hashCode {
    return metalCd.hashCode ^
        thickness.hashCode ^
        width.hashCode ^
        length.hashCode ^
        camNo.hashCode ^
        qty.hashCode ^
        metalRemNm.hashCode;
  }

  CuttingCheckDetailDTO copyWith({
    String? metalCd,
    double? thickness,
    double? width,
    double? length,
    String? camNo,
    int? qty,
    String? metalRemNm,
  }) {
    return CuttingCheckDetailDTO(
      metalCd: metalCd ?? this.metalCd,
      thickness: thickness ?? this.thickness,
      width: width ?? this.width,
      length: length ?? this.length,
      camNo: camNo ?? this.camNo,
      qty: qty ?? this.qty,
      metalRemNm: metalRemNm ?? this.metalRemNm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'METAL_CODE': metalCd,
      'THICKNESS': thickness,
      'WIDTH': width,
      'LENGTH': length,
      'CAM_NO': camNo,
      'METAL_QTY': qty,
      'METAL_REM_YN': metalRemNm,
    };
  }

  factory CuttingCheckDetailDTO.fromMap(Map<String, dynamic> map) {
    return CuttingCheckDetailDTO(
      metalCd: map['METAL_CODE'] ?? '',
      thickness: map['THICKNESS']?.toDouble() ?? 0.0,
      width: map['WIDTH']?.toDouble() ?? 0.0,
      length: map['LENGTH']?.toDouble() ?? 0.0,
      camNo: map['CAM_NO'] ?? '',
      qty: map['METAL_QTY']?.toInt() ?? 0,
      metalRemNm: map['METAL_REM_YN'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CuttingCheckDetailDTO.fromJson(String source) =>
      CuttingCheckDetailDTO.fromMap(json.decode(source));
}
