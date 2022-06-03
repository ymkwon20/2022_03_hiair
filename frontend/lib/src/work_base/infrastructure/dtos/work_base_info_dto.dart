import 'dart:convert';

import 'package:frontend/src/work_base/domain/entities/work_base_flag.dart';
import 'package:frontend/src/work_base/domain/entities/work_base_info.dart';

class WorkBaseInfoDto {
  final String wbCode;
  final String wbName;
  final String wcCode;
  final String wcName;
  final WorkBaseFlag flag;

  const WorkBaseInfoDto({
    required this.wbCode,
    required this.wbName,
    required this.wcCode,
    required this.wcName,
    required this.flag,
  });

  factory WorkBaseInfoDto.fromDomain(WorkBaseInfo domain) {
    return WorkBaseInfoDto(
      wbCode: domain.wbCode,
      wbName: domain.wbName,
      wcCode: domain.wcCode,
      wcName: domain.wcName,
      flag: domain.flag,
    );
  }

  WorkBaseInfo toDomain() {
    return WorkBaseInfo(
      wbCode: wbCode,
      wbName: wbName,
      wcCode: wcCode,
      wcName: wcName,
      flag: flag,
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
        other.flag == flag;
  }

  @override
  int get hashCode {
    return wbCode.hashCode ^
        wbName.hashCode ^
        wcCode.hashCode ^
        wcName.hashCode ^
        flag.hashCode;
  }

  WorkBaseInfoDto copyWith({
    String? wbCode,
    String? wbName,
    String? wcCode,
    String? wcName,
    WorkBaseFlag? flag,
  }) {
    return WorkBaseInfoDto(
      wbCode: wbCode ?? this.wbCode,
      wbName: wbName ?? this.wbName,
      wcCode: wcCode ?? this.wcCode,
      wcName: wcName ?? this.wcName,
      flag: flag ?? this.flag,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'wbCode': wbCode,
      'wbName': wbName,
      'wcCode': wcCode,
      'wcName': wcName,
    };
  }

  factory WorkBaseInfoDto.fromMap(Map<String, dynamic> map) {
    WorkBaseFlag flag;

    /// FNP: 품질 코드
    if (map['WB_CD'] == "FNP") {
      flag = WorkBaseFlag.quality;
    } else {
      flag = WorkBaseFlag.none;
    }

    return WorkBaseInfoDto(
      wbCode: map['WB_CD'] ?? '',
      wbName: map['WB_NM'] ?? '',
      wcCode: map['WC_CD'] ?? '',
      wcName: map['WC_NM'] ?? '',
      flag: flag,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkBaseInfoDto.fromJson(String source) =>
      WorkBaseInfoDto.fromMap(json.decode(source));
}
