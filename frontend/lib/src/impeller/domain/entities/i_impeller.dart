abstract class IImpeller {
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

  // BLD_ANGLE:
  final String bldAngle;

  // SHAFT:
  final String shaft;

  // RMK:
  final String rmk;

  // FAN_TYPE:
  final String fanType;

  // CHK_DIV
  final String chkDiv;

  final String qrString;

  // PART_NO: 품목코드
  final String partNo;

  // BLADETYPE: BLADE TYPE
  final String bldType;

  // BLLADE_QTY: BLADE수량
  final String bldQTY;

  // SPEC: 규격
  final String spec;

  const IImpeller({
    required this.code,
    required this.planSeq,
    required this.date,
    required this.wcCd,
    required this.wbNm,
    required this.wbCd,
    required this.yard,
    required this.hullNo,
    required this.ship,
    required this.sysNo,
    required this.itemNo,
    required this.bldAngle,
    required this.shaft,
    required this.rmk,
    required this.qty,
    required this.fanType,
    required this.chkDiv,
    required this.qrString,
    required this.partNo,
    required this.bldType,
    required this.bldQTY,
    required this.spec,
  });
}
