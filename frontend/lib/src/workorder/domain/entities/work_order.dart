import 'package:frontend/src/core/domain/entities/table_cell.dart';
import 'package:frontend/src/workorder/domain/entities/i_work_order.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_status.dart';

class WorkOrder extends IWorkOrder implements TableCellEntity {
  /// CLOSE_ST: 작업시작일
  final String dateStart;

  /// CLOSE_DT: 작업완료일
  final String dateEnd;

  /// BEF_CLOSE_DT: 이전 작업 완료일
  final String dateEndBefore;

  /// 공정 진행 상태
  final WorkOrderStatus status;

  const WorkOrder({
    required String code,
    required String itemNo,
    required String date,
    required String ship,
    required int planSeq,
    required String hullNo,
    required int qty,
    required String sysNo,
    required String yard,
    required String wbCd,
    required String wbNm,
    required String wcCd,
    required this.dateStart,
    required this.dateEnd,
    required this.dateEndBefore,
    required this.status,
  }) : super(
          code: code,
          itemNo: itemNo,
          date: date,
          ship: ship,
          planSeq: planSeq,
          hullNo: hullNo,
          qty: qty,
          sysNo: sysNo,
          yard: yard,
          wbCd: wbCd,
          wcCd: wcCd,
          wbNm: wbNm,
        );

  String get statusKr {
    switch (status) {
      case WorkOrderStatus.waiting:
        return "대기";
      case WorkOrderStatus.resuming:
        return "진행중";
    }
  }

  @override
  String? getProp(String key) => <String, String>{
        "wbNm": wbNm,
        "yard": yard,
        "hullNo": hullNo,
        "ship": ship,
        "sysNo": sysNo,
        "itemNo": itemNo,
        "status": statusKr,
        "qty": qty.toString(),
      }[key];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkOrder &&
        other.code == code &&
        other.itemNo == itemNo &&
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
    String? date,
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
      date: date ?? this.date,
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
