import 'package:frontend/src/core/domain/entities/table_cell.dart';
import 'package:frontend/src/workorder/domain/entities/i_work_order.dart';

class QmWorkOrder extends IWorkOrder implements TableCellEntity {
  const QmWorkOrder({
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

  @override
  String? getProp(String key) => <String, String>{
        "woNb": code,
        "date": date,
        "wbNm": wbNm,
        "yard": yard,
        "hullNo": hullNo,
        "ship": ship,
        "sysNo": sysNo,
        "itemNo": itemNo,
        "qty": qty.toString(),
        "chkDiv": chkDiv,
      }[key];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QmWorkOrder &&
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

  QmWorkOrder copyWith({
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
    return QmWorkOrder(
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
}
