import 'dart:convert';

import 'package:frontend/src/fct/domain/entities/fct.dart';

class FctDto {
  /// METAL_DATE: 날짜
  final String date;

  /// METAL: 내용 없음
  final String metal;

  /// METAL_CODE: 원판 품번
  final String code;

  /// CUR_QTY: 절단 수량
  final int cutQty;

  /// ORG_QTY: 원판 수량
  final int panQty;

  /// THICKNESS: 두께
  final double thickness;

  /// WIDTH: 너비
  final double width;

  /// LENGTH: 길이
  final double length;

  /// METAL_DATE: 날짜
  final int seq;

  /// OUT_RMK: 비고
  final String remark;

  /// WB_CD: 공정코드
  final String wbCd;

  const FctDto({
    required this.date,
    required this.metal,
    required this.code,
    required this.cutQty,
    required this.panQty,
    required this.thickness,
    required this.width,
    required this.length,
    required this.seq,
    required this.remark,
    required this.wbCd,
  });

  factory FctDto.fromDomain(Fct domain) {
    return FctDto(
      date: domain.date,
      metal: domain.metal,
      code: domain.code,
      cutQty: domain.cutQty,
      panQty: domain.panQty,
      thickness: domain.thickness,
      width: domain.width,
      length: domain.length,
      seq: domain.seq,
      remark: domain.remark,
      wbCd: domain.wbCd,
    );
  }

  Fct toDomain() {
    return Fct(
      date: date,
      metal: metal,
      code: code,
      cutQty: cutQty,
      panQty: panQty,
      thickness: thickness,
      width: width,
      length: length,
      seq: seq,
      remark: remark,
      wbCd: wbCd,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FctDto &&
        other.date == date &&
        other.metal == metal &&
        other.code == code &&
        other.cutQty == cutQty &&
        other.panQty == panQty &&
        other.thickness == thickness &&
        other.width == width &&
        other.length == length &&
        other.seq == seq &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        metal.hashCode ^
        code.hashCode ^
        cutQty.hashCode ^
        panQty.hashCode ^
        thickness.hashCode ^
        width.hashCode ^
        length.hashCode ^
        seq.hashCode ^
        remark.hashCode;
  }

  FctDto copyWith({
    String? date,
    String? metal,
    String? code,
    int? cutQty,
    int? panQty,
    double? thickness,
    double? width,
    double? length,
    int? seq,
    String? remark,
    String? wbCd,
  }) {
    return FctDto(
      date: date ?? this.date,
      metal: metal ?? this.metal,
      code: code ?? this.code,
      cutQty: cutQty ?? this.cutQty,
      panQty: panQty ?? this.panQty,
      thickness: thickness ?? this.thickness,
      width: width ?? this.width,
      length: length ?? this.length,
      seq: seq ?? this.seq,
      remark: remark ?? this.remark,
      wbCd: wbCd ?? this.wbCd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'METAL_DATE': date,
      'METAL': metal,
      'METAL_CODE': code,
      'CUT_QTY': cutQty,
      'ORG_QTY': panQty,
      'THICKNESS': thickness,
      'WIDTH': width,
      'LENGTH': length,
      'METAL_SEQ': seq,
      'OUT_RMK': remark,
      'WB_CD': wbCd,
    };
  }

  factory FctDto.fromMap(Map<String, dynamic> map) {
    return FctDto(
      date: map['METAL_DATE'] ?? '',
      metal: map['METAL'] ?? '',
      code: map['METAL_CODE'] ?? '',
      cutQty: map['CUT_QTY']?.toInt() ?? 0,
      panQty: map['ORG_QTY']?.toInt() ?? 0,
      thickness: map['THICKNESS']?.toDouble() ?? 0.0,
      width: map['WIDTH']?.toDouble() ?? 0.0,
      length: map['LENGTH']?.toDouble() ?? 0.0,
      seq: map['METAL_SEQ']?.toInt() ?? 0,
      remark: map['OUT_RMK'] ?? '',
      wbCd: map['WB_CD'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FctDto.fromJson(String source) => FctDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FctDto(date: $date, metal: $metal, code: $code, cutQty: $cutQty, panQty: $panQty, thickness: $thickness, width: $width, length: $length, seq: $seq, remark: $remark)';
  }
}
