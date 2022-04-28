import 'dart:convert';

import 'package:frontend/src/auth/domain/entities/user.dart';

class UserDTO {
  /// 사용자 id
  final String id;

  /// 사용자 이름
  final String name;

  /// 공정 코드
  final String wbCd;

  /// 부서 코드
  final String deptCd;

  /// 부서 이름
  final String deptNm;

  const UserDTO({
    required this.id,
    required this.name,
    required this.wbCd,
    required this.deptCd,
    required this.deptNm,
  });

  factory UserDTO.fromDomain(User domain) {
    return UserDTO(
      id: domain.id,
      name: domain.name,
      wbCd: domain.wbCd,
      deptCd: domain.deptCd,
      deptNm: domain.deptNm,
    );
  }

  User toDomain() {
    return User(
      id: id,
      name: name,
      wbCd: wbCd,
      deptCd: deptCd,
      deptNm: deptNm,
    );
  }

  UserDTO copyWith({
    String? id,
    String? name,
    String? wbCd,
    String? deptCd,
    String? deptNm,
  }) {
    return UserDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      wbCd: wbCd ?? this.wbCd,
      deptCd: deptCd ?? this.deptCd,
      deptNm: deptNm ?? this.deptNm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'USER_ID': id,
      'USER_NM': name,
      'WB_CD': wbCd,
      'DEPT_CD': deptCd,
      'DEPARTMENT_NAME': deptNm,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      id: map['USER_ID'] ?? '',
      name: map['USER_NM'] ?? '',
      wbCd: map['WB_CD'] ?? '',
      deptCd: map['DEPT_CD'] ?? '',
      deptNm: map['DEPARTMENT_NAME'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDTO.fromJson(String source) =>
      UserDTO.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDTO &&
        other.id == id &&
        other.name == name &&
        other.wbCd == wbCd &&
        other.deptCd == deptCd &&
        other.deptNm == deptNm;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        wbCd.hashCode ^
        deptCd.hashCode ^
        deptNm.hashCode;
  }
}
