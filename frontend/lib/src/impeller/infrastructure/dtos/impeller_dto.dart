import 'dart:convert';

import 'package:frontend/src/impeller/domain/entities/i_impeller.dart';
import 'package:frontend/src/impeller/domain/entities/impeller.dart';
import 'package:frontend/src/impeller/domain/entities/impeller_status.dart';

class ImpellerDto extends IImpeller {
  /// CLOSE_ST: 작업시작일
  final String dateStart;

  /// CLOSE_DT: 작업완료일
  final String dateEnd;

  /// BEF_CLOSE_DT: 이전 작업 완료일
  final String dateEndBefore;

  final ImpellerStatus status;

  const ImpellerDto({
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
    required this.dateStart,
    required this.dateEnd,
    required this.dateEndBefore,
    required this.status,
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
        );

  factory ImpellerDto.fromDomain(Impeller domain) {
    return ImpellerDto(
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
      bldAngle: domain.bldAngle,
      shaft: domain.shaft,
      rmk: domain.rmk,
    );
  }

  Impeller toDomain() {
    return Impeller(
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
      bldAngle: bldAngle,
      shaft: shaft,
      rmk: rmk,
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
      "bldAngle": bldAngle,
      "shaft": shaft,
      "rmk": rmk
    };
  }

  factory ImpellerDto.fromMap(Map<String, dynamic> map) {
    late ImpellerStatus status;

    final fetchedStatus = map['STUS'] ?? '';

    if (fetchedStatus == "W") {
      status = ImpellerStatus.waiting;
    } else {
      status = ImpellerStatus.resuming;
    }

    return ImpellerDto(
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
      bldAngle: map["BLD_ANGLE"] ?? "",
      shaft: map["SHAFT"] ?? "",
      rmk: map["RMK"] ?? "",
      status: status,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImpellerDto.fromJson(String source) =>
      ImpellerDto.fromMap(json.decode(source));

  ImpellerDto copyWith({
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
    ImpellerStatus? status,
  }) {
    return ImpellerDto(
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
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImpellerDto &&
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
        other.rmk == rmk;
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
        rmk.hashCode;
  }
}
