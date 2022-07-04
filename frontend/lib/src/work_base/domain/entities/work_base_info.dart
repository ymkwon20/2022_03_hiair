class WorkBaseInfo {
  final String wbCode;
  final String wbName;
  final String wcCode;
  final String wcName;

  const WorkBaseInfo({
    required this.wbCode,
    required this.wbName,
    required this.wcCode,
    required this.wcName,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkBaseInfo &&
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

  WorkBaseInfo copyWith({
    String? wbCode,
    String? wbName,
    String? wcCode,
    String? wcName,
  }) {
    return WorkBaseInfo(
      wbCode: wbCode ?? this.wbCode,
      wbName: wbName ?? this.wbName,
      wcCode: wcCode ?? this.wcCode,
      wcName: wcName ?? this.wcName,
    );
  }
}
