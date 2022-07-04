abstract class IWorkOrder {
  /// WO_NB: 작업지시번호
  final String code;

  /// ITEMNO: 품번
  final String itemNo;

  /// CHK_ET_DT: 검사완료일
  final String date;

  /// ship: 구역
  final String ship;

  /// PRODPLANSEQ: 생산계획 id
  final int planSeq;

  /// HullNo: 정보 없음
  final String hullNo;

  /// REQ_QT: 요구 수량
  final int qty;

  /// SYSNO: 내용 없음
  final String sysNo;

  /// Yard: 내용 없음
  final String yard;

  /// WB_CD: (추론)공정 코드
  final String wbCd;

  /// WB_NM: 공정 이름
  final String wbNm;

  /// WC_CD: (추론) 작업장 코드
  final String wcCd;

  const IWorkOrder({
    required this.code,
    required this.itemNo,
    required this.date,
    required this.ship,
    required this.planSeq,
    required this.hullNo,
    required this.qty,
    required this.sysNo,
    required this.yard,
    required this.wbCd,
    required this.wbNm,
    required this.wcCd,
  });
}
