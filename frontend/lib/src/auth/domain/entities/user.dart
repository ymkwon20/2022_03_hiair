import 'package:frontend/src/auth/domain/entities/user_type.dart';

class User {
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

  final UserType type;

  final String btnGrant;

  const User({
    required this.id,
    required this.name,
    required this.wbCd,
    required this.wcCd,
    required this.deptCd,
    required this.deptNm,
    required this.type,
    required this.btnGrant,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.wbCd == wbCd &&
        other.wcCd == wcCd &&
        other.deptCd == deptCd &&
        other.deptNm == deptNm &&
        other.type == type &&
        other.btnGrant == btnGrant;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        wbCd.hashCode ^
        wcCd.hashCode ^
        deptCd.hashCode ^
        deptNm.hashCode ^
        type.hashCode ^
        btnGrant.hashCode;
  }

  User copyWith({
    String? id,
    String? name,
    String? wbCd,
    String? wcCd,
    String? deptCd,
    String? deptNm,
    UserType? type,
    String? btnGrant,
  }) {
    return User(
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
}
