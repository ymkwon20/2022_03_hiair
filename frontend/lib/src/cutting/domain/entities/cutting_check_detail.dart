/// Cutting 요청서 양식
class CuttingCheckDetail {
  ///  METAL_CODE : 원판품번
  final String metalCd;

  ///  THICKNESS : 원판두께
  final double thickness;

  ///  WIDTH : 원판폭
  final double width;

  ///  LENGTH : 원판길이
  final double length;

  ///  CAM_NO : 파일번호
  final String camNo;

  ///  METAL_QTY : 원판수량
  final int qty;

  ///  METAL_REM_YN :  잔재여부
  final String metalRemNm;

  const CuttingCheckDetail({
    required this.metalCd,
    required this.thickness,
    required this.width,
    required this.length,
    required this.camNo,
    required this.qty,
    required this.metalRemNm,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CuttingCheckDetail &&
        other.metalCd == metalCd &&
        other.thickness == thickness &&
        other.width == width &&
        other.length == length &&
        other.camNo == camNo &&
        other.qty == qty &&
        other.metalRemNm == metalRemNm;
  }

  @override
  int get hashCode {
    return metalCd.hashCode ^
        thickness.hashCode ^
        width.hashCode ^
        length.hashCode ^
        camNo.hashCode ^
        qty.hashCode ^
        metalRemNm.hashCode;
  }

  CuttingCheckDetail copyWith({
    String? metalCd,
    double? thickness,
    double? width,
    double? length,
    String? camNo,
    int? qty,
    String? metalRemNm,
    String? imageFileNm,
  }) {
    return CuttingCheckDetail(
      metalCd: metalCd ?? this.metalCd,
      thickness: thickness ?? this.thickness,
      width: width ?? this.width,
      length: length ?? this.length,
      camNo: camNo ?? this.camNo,
      qty: qty ?? this.qty,
      metalRemNm: metalRemNm ?? this.metalRemNm,
    );
  }
}
