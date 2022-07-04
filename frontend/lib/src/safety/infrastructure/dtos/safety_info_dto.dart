import 'dart:convert';

import 'package:frontend/src/safety/domain/entities/safety_info.dart';

class SafetyInfoDto {
  const SafetyInfoDto({
    required this.plantNm,
    required this.equipCd,
    required this.equipNm,
    required this.type,
    required this.location,
  });

  /// PLANT_CD: 사업장 코드
  final String plantNm;

  /// EQUIP_CD: 장비 코드
  final String equipCd;

  /// EQUIP_NM: 장비 이름
  final String equipNm;

  /// EQUIP_TYPE_NM: 타입 이름
  final String type;

  /// EQUIP_LOC: 장비 위치
  final String location;

  factory SafetyInfoDto.fromDomain(SafetyInfo domain) {
    return SafetyInfoDto(
      plantNm: domain.plantNm,
      equipCd: domain.equipCd,
      equipNm: domain.equipNm,
      type: domain.type,
      location: domain.location,
    );
  }

  SafetyInfo toDomain() {
    return SafetyInfo(
      plantNm: plantNm,
      equipCd: equipCd,
      equipNm: equipNm,
      type: type,
      location: location,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SafetyInfoDto &&
        other.plantNm == plantNm &&
        other.equipCd == equipCd &&
        other.equipNm == equipNm &&
        other.type == type &&
        other.location == location;
  }

  @override
  int get hashCode {
    return plantNm.hashCode ^
        equipCd.hashCode ^
        equipNm.hashCode ^
        type.hashCode ^
        location.hashCode;
  }

  SafetyInfoDto copyWith({
    String? plantNm,
    String? equipCd,
    String? equipNm,
    String? type,
    String? location,
  }) {
    return SafetyInfoDto(
      plantNm: plantNm ?? this.plantNm,
      equipCd: equipCd ?? this.equipCd,
      equipNm: equipNm ?? this.equipNm,
      type: type ?? this.type,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'plantNm': plantNm,
      'equipCd': equipCd,
      'equipNm': equipNm,
      'type': type,
      'location': location,
    };
  }

  factory SafetyInfoDto.fromMap(Map<String, dynamic> map) {
    return SafetyInfoDto(
      plantNm: map['PLANT_CD'] ?? '',
      equipCd: map['EQUIP_CD'] ?? '',
      equipNm: map['EQUIP_NM'] ?? '',
      type: map['EQUIP_TYPE_NM'] ?? '',
      location: map['EQUIP_LOC'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SafetyInfoDto.fromJson(String source) =>
      SafetyInfoDto.fromMap(json.decode(source));
}
