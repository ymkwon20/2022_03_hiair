import 'package:frontend/src/core/domain/entities/table_cell.dart';
import 'package:frontend/src/workorderCurrent/domain/entities/i_current_work_order.dart';

class CurrentWorkOrder extends ICurrentWorkOrder implements TableCellEntity {
  const CurrentWorkOrder({
    required String pjtNo,
    required String pndDate,
    required String wonb,
    required String yard,
    required String hullNo,
    required String ship,
    required String sysNo,
    required String wcNm,
    required String wcCd,
    required String wbNm,
    required String wbCd,
  }) : super(
          pjtNo: pjtNo,
          pndDate: pndDate,
          wonb: wonb,
          yard: yard,
          hullNo: hullNo,
          ship: ship,
          sysNo: sysNo,
          wcNm: wcNm,
          wcCd: wcCd,
          wbNm: wbNm,
          wbCd: wbCd,
        );

  @override
  String? getProp(String key) => <String, String>{
        "pjtNo": pjtNo,
        "pndDate": pndDate,
        "wonb": wonb,
        "yard": yard,
        "hullNo": hullNo,
        "ship": ship,
        "sysNo": sysNo,
        "wcNm": wcNm,
        "wcCd": wcCd,
        "wbNm": wbNm,
        "wbCd": wbCd,
      }[key];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentWorkOrder &&
        other.pjtNo == pjtNo &&
        other.pndDate == pndDate &&
        other.wonb == wonb &&
        other.yard == yard &&
        other.hullNo == hullNo &&
        other.ship == ship &&
        other.sysNo == sysNo &&
        other.wcNm == wcNm &&
        other.wcCd == wcCd &&
        other.wbNm == wbNm &&
        other.wbCd == wbCd;
  }

  @override
  int get hashCode {
    return pjtNo.hashCode ^
        pndDate.hashCode ^
        wonb.hashCode ^
        yard.hashCode ^
        hullNo.hashCode ^
        ship.hashCode ^
        sysNo.hashCode ^
        wcNm.hashCode ^
        wcCd.hashCode ^
        wbNm.hashCode ^
        wbCd.hashCode;
  }

  CurrentWorkOrder copyWith({
    String? pjtNo,
    String? pndDate,
    String? wonb,
    String? yard,
    String? hullNo,
    String? ship,
    String? sysNo,
    String? wcNm,
    String? wcCd,
    String? wbNm,
    String? wbCd,
  }) {
    return CurrentWorkOrder(
      pjtNo: pjtNo ?? this.pjtNo,
      pndDate: pndDate ?? this.pndDate,
      wonb: wonb ?? this.wonb,
      yard: yard ?? this.yard,
      hullNo: hullNo ?? this.hullNo,
      ship: ship ?? this.ship,
      sysNo: sysNo ?? this.sysNo,
      wcNm: wcNm ?? this.wcNm,
      wcCd: wcCd ?? this.wcCd,
      wbNm: wbNm ?? this.wbNm,
      wbCd: wbCd ?? this.wbCd,
    );
  }
}
