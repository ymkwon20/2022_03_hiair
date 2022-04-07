/// cutting check sheet
class CuttingCheck {
  /// WO_NB : 작업지시
  final String workOrder;

  /// SPEC : 규격
  final String spec;

  /// SIZE : 사이즈
  final String size;

  /// PLAN_PND : 납기일자
  final String datePlanned;

  /// METAL_QTY : 원판수량
  final int qty;

  /// TIK : 제품두께
  final double thickness;

  /// WIH : 제품가로
  final double width;

  /// HIT : 제품세로
  final double height;

  /// DLEN : DOOR 길이
  final double doorLength;

  /// HUD : 홀(상/하)
  final String hullDiameter;

  /// YARD: 정보 없음
  final String yard;

  /// WB_CD: 정보 없음
  final String wbCd;

  /// SYSNO: 정보 없음
  final String sysNo;

  /// HULLNO: 정보 없음
  final String hullNo;

  const CuttingCheck({
    required this.workOrder,
    required this.spec,
    required this.size,
    required this.datePlanned,
    required this.qty,
    required this.thickness,
    required this.width,
    required this.height,
    required this.doorLength,
    required this.hullDiameter,
    required this.yard,
    required this.wbCd,
    required this.sysNo,
    required this.hullNo,
  });

  CuttingCheck copyWith({
    String? workOrder,
    String? spec,
    String? size,
    String? datePlanned,
    int? qty,
    double? thickness,
    double? width,
    double? height,
    double? doorLength,
    String? hullDiameter,
    String? yard,
    String? wbCd,
    String? sysNo,
    String? hullNo,
  }) {
    return CuttingCheck(
      workOrder: workOrder ?? this.workOrder,
      spec: spec ?? this.spec,
      size: size ?? this.size,
      datePlanned: datePlanned ?? this.datePlanned,
      qty: qty ?? this.qty,
      thickness: thickness ?? this.thickness,
      width: width ?? this.width,
      height: height ?? this.height,
      doorLength: doorLength ?? this.doorLength,
      hullDiameter: hullDiameter ?? this.hullDiameter,
      yard: yard ?? this.yard,
      wbCd: wbCd ?? this.wbCd,
      sysNo: sysNo ?? this.sysNo,
      hullNo: hullNo ?? this.hullNo,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CuttingCheck &&
        other.workOrder == workOrder &&
        other.spec == spec &&
        other.size == size &&
        other.datePlanned == datePlanned &&
        other.qty == qty &&
        other.thickness == thickness &&
        other.width == width &&
        other.height == height &&
        other.doorLength == doorLength &&
        other.hullDiameter == hullDiameter &&
        other.yard == yard &&
        other.wbCd == wbCd &&
        other.sysNo == sysNo &&
        other.hullNo == hullNo;
  }

  @override
  int get hashCode {
    return workOrder.hashCode ^
        spec.hashCode ^
        size.hashCode ^
        datePlanned.hashCode ^
        qty.hashCode ^
        thickness.hashCode ^
        width.hashCode ^
        height.hashCode ^
        doorLength.hashCode ^
        hullDiameter.hashCode ^
        yard.hashCode ^
        wbCd.hashCode ^
        sysNo.hashCode ^
        hullNo.hashCode;
  }
}
