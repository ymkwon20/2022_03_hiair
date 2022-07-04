import 'dart:convert';

import 'package:frontend/src/work_base/domain/entities/work_base_info.dart';

class WorkBaseInfoDto {
  final String wbCode;
  final String wbName;
  final String wcCode;
  final String wcName;

  const WorkBaseInfoDto({
    required this.wbCode,
    required this.wbName,
    required this.wcCode,
    required this.wcName,
  });

  factory WorkBaseInfoDto.fromDomain(WorkBaseInfo domain) {
    return WorkBaseInfoDto(
      wbCode: domain.wbCode,
      wbName: domain.wbName,
      wcCode: domain.wcCode,
      wcName: domain.wcName,
    );
  }

  WorkBaseInfo toDomain() {
    return WorkBaseInfo(
      wbCode: wbCode,
      wbName: wbName,
      wcCode: wcCode,
      wcName: wcName,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkBaseInfoDto &&
        other.wbCode == wbCode &&
        other.wbName == wbName &&
        other.wcCode == wcCode &&
        other.wcName == wcName;
  }

  @override
  int get hashCode {
    return wbCode.hashCode ^
        wbName.hashCode ^
        wcCode.hashCode ^
        wcName.hashCode;
  }

  WorkBaseInfoDto copyWith({
    String? wbCode,
    String? wbName,
    String? wcCode,
    String? wcName,
  }) {
    return WorkBaseInfoDto(
      wbCode: wbCode ?? this.wbCode,
      wbName: wbName ?? this.wbName,
      wcCode: wcCode ?? this.wcCode,
      wcName: wcName ?? this.wcName,
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
    return WorkBaseInfoDto(
      wbCode: map['WB_CD'] ?? '',
      wbName: map['WB_NM'] ?? '',
      wcCode: map['WC_CD'] ?? '',
      wcName: map['WC_NM'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkBaseInfoDto.fromJson(String source) =>
      WorkBaseInfoDto.fromMap(json.decode(source));
}
