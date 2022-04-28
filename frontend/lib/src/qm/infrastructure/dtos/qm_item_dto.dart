import 'dart:convert';

import 'package:frontend/src/qm/domain/entities/qm_item.dart';

class QmItemDto {
  /// WO_NB: 작업지시번호
  final String workOrder;

  /// ItemNo: 품번
  final String itemNo;

  /// PND: 납기일자
  final String datePlanned;

  /// CLOSE_ST: 작업시작일
  final String dateStart;

  /// CLOSE_DT: 작업완료일
  final String dateEnd;

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

  const QmItemDto({
    required this.workOrder,
    required this.itemNo,
    required this.datePlanned,
    required this.dateStart,
    required this.dateEnd,
    required this.ship,
    required this.planSeq,
    required this.hullNo,
    required this.qty,
    required this.sysNo,
    required this.yard,
  });

  factory QmItemDto.fromDomain(QmItem domain) {
    return QmItemDto(
      workOrder: domain.workOrder,
      itemNo: domain.itemNo,
      datePlanned: domain.datePlanned,
      dateStart: domain.dateStart,
      dateEnd: domain.dateEnd,
      ship: domain.ship,
      planSeq: domain.planSeq,
      hullNo: domain.hullNo,
      qty: domain.qty,
      sysNo: domain.sysNo,
      yard: domain.yard,
    );
  }

  QmItem toDomain() {
    return QmItem(
      workOrder: workOrder,
      itemNo: itemNo,
      datePlanned: datePlanned,
      dateStart: dateStart,
      dateEnd: dateEnd,
      ship: ship,
      planSeq: planSeq,
      hullNo: hullNo,
      qty: qty,
      sysNo: sysNo,
      yard: yard,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QmItemDto &&
        other.workOrder == workOrder &&
        other.itemNo == itemNo &&
        other.datePlanned == datePlanned &&
        other.dateStart == dateStart &&
        other.dateEnd == dateEnd &&
        other.ship == ship &&
        other.planSeq == planSeq &&
        other.hullNo == hullNo &&
        other.qty == qty &&
        other.sysNo == sysNo &&
        other.yard == yard;
  }

  @override
  int get hashCode {
    return workOrder.hashCode ^
        itemNo.hashCode ^
        datePlanned.hashCode ^
        dateStart.hashCode ^
        dateEnd.hashCode ^
        ship.hashCode ^
        planSeq.hashCode ^
        hullNo.hashCode ^
        qty.hashCode ^
        sysNo.hashCode ^
        yard.hashCode;
  }

  QmItemDto copyWith({
    String? workOrder,
    String? itemNo,
    String? datePlanned,
    String? dateStart,
    String? dateEnd,
    String? ship,
    int? planSeq,
    String? hullNo,
    int? qty,
    String? sysNo,
    String? yard,
  }) {
    return QmItemDto(
      workOrder: workOrder ?? this.workOrder,
      itemNo: itemNo ?? this.itemNo,
      datePlanned: datePlanned ?? this.datePlanned,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      ship: ship ?? this.ship,
      planSeq: planSeq ?? this.planSeq,
      hullNo: hullNo ?? this.hullNo,
      qty: qty ?? this.qty,
      sysNo: sysNo ?? this.sysNo,
      yard: yard ?? this.yard,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'wo-nb': workOrder,
      'item-no': itemNo,
      'plan-date': datePlanned,
      'start-date': dateStart,
      'close-date': dateEnd,
      'ship': ship,
      'plan-seq': planSeq,
      'hull-no': hullNo,
      'qty': qty,
      'sys-no': sysNo,
      'yard': yard,
    };
  }

  factory QmItemDto.fromMap(Map<String, dynamic> map) {
    return QmItemDto(
      workOrder: map['WO_NB'] ?? '',
      itemNo: map['ItemNo'] ?? '',
      datePlanned: map['PND'] ?? '',
      dateStart: map['CLOSE_ST'] ?? '',
      dateEnd: map['CLOSE_DT'] ?? '',
      ship: map['ship'] ?? '',
      planSeq: map['PRODPLANSEQ']?.toInt() ?? '',
      hullNo: map['HullNo'] ?? '',
      qty: map['REQ_QT']?.toInt() ?? 0,
      sysNo: map['SysNo'] ?? '',
      yard: map['Yard'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QmItemDto.fromJson(String source) =>
      QmItemDto.fromMap(json.decode(source));
}
