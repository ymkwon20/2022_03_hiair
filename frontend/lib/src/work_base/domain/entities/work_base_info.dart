class WorkBaseInfo {
  final String wbCode;
  final String wbName;
  final String wcCode;
  final String wcName;
  final String legChk;

  const WorkBaseInfo({
    required this.wbCode,
    required this.wbName,
    required this.wcCode,
    required this.wcName,
    required this.legChk,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkBaseInfo &&
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

  WorkBaseInfo copyWith({
    String? wbCode,
    String? wbName,
    String? wcCode,
    String? wcName,
    String? legChk,
  }) {
    return WorkBaseInfo(
      wbCode: wbCode ?? this.wbCode,
      wbName: wbName ?? this.wbName,
      wcCode: wcCode ?? this.wcCode,
      wcName: wcName ?? this.wcName,
      legChk: legChk ?? this.legChk,
    );
  }
}
