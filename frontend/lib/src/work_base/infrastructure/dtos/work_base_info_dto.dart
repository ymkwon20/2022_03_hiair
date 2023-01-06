import 'dart:convert';

import 'package:frontend/src/work_base/domain/entities/work_base_info.dart';

class WorkBaseInfoDto {
  final String wbCode;
  final String wbName;
  final String wcCode;
  final String wcName;
  final String legChk;

  const WorkBaseInfoDto({
    required this.wbCode,
    required this.wbName,
    required this.wcCode,
    required this.wcName,
    required this.legChk,
  });

  factory WorkBaseInfoDto.fromDomain(WorkBaseInfo domain) {
    return WorkBaseInfoDto(
      wbCode: domain.wbCode,
      wbName: domain.wbName,
      wcCode: domain.wcCode,
      wcName: domain.wcName,
      legChk: domain.legChk,
    );
  }

  WorkBaseInfo toDomain() {
    return WorkBaseInfo(
      wbCode: wbCode,
      wbName: wbName,
      wcCode: wcCode,
      wcName: wcName,
      legChk: legChk,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkBaseInfoDto &&
        other.wbCode == wbCode &&
        other.wbName == wbName &&
        other.wcCode == wcCode &&
        other.wcName == wcName &&
        other.legChk == legChk;
  }

  @override
  int get hashCode {
    return wbCode.hashCode ^
        wbName.hashCode ^
        wcCode.hashCode ^
        wcName.hashCode ^
        legChk.hashCode;
  }

  WorkBaseInfoDto copyWith({
    String? wbCode,
    String? wbName,
    String? wcCode,
    String? wcName,
    String? legChk,
  }) {
    return WorkBaseInfoDto(
      wbCode: wbCode ?? this.wbCode,
      wbName: wbName ?? this.wbName,
      wcCode: wcCode ?? this.wcCode,
      wcName: wcName ?? this.wcName,
      legChk: legChk ?? this.legChk,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'wbCode': wbCode,
      'wbName': wbName,
      'wcCode': wcCode,
      'wcName': wcName,
      'legChk': legChk,
    };
  }

  factory WorkBaseInfoDto.fromMap(Map<String, dynamic> map) {
    return WorkBaseInfoDto(
      wbCode: map['WB_CD'] ?? '',
      wbName: map['WB_NM'] ?? '',
      wcCode: map['WC_CD'] ?? '',
      wcName: map['WC_NM'] ?? '',
      legChk: map['LEG_CHK'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkBaseInfoDto.fromJson(String source) =>
      WorkBaseInfoDto.fromMap(json.decode(source));
}
