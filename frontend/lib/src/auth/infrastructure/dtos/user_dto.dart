import 'dart:convert';

import 'package:frontend/src/auth/domain/entities/user.dart';
import 'package:frontend/src/auth/domain/entities/user_type.dart';

class UserDTO {
  /// 사용자 id
  final String id;

  /// 사용자 이름
  final String name;

  /// 공정 코드
  final String wbCd;

  /// 공정 코드
  final String wcCd;

  /// 부서 코드
  final String deptCd;

  /// 부서 이름
  final String deptNm;

  /// 권한
  final UserType type;

  /// 현 공정 조회 버튼 권한
  final String btnGrant;

  const UserDTO({
    required this.id,
    required this.name,
    required this.wbCd,
    required this.wcCd,
    required this.deptCd,
    required this.deptNm,
    required this.type,
    required this.btnGrant,
  });

  factory UserDTO.fromDomain(User domain) {
    return UserDTO(
      id: domain.id,
      name: domain.name,
      wbCd: domain.wbCd,
      wcCd: domain.wcCd,
      deptCd: domain.deptCd,
      deptNm: domain.deptNm,
      type: domain.type,
      btnGrant: domain.btnGrant,
    );
  }

  User toDomain() {
    return User(
      id: id,
      name: name,
      wbCd: wbCd,
      wcCd: wcCd,
      deptCd: deptCd,
      deptNm: deptNm,
      type: type,
      btnGrant: btnGrant,
    );
  }

  UserDTO copyWith({
    String? id,
    String? name,
    String? wbCd,
    String? wcCd,
    String? deptCd,
    String? deptNm,
    UserType? type,
    String? btnGrant,
  }) {
    return UserDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      wbCd: wbCd ?? this.wbCd,
      wcCd: wcCd ?? this.wcCd,
      deptCd: deptCd ?? this.deptCd,
      deptNm: deptNm ?? this.deptNm,
      type: type ?? this.type,
      btnGrant: btnGrant ?? this.btnGrant,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'USER_ID': id,
      'USER_NM': name,
      'WB_CD': wbCd,
      'WC_CD': wcCd,
      'DEPT_CD': deptCd,
      'DEPARTMENT_NAME': deptNm,
      'BTN_GRANT': btnGrant,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    final wcCd = map['WC_CD'] ?? '';

    UserType type;
    if (wcCd == "") {
      type = UserType.admin;
    } else {
      type = UserType.worker;
    }

    return UserDTO(
      type: type,
      id: map['USER_ID'] ?? '',
      name: map['USER_NM'] ?? '',
      wbCd: map['WB_CD'] ?? '',
      wcCd: wcCd,
      deptCd: map['DEPT_CD'] ?? '',
      deptNm: map['DEPARTMENT_NAME'] ?? '',
      btnGrant: map['BTN_GRANT'] ?? '',
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
        other.deptNm == deptNm &&
        other.btnGrant == btnGrant;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        wbCd.hashCode ^
        deptCd.hashCode ^
        deptNm.hashCode ^
        btnGrant.hashCode;
  }
}
