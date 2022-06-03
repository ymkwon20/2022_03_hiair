import 'dart:convert';

import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';

/// cutting check sheet
class CuttingCheckDTO {
  /// WO_NB : 작업지시
  final String workOrder;

  /// SPEC : 규격
  final String spec;

  /// SIZE : 사이즈
  final String size;

  /// PLAN_PND : 납기일자
  final String datePlanned;

  /// METAL_QTY : 원판수량
  final int qty;

  /// TIK : 제품두께
  final double thickness;

  /// WIH : 제품가로
  final double width;

  /// HIT : 제품세로
  final double height;

  /// DLEN : DOOR 길이
  final double doorLength;

  /// HUD : 홀(상/하)
  final String hullDiameter;

  /// YARD: 정보 없음
  final String yard;

  /// WB_CD: 정보 없음
  final String wbCd;

  /// WC_CD: 정보 없음
  final String wcCd;

  /// PRODPLANSEQ: 정보 없음
  final String seq;

  /// SYSNO: 정보 없음
  final String sysNo;

  /// HULLNO: 정보 없음
  final String hullNo;

  const CuttingCheckDTO({
    required this.workOrder,
    required this.spec,
    required this.size,
    required this.datePlanned,
    required this.qty,
    required this.thickness,
    required this.width,
    required this.height,
    required this.doorLength,
    required this.hullDiameter,
    required this.yard,
    required this.wbCd,
    required this.wcCd,
    required this.seq,
    required this.sysNo,
    required this.hullNo,
  });

  factory CuttingCheckDTO.fromDomain(CuttingCheck domain) {
    return CuttingCheckDTO(
      workOrder: domain.workOrder,
      spec: domain.spec,
      size: domain.size,
      datePlanned: domain.datePlanned,
      qty: domain.qty,
      thickness: domain.thickness,
      width: domain.width,
      height: domain.height,
      doorLength: domain.doorLength,
      hullDiameter: domain.hullDiameter,
      yard: domain.yard,
      wbCd: domain.wbCd,
      wcCd: domain.wcCd,
      seq: domain.seq,
      sysNo: domain.sysNo,
      hullNo: domain.hullNo,
    );
  }

  CuttingCheck toDomain() {
    return CuttingCheck(
      workOrder: workOrder,
      spec: spec,
      size: size,
      datePlanned: datePlanned,
      qty: qty,
      thickness: thickness,
      width: width,
      height: height,
      doorLength: doorLength,
      hullDiameter: hullDiameter,
      yard: yard,
      wbCd: wbCd,
      wcCd: wcCd,
      seq: seq,
      sysNo: sysNo,
      hullNo: hullNo,
    );
  }

  CuttingCheckDTO copyWith({
    String? workOrder,
    String? spec,
    String? size,
    String? datePlanned,
    int? qty,
    double? thickness,
    double? width,
    double? height,
    double? doorLength,
    String? hullDiameter,
    String? yard,
    String? wbCd,
    String? wcCd,
    String? seq,
    String? sysNo,
    String? hullNo,
  }) {
    return CuttingCheckDTO(
      workOrder: workOrder ?? this.workOrder,
      spec: spec ?? this.spec,
      size: size ?? this.size,
      datePlanned: datePlanned ?? this.datePlanned,
      qty: qty ?? this.qty,
      thickness: thickness ?? this.thickness,
      width: width ?? this.width,
      height: height ?? this.height,
      doorLength: doorLength ?? this.doorLength,
      hullDiameter: hullDiameter ?? this.hullDiameter,
      yard: yard ?? this.yard,
      wbCd: wbCd ?? this.wbCd,
      wcCd: wcCd ?? this.wcCd,
      seq: seq ?? this.seq,
      sysNo: sysNo ?? this.sysNo,
      hullNo: hullNo ?? this.hullNo,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CuttingCheckDTO &&
        other.workOrder == workOrder &&
        other.spec == spec &&
        other.size == size &&
        other.datePlanned == datePlanned &&
        other.qty == qty &&
        other.thickness == thickness &&
        other.width == width &&
        other.height == height &&
        other.doorLength == doorLength &&
        other.hullDiameter == hullDiameter &&
        other.yard == yard &&
        other.wbCd == wbCd &&
        other.wcCd == wcCd &&
        other.seq == seq &&
        other.sysNo == sysNo &&
        other.hullNo == hullNo;
  }

  @override
  int get hashCode {
    return workOrder.hashCode ^
        spec.hashCode ^
        size.hashCode ^
        datePlanned.hashCode ^
        qty.hashCode ^
        thickness.hashCode ^
        width.hashCode ^
        height.hashCode ^
        doorLength.hashCode ^
        hullDiameter.hashCode ^
        yard.hashCode ^
        wbCd.hashCode ^
        wcCd.hashCode ^
        seq.hashCode ^
        sysNo.hashCode ^
        hullNo.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'workOrder': workOrder,
      'spec': spec,
      'size': size,
      'datePlaned': datePlanned,
      'qty': qty,
      'thickness': thickness,
      'width': width,
      'height': height,
      'doorLength': doorLength,
      'hollDiameter': hullDiameter,
      'yard': yard,
      'wbCd': wbCd,
      'sysNo': sysNo,
      'hullNo': hullNo,
    };
  }

  factory CuttingCheckDTO.fromMap(Map<String, dynamic> map) {
    return CuttingCheckDTO(
      workOrder: map['WO_NB'] ?? '',
      spec: map['SPEC'] ?? '',
      size: map['SIZE'] ?? '',
      datePlanned: map['PLAN_PND'] ?? '',
      qty: map['QTY']?.toInt() ?? 0,
      thickness: map['TIK']?.toDouble() ?? 0.0,
      width: map['WIH']?.toDouble() ?? 0.0,
      height: map['HIT']?.toDouble() ?? 0.0,
      doorLength: map['DLEN']?.toDouble() ?? 0.0,
      hullDiameter: map['HUD'] ?? '',
      yard: map['YARD'] ?? '',
      wbCd: map['WB_CD'] ?? '',
      wcCd: map['WC_CD'] ?? '',
      seq: map['PRODPLANSEQ'].toString(),
      sysNo: map['SYSNO'] ?? '',
      hullNo: map['HULLNO'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CuttingCheckDTO.fromJson(String source) =>
      CuttingCheckDTO.fromMap(json.decode(source));
}
