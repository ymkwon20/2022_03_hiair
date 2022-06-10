import 'package:frontend/src/workorder/domain/entities/work_order_status.dart';

class WorkOrder {
  /// WO_NB: 작업지시번호
  final String code;

  /// ItemNo: 품번
  final String itemNo;

  /// PND: 납기일자
  final String datePlanned;

  /// CLOSE_ST: 작업시작일
  final String dateStart;

  /// CLOSE_DT: 작업완료일
  final String dateEnd;

  /// BEF_CLOSE_DT: 이전 작업 완료일
  final String dateEndBefore;

  /// ship: 구역
  final String ship;

  /// PRODPLANSEQ: 생산계획 id
  final int planSeq;

  /// 작업 상태
  ///
  /// 3: 대기 / 4: 투입 / 8: 종료 /
  /// final String prodGb;

  /// HullNo: 정보 없음
  final String hullNo;

  /// REQ_QT: 요구 수량
  final int qty;

  /// SysNo: 내용 없음
  final String sysNo;

  // Yard: 내용 없음
  final String yard;

  /// WB_CD: (추론)공정 코드
  final String wbCd;

  /// WB_NM: 공정 이름
  final String wbNm;

  /// WC_CD: (추론) 작업장 코드
  final String wcCd;

  /// 공정 진행 상태
  final WorkOrderStatus status;

  const WorkOrder({
    required this.code,
    required this.itemNo,
    required this.datePlanned,
    required this.dateStart,
    required this.dateEnd,
    required this.dateEndBefore,
    required this.ship,
    required this.planSeq,
    required this.hullNo,
    required this.qty,
    required this.sysNo,
    required this.yard,
    required this.wbCd,
    required this.wbNm,
    required this.wcCd,
    required this.status,
  });

  String? getProp(String key) => <String, String>{
        "wbNm": wbNm,
        "yard": yard,
        "hullNo": hullNo,
        "ship": ship,
        "sysNo": sysNo,
        "itemNo": itemNo,
      }[key];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkOrder &&
        other.code == code &&
        other.itemNo == itemNo &&
        other.datePlanned == datePlanned &&
        other.dateStart == dateStart &&
        other.dateEnd == dateEnd &&
        other.dateEndBefore == dateEndBefore &&
        other.ship == ship &&
        other.planSeq == planSeq &&
        other.hullNo == hullNo &&
        other.qty == qty &&
        other.sysNo == sysNo &&
        other.yard == yard &&
        other.wbCd == wbCd &&
        other.wbNm == wbNm &&
        other.wcCd == wcCd &&
        other.status == status;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        itemNo.hashCode ^
        datePlanned.hashCode ^
        dateStart.hashCode ^
        dateEnd.hashCode ^
        dateEndBefore.hashCode ^
        ship.hashCode ^
        planSeq.hashCode ^
        hullNo.hashCode ^
        qty.hashCode ^
        sysNo.hashCode ^
        yard.hashCode ^
        wbCd.hashCode ^
        wbNm.hashCode ^
        wcCd.hashCode ^
        status.hashCode;
  }

  WorkOrder copyWith({
    String? code,
    String? itemNo,
    String? datePlanned,
    String? dateStart,
    String? dateEnd,
    String? dateEndBefore,
    String? ship,
    int? planSeq,
    String? hullNo,
    int? qty,
    String? sysNo,
    String? yard,
    String? wbCd,
    String? wbNm,
    String? wcCd,
    WorkOrderStatus? status,
  }) {
    return WorkOrder(
      code: code ?? this.code,
      itemNo: itemNo ?? this.itemNo,
      datePlanned: datePlanned ?? this.datePlanned,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      dateEndBefore: dateEndBefore ?? this.dateEndBefore,
      ship: ship ?? this.ship,
      planSeq: planSeq ?? this.planSeq,
      hullNo: hullNo ?? this.hullNo,
      qty: qty ?? this.qty,
      sysNo: sysNo ?? this.sysNo,
      yard: yard ?? this.yard,
      wbCd: wbCd ?? this.wbCd,
      wbNm: wbNm ?? this.wbNm,
      wcCd: wcCd ?? this.wcCd,
      status: status ?? this.status,
    );
  }
}
