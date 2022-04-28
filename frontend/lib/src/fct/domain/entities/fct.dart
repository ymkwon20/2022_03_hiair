class Fct {
  /// METAL_DATE: 날짜
  final String date;

  /// METAL: 내용 없음
  final String metal;

  /// METAL_CODE: 원판 품번
  final String code;

  /// CUR_QTY: 절단 수량
  final int cutQty;

  /// ORG_QTY: 원판 수량
  final int panQty;

  /// THICKNESS: 두께
  final double thickness;

  /// WIDTH: 너비
  final double width;

  /// LENGTH: 길이
  final double length;

  /// METAL_DATE: 날짜
  final int seq;

  /// OUT_RMK: 비고
  final String remark;

  /// WB_CD: 공정코드
  final String wbCd;

  const Fct({
    required this.date,
    required this.metal,
    required this.code,
    required this.cutQty,
    required this.panQty,
    required this.thickness,
    required this.width,
    required this.length,
    required this.seq,
    required this.remark,
    required this.wbCd,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Fct &&
        other.date == date &&
        other.metal == metal &&
        other.code == code &&
        other.cutQty == cutQty &&
        other.panQty == panQty &&
        other.thickness == thickness &&
        other.width == width &&
        other.length == length &&
        other.seq == seq &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        metal.hashCode ^
        code.hashCode ^
        cutQty.hashCode ^
        panQty.hashCode ^
        thickness.hashCode ^
        width.hashCode ^
        length.hashCode ^
        seq.hashCode ^
        remark.hashCode;
  }

  Fct copyWith({
    String? date,
    String? metal,
    String? code,
    int? cutQty,
    int? panQty,
    double? thickness,
    double? width,
    double? length,
    int? seq,
    String? remark,
    String? wbCd,
  }) {
    return Fct(
      date: date ?? this.date,
      metal: metal ?? this.metal,
      code: code ?? this.code,
      cutQty: cutQty ?? this.cutQty,
      panQty: panQty ?? this.panQty,
      thickness: thickness ?? this.thickness,
      width: width ?? this.width,
      length: length ?? this.length,
      seq: seq ?? this.seq,
      remark: remark ?? this.remark,
      wbCd: wbCd ?? this.wbCd,
    );
  }
}
