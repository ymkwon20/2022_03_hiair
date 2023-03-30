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

  /// HullNo: Hull NO
  final String hullNo;

  /// REQ_QT: 요구 수량
  final int qty;

  /// SYSNO: Sys No
  final String sysNo;

  /// Yard: YARD
  final String yard;

  /// WB_CD: (추론)공정 코드
  final String wbCd;

  /// WB_NM: 공정 이름
  final String wbNm;

  /// WC_CD: (추론) 작업장 코드
  final String wcCd;

  //CHK_DIV
  final String chkDiv;

  // WO_NB : 작업지시번호
  final String wonb;

  // Spec : SPEC
  final String spec;

  // Size : SIZE
  final String size;

  // PNDDate : PND
  final String pndDate;

  // IronPlateThickness : 철판두계
  final String ironPlateThickness;

  // IronPlateWidth : 철판가로
  final String ironPlateWidth;

  // IronPlateHeight : 철판세로
  final String ironPlateHeight;

  // DoorLength : DOOR길이
  final String doorLength;

  // HolUpDown : 홀(상/하)
  final String hollUpDown;

  // RMK_DC : 비고
  final String rmkDC;

  // REQ_DT : 작업지시일
  final String reqDT;

  // CFM_DATE : 확정일
  final String cfmDate;

  // SwingType : Swing Type
  final int swingType;

  // SwingTypeNM : Swing Type NM
  final String swingTypeNM;

  // Frame : Frame
  final String frame;

  // Matefial : 재질
  final String material;

  // MotorColor : MotorColor
  final String motorColor;

  // ItemSpec : 제품규격
  final String itemSpec;

  // INSIDE : INSIDE
  final String inside;

  // InDomar : In도막
  final String inDomar;

  // OUTSIDE : OUTSIDE
  final String outside;

  // OutDomar : Out도막
  final String outDomar;

  // BEF_CLOSE_DT : 전공정실적일
  final String befCloseDT;

  // CHK_SCH_DT : FAT
  final String chkSchDT;

  // SHOT_DT : SHOT 검사일
  final String shotDT;

  // Weight : 중량
  final String weight;

  // MTR_OUT_DT : 모터불출일자
  final String mtrOutDT;

  // CustltemName : 거래처품명
  final String custltemName;

  // BladeAngle : ANGLE
  final String bladeAngle;

  // CHK_TBL_DT : 최종감사합격유무
  final String chkTblDT;

  // FanType : FANTYPE
  final String fanType;

  // RMK : 비고(수정)
  final String rmk;

  // TagNo : TAG.NO
  final String tagNo;

  // WORK_WC_NM : 제작업체
  final String workwcnm;

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
    required this.chkDiv,
    required this.wonb,
    required this.spec,
    required this.size,
    required this.pndDate,
    required this.ironPlateThickness,
    required this.ironPlateWidth,
    required this.ironPlateHeight,
    required this.doorLength,
    required this.hollUpDown,
    required this.rmkDC,
    required this.reqDT,
    required this.cfmDate,
    required this.swingType,
    required this.swingTypeNM,
    required this.frame,
    required this.material,
    required this.motorColor,
    required this.itemSpec,
    required this.inside,
    required this.inDomar,
    required this.outside,
    required this.outDomar,
    required this.befCloseDT,
    required this.chkSchDT,
    required this.shotDT,
    required this.weight,
    required this.mtrOutDT,
    required this.custltemName,
    required this.bladeAngle,
    required this.chkTblDT,
    required this.fanType,
    required this.rmk,
    required this.tagNo,
    required this.workwcnm,
  });
}
