class CuttingCheckResult {
  final double width;
  final double height;
  final double thickness;
  final double angle;
  final String workId;
  final String equipCd;
  final String lot;
  final String remark;
  final String userId;

  const CuttingCheckResult({
    required this.width,
    required this.height,
    required this.thickness,
    required this.angle,
    required this.workId,
    required this.equipCd,
    required this.lot,
    required this.remark,
    required this.userId,
  });

  factory CuttingCheckResult.none() {
    return const CuttingCheckResult(
      width: 0,
      height: 0,
      thickness: 0,
      angle: 0,
      workId: "",
      equipCd: "",
      lot: "",
      remark: "",
      userId: "",
    );
  }

  CuttingCheckResult copyWith({
    double? width,
    double? height,
    double? thickness,
    double? angle,
    String? workId,
    String? equipCd,
    String? lot,
    String? remark,
    String? userId,
  }) {
    return CuttingCheckResult(
      width: width ?? this.width,
      height: height ?? this.height,
      thickness: thickness ?? this.thickness,
      angle: angle ?? this.angle,
      workId: workId ?? this.workId,
      equipCd: equipCd ?? this.equipCd,
      lot: lot ?? this.lot,
      remark: remark ?? this.remark,
      userId: userId ?? this.userId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CuttingCheckResult &&
        other.width == width &&
        other.height == height &&
        other.thickness == thickness &&
        other.angle == angle &&
        other.workId == workId &&
        other.equipCd == equipCd &&
        other.lot == lot &&
        other.remark == remark &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return width.hashCode ^
        height.hashCode ^
        thickness.hashCode ^
        angle.hashCode ^
        workId.hashCode ^
        equipCd.hashCode ^
        lot.hashCode ^
        remark.hashCode ^
        userId.hashCode;
  }
}
