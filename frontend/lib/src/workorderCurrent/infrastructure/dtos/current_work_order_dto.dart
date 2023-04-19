import 'dart:convert';

import 'package:frontend/src/workorderCurrent/domain/entities/current_work_order.dart';
import 'package:frontend/src/workorderCurrent/domain/entities/i_current_work_order.dart';

class CurrentWorkOrderDto extends ICurrentWorkOrder {
  const CurrentWorkOrderDto({
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

  factory CurrentWorkOrderDto.fromDomain(CurrentWorkOrder domain) {
    return CurrentWorkOrderDto(
      pjtNo: domain.pjtNo,
      pndDate: domain.pndDate,
      wonb: domain.wonb,
      yard: domain.yard,
      hullNo: domain.hullNo,
      ship: domain.ship,
      sysNo: domain.sysNo,
      wcNm: domain.wcNm,
      wcCd: domain.wcCd,
      wbNm: domain.wbNm,
      wbCd: domain.wbCd,
    );
  }

  CurrentWorkOrder toDomain() {
    return CurrentWorkOrder(
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
  }

  Map<String, dynamic> toMap() {
    return {
      'pjtNo': pjtNo,
      'pndDate': pndDate,
      'wonb': wonb,
      'yard': yard,
      'hullNo': hullNo,
      'ship': ship,
      'sysNo': sysNo,
      'wcNm': wcNm,
      'wcCd': wcCd,
      'wbNm': wbNm,
      'wbCd': wbCd,
    };
  }

  factory CurrentWorkOrderDto.fromMap(Map<String, dynamic> map) {
    return CurrentWorkOrderDto(
      pjtNo: map['PJTNo'] ?? '',
      pndDate: map['PND'] ?? '',
      wonb: map['WO_NB'] ?? '',
      yard: map['Yard'] ?? '',
      hullNo: map['HullNo'] ?? '',
      ship: map['ship'] ?? '',
      sysNo: map['SysNo'] ?? '',
      wcNm: map['WC_NM'] ?? '',
      wcCd: map['WC_CD'] ?? '',
      wbNm: map['WB_NM'] ?? '',
      wbCd: map['WB_CD'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWorkOrderDto.fromJson(String source) =>
      CurrentWorkOrderDto.fromMap(json.decode(source));

  CurrentWorkOrderDto copyWith({
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
    return CurrentWorkOrderDto(
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentWorkOrderDto &&
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
}
