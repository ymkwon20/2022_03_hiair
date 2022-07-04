import 'dart:convert';

import 'package:frontend/src/workorder/domain/entities/i_work_order.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_status.dart';

class WorkOrderDto extends IWorkOrder {
  /// CLOSE_ST: 작업시작일
  final String dateStart;

  /// CLOSE_DT: 작업완료일
  final String dateEnd;

  /// BEF_CLOSE_DT: 이전 작업 완료일
  final String dateEndBefore;

  /// 공정 진행 상태
  final WorkOrderStatus status;

  const WorkOrderDto({
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

  factory WorkOrderDto.fromDomain(WorkOrder domain) {
    return WorkOrderDto(
      code: domain.code,
      itemNo: domain.itemNo,
      date: domain.date,
      dateStart: domain.dateStart,
      dateEnd: domain.dateEnd,
      dateEndBefore: domain.dateEndBefore,
      ship: domain.ship,
      planSeq: domain.planSeq,
      hullNo: domain.hullNo,
      qty: domain.qty,
      sysNo: domain.sysNo,
      yard: domain.yard,
      wbCd: domain.wbCd,
      wcCd: domain.wcCd,
      wbNm: domain.wbNm,
      status: domain.status,
    );
  }

  WorkOrder toDomain() {
    return WorkOrder(
      code: code,
      itemNo: itemNo,
      date: date,
      dateStart: dateStart,
      dateEnd: dateEnd,
      dateEndBefore: dateEndBefore,
      ship: ship,
      planSeq: planSeq,
      hullNo: hullNo,
      qty: qty,
      sysNo: sysNo,
      yard: yard,
      wbCd: wbCd,
      wcCd: wcCd,
      wbNm: wbNm,
      status: status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'wo-nb': code,
      'item-no': itemNo,
      'plan-date': date,
      'start-date': dateStart,
      'close-date': dateEnd,
      'close-date-bef': dateEndBefore,
      'ship': ship,
      'plan-seq': planSeq,
      'hull-no': hullNo,
      'qty': qty,
      'sys-no': sysNo,
      'yard': yard,
      'wb-cd': wbCd,
      'wb-nm': wbNm,
      'wc-cd': wcCd,
    };
  }

  factory WorkOrderDto.fromMap(Map<String, dynamic> map) {
    late WorkOrderStatus status;

    final fetchedStatus = map['STUS'] ?? '';

    if (fetchedStatus == "W") {
      status = WorkOrderStatus.waiting;
    } else {
      status = WorkOrderStatus.resuming;
    }

    return WorkOrderDto(
      code: map['WO_NB'] ?? '',
      itemNo: map['ITEMNO'] ?? '',
      date: map['PND'] ?? '',
      dateStart: map['CLOSE_ST'] ?? '',
      dateEnd: map['CLOSE_DT'] ?? '',
      dateEndBefore: map['BEF_CLOSE_DT'] ?? '',
      ship: map['SHIP'] ?? '',
      planSeq: map['PRODPLANSEQ']?.toInt() ?? '',
      hullNo: map['HULLNO'] ?? '',
      qty: map['REQ_QT']?.toInt() ?? 0,
      sysNo: map['SYSNO'] ?? '',
      yard: map['YARD'] ?? '',
      wbCd: map["WB_CD"] ?? "",
      wcCd: map["WC_CD"] ?? "",
      wbNm: map["WB_NM"] ?? "",
      status: status,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkOrderDto.fromJson(String source) =>
      WorkOrderDto.fromMap(json.decode(source));

  WorkOrderDto copyWith({
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
    return WorkOrderDto(
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkOrderDto &&
        other.code == code &&
        other.itemNo == itemNo &&
        other.date == date &&
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
        date.hashCode ^
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
}
