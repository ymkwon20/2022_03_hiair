class User {
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

  const User({
    required this.id,
    required this.name,
    required this.wbCd,
    required this.deptCd,
    required this.deptNm,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
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

  User copyWith({
    String? id,
    String? name,
    String? wbCd,
    String? deptCd,
    String? deptNm,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      wbCd: wbCd ?? this.wbCd,
      deptCd: deptCd ?? this.deptCd,
      deptNm: deptNm ?? this.deptNm,
    );
  }
}
