abstract class ICurrentWorkOrder {
  // PJTNo
  final String pjtNo;

  // PNDDate : PND
  final String pndDate;

  // WO_NB : 작업지시번호
  final String wonb;

  // Yard: YARD
  final String yard;

  // HullNo: Hull NO
  final String hullNo;

  // ship: 구역
  final String ship;

  // SYSNO: Sys No
  final String sysNo;

  // WC_NM : 제작업체
  final String wcNm;

  // WC_CD: (추론) 작업장 코드
  final String wcCd;

  // WB_NM: 공정 이름
  final String wbNm;

  /// WB_CD: (추론)공정 코드
  final String wbCd;

  const ICurrentWorkOrder({
    required this.pjtNo,
    required this.pndDate,
    required this.wonb,
    required this.yard,
    required this.hullNo,
    required this.ship,
    required this.sysNo,
    required this.wcNm,
    required this.wcCd,
    required this.wbNm,
    required this.wbCd,
  });
}
