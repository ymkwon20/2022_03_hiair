import 'package:frontend/src/core/domain/entities/table_cell.dart';
import 'package:frontend/src/impeller/domain/entities/impeller_status.dart';
import 'package:frontend/src/impeller/domain/entities/i_impeller.dart';

class Impeller extends IImpeller implements TableCellEntity {
  /// CLOSE_ST: 작업시작일
  final String dateStart;

  /// CLOSE_DT: 작업완료일
  final String dateEnd;

  /// BEF_CLOSE_DT: 이전 작업 완료일
  final String dateEndBefore;

  final ImpellerStatus status;

  const Impeller({
    required String code,
    required int planSeq,
    required String date,
    required String wcCd,
    required String wbNm,
    required String wbCd,
    required String yard,
    required String hullNo,
    required int qty,
    required String ship,
    required String sysNo,
    required String itemNo,
    required String bldAngle,
    required String shaft,
    required String rmk,
    required String fanType,
    required this.dateStart,
    required this.dateEnd,
    required this.dateEndBefore,
    required this.status,
    required String chkDiv,
  }) : super(
          code: code,
          planSeq: planSeq,
          date: date,
          wcCd: wcCd,
          wbNm: wbNm,
          wbCd: wbCd,
          yard: yard,
          hullNo: hullNo,
          qty: qty,
          ship: ship,
          sysNo: sysNo,
          itemNo: itemNo,
          bldAngle: bldAngle,
          shaft: shaft,
          rmk: rmk,
          fanType: fanType,
          chkDiv: chkDiv,
        );

  String get statusKr {
    switch (status) {
      case ImpellerStatus.waiting:
        return "대기";
      case ImpellerStatus.resuming:
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
        "bldAngle": bldAngle,
        "shaft": shaft,
        "rmk": rmk,
        "qty": qty.toString(),
        "fanType": fanType,
        'chkDiv': chkDiv,
      }[key];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Impeller &&
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
        other.status == status &&
        other.bldAngle == bldAngle &&
        other.shaft == shaft &&
        other.rmk == rmk &&
        other.fanType == fanType &&
        other.chkDiv == chkDiv;
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
        status.hashCode ^
        bldAngle.hashCode ^
        shaft.hashCode ^
        rmk.hashCode ^
        fanType.hashCode ^
        chkDiv.hashCode;
  }

  Impeller copyWith({
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
    String? bldAngle,
    String? shaft,
    String? rmk,
    String? fanType,
    ImpellerStatus? status,
    String? chkDiv,
  }) {
    return Impeller(
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
      bldAngle: bldAngle ?? this.bldAngle,
      shaft: shaft ?? this.shaft,
      rmk: rmk ?? this.rmk,
      status: status ?? this.status,
      fanType: fanType ?? this.fanType,
      chkDiv: chkDiv ?? this.chkDiv,
    );
  }
}
