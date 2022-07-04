import 'dart:convert';

import 'package:frontend/src/safety/domain/entities/safety_check.dart';

class SafetyCheckDto {
  /// EQUIP_CHECK_CD: 점검개소 코드
  final String checkCd;

  /// EQUIP_CHECK: 점검개소
  final String checkNm;

  /// CHECK_STD_CD: 점검기준 코드
  final String checkStandardCd;

  /// CHECK_STD: 점검기준
  final String checkStandardNm;

  /// CHECK_CYCLE: 주기
  final String checkCycle;

  // DATA: 데이터
  final String data;

  final String remark;

  const SafetyCheckDto({
    required this.checkCd,
    required this.checkNm,
    required this.checkStandardCd,
    required this.checkStandardNm,
    required this.checkCycle,
    required this.data,
    required this.remark,
  });

  factory SafetyCheckDto.fromDomain(SafetyCheck domain) {
    return SafetyCheckDto(
      checkCd: domain.checkCd,
      checkNm: domain.checkNm,
      checkStandardCd: domain.checkStandardCd,
      checkStandardNm: domain.checkStandardNm,
      checkCycle: domain.checkCycle,
      data: domain.data,
      remark: domain.remark,
    );
  }

  SafetyCheck toDomain() {
    return SafetyCheck(
      checkCd: checkCd,
      checkNm: checkNm,
      checkStandardCd: checkStandardCd,
      checkStandardNm: checkStandardNm,
      checkCycle: checkCycle,
      data: data,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SafetyCheckDto &&
        other.checkCd == checkCd &&
        other.checkNm == checkNm &&
        other.checkStandardCd == checkStandardCd &&
        other.checkStandardNm == checkStandardNm &&
        other.checkCycle == checkCycle &&
        other.data == data &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    return checkCd.hashCode ^
        checkNm.hashCode ^
        checkStandardCd.hashCode ^
        checkStandardNm.hashCode ^
        checkCycle.hashCode ^
        data.hashCode ^
        remark.hashCode;
  }

  SafetyCheckDto copyWith({
    String? checkCd,
    String? checkNm,
    String? checkStandardCd,
    String? checkStandardNm,
    String? checkCycle,
    String? data,
    String? remark,
  }) {
    return SafetyCheckDto(
      checkCd: checkCd ?? this.checkCd,
      checkNm: checkNm ?? this.checkNm,
      checkStandardCd: checkStandardCd ?? this.checkStandardCd,
      checkStandardNm: checkStandardNm ?? this.checkStandardNm,
      checkCycle: checkCycle ?? this.checkCycle,
      data: data ?? this.data,
      remark: remark ?? this.remark,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'equip-check': checkCd,
      'equip-check-nm': checkNm,
      'standard': checkStandardCd,
      'standard-nm': checkStandardNm,
      'cycle': checkCycle,
      'value': data,
      'remark': remark,
    };
  }

  factory SafetyCheckDto.fromMap(Map<String, dynamic> map) {
    return SafetyCheckDto(
      checkCd: map['EQUIP_CHECK_CD'] ?? '',
      checkNm: map['EQUIP_CHECK'] ?? '',
      checkStandardCd: map['CHECK_STD_CD'] ?? '',
      checkStandardNm: map['CHECK_STD'] ?? '',
      checkCycle: map['CHECK_CYCLE'] ?? '',
      data: map['DATA'] ?? '',
      remark: map['REMARK'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SafetyCheckDto.fromJson(String source) =>
      SafetyCheckDto.fromMap(json.decode(source));
}
