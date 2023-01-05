import 'dart:convert';

import 'package:frontend/src/workorder/domain/entities/i_work_order.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order.dart';

class QmWorkOrderDto extends IWorkOrder {
  const QmWorkOrderDto({
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
    required String chkDiv,
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
          chkDiv: chkDiv,
        );

  factory QmWorkOrderDto.fromDomain(QmWorkOrder domain) {
    return QmWorkOrderDto(
      code: domain.code,
      itemNo: domain.itemNo,
      date: domain.date,
      ship: domain.ship,
      planSeq: domain.planSeq,
      hullNo: domain.hullNo,
      qty: domain.qty,
      sysNo: domain.sysNo,
      yard: domain.yard,
      wbCd: domain.wbCd,
      wcCd: domain.wcCd,
      wbNm: domain.wbNm,
      chkDiv: domain.chkDiv,
    );
  }

  QmWorkOrder toDomain() {
    return QmWorkOrder(
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
      chkDiv: chkDiv,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'wo-nb': code,
      'item-no': itemNo,
      'date': date,
      'ship': ship,
      'plan-seq': planSeq,
      'hull-no': hullNo,
      'qty': qty,
      'sys-no': sysNo,
      'yard': yard,
      'wb-cd': wbCd,
      'wb-nm': wbNm,
      'wc-cd': wcCd,
      'chkDiv': chkDiv,
    };
  }

  factory QmWorkOrderDto.fromMap(Map<String, dynamic> map) {
    return QmWorkOrderDto(
      code: map['WO_NB'] ?? '',
      itemNo: map['ITEMNO'] ?? '',
      date: map['CHK_ET_DT'] ?? '',
      ship: map['SHIP'] ?? '',
      planSeq: map['PRODPLANSEQ']?.toInt() ?? '',
      hullNo: map['HULLNO'] ?? '',
      qty: map['REQ_QT']?.toInt() ?? 0,
      sysNo: map['SYSNO'] ?? '',
      yard: map['YARD'] ?? '',
      wbCd: map["WB_CD"] ?? "",
      wcCd: map["WC_CD"] ?? "",
      wbNm: map["WB_NM"] ?? "",
      chkDiv: map["CHL_DIV"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory QmWorkOrderDto.fromJson(String source) =>
      QmWorkOrderDto.fromMap(json.decode(source));

  QmWorkOrderDto copyWith({
    String? code,
    String? itemNo,
    String? date,
    String? ship,
    int? planSeq,
    String? hullNo,
    int? qty,
    String? sysNo,
    String? yard,
    String? wbCd,
    String? wbNm,
    String? wcCd,
    String? chkDiv,
  }) {
    return QmWorkOrderDto(
      code: code ?? this.code,
      itemNo: itemNo ?? this.itemNo,
      date: date ?? this.date,
      ship: ship ?? this.ship,
      planSeq: planSeq ?? this.planSeq,
      hullNo: hullNo ?? this.hullNo,
      qty: qty ?? this.qty,
      sysNo: sysNo ?? this.sysNo,
      yard: yard ?? this.yard,
      wbCd: wbCd ?? this.wbCd,
      wbNm: wbNm ?? this.wbNm,
      wcCd: wcCd ?? this.wcCd,
      chkDiv: chkDiv ?? this.chkDiv,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QmWorkOrderDto &&
        other.code == code &&
        other.itemNo == itemNo &&
        other.date == date &&
        other.ship == ship &&
        other.planSeq == planSeq &&
        other.hullNo == hullNo &&
        other.qty == qty &&
        other.sysNo == sysNo &&
        other.yard == yard &&
        other.wbCd == wbCd &&
        other.wbNm == wbNm &&
        other.wcCd == wcCd &&
        other.chkDiv == chkDiv;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        itemNo.hashCode ^
        date.hashCode ^
        ship.hashCode ^
        planSeq.hashCode ^
        hullNo.hashCode ^
        qty.hashCode ^
        sysNo.hashCode ^
        yard.hashCode ^
        wbCd.hashCode ^
        wbNm.hashCode ^
        wcCd.hashCode ^
        chkDiv.hashCode;
  }
}
