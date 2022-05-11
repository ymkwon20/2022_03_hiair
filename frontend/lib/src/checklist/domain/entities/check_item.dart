import 'package:flutter/foundation.dart';

import 'check_type.dart';
import 'combo.dart';

class CheckItem {
  /// PRODPLANSEQ: 생산계획 id
  final int planSeq;

  /// WO_NB : 작업지시
  final String workOrder;

  /// WB_CD: 작업장코드
  final String wbCd;

  /// WC_CD: 공정코드
  final String wcCd;

  /// CKS_TYPE: 체크 시트
  final CheckType checkType;

  /// CKS_CD: 체크시트 코드
  final String checkSheetCd;

  /// CKS_NM: 체크시트 이름
  final String checkSheetName;

  /// CKS_VAL: 태블릿 입력값
  final String checkSheetValue;

  /// BAS_CD: 기준값 코드
  final String standardCd;

  /// BAS_VAL: 기준값
  final String standard;

  ///  NEW1_FN : 서버저장 파일명
  final String imageFileName;

  ///  ORG1_FN : 파일명
  final String originalFileName;

  /// CBO_CD: 콤보박스 코드
  final String comboCd;

  /// 콤보박스 리스트
  final List<Combo> combos;

  /// UNIT: 단위 값 정보
  final String unit;

  /// DIV_CD: 정보없음. QM1 구분하는 값으로 추정됨
  final String divCd;

  /// PHT_CD: 정보없음
  final String phtCd;

  const CheckItem({
    required this.planSeq,
    required this.workOrder,
    required this.wbCd,
    required this.wcCd,
    required this.checkType,
    required this.checkSheetCd,
    required this.checkSheetName,
    required this.checkSheetValue,
    required this.standardCd,
    required this.standard,
    required this.imageFileName,
    required this.originalFileName,
    required this.comboCd,
    required this.combos,
    required this.unit,
    required this.divCd,
    required this.phtCd,
  });

  bool get hasValue {
    switch (checkType) {
      case CheckType.number:
        return checkSheetValue != "";
      case CheckType.string:
        return checkSheetValue != "";
      case CheckType.checkbox:
        return checkSheetValue != "";
      case CheckType.date:
        return checkSheetValue != "";
      case CheckType.combo:
        return checkSheetValue != "";
      case CheckType.image:
        // 사진, 파일은 선택적으로 넣을 수도 있고 안넣을 수도 있음
        return true;
      case CheckType.file:
        // 사진, 파일은 선택적으로 넣을 수도 있고 안넣을 수도 있음
        return true;
      case CheckType.readonly:
        return true;
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CheckItem &&
        other.planSeq == planSeq &&
        other.workOrder == workOrder &&
        other.wbCd == wbCd &&
        other.wcCd == wcCd &&
        other.checkType == checkType &&
        other.checkSheetCd == checkSheetCd &&
        other.checkSheetName == checkSheetName &&
        other.checkSheetValue == checkSheetValue &&
        other.standardCd == standardCd &&
        other.standard == standard &&
        other.imageFileName == imageFileName &&
        other.originalFileName == originalFileName &&
        other.comboCd == comboCd &&
        listEquals(other.combos, combos) &&
        other.unit == unit &&
        other.divCd == divCd &&
        other.phtCd == phtCd;
  }

  @override
  int get hashCode {
    return planSeq.hashCode ^
        workOrder.hashCode ^
        wbCd.hashCode ^
        wcCd.hashCode ^
        checkType.hashCode ^
        checkSheetCd.hashCode ^
        checkSheetName.hashCode ^
        checkSheetValue.hashCode ^
        standardCd.hashCode ^
        standard.hashCode ^
        imageFileName.hashCode ^
        originalFileName.hashCode ^
        comboCd.hashCode ^
        combos.hashCode ^
        unit.hashCode ^
        divCd.hashCode ^
        phtCd.hashCode;
  }

  CheckItem copyWith({
    int? planSeq,
    String? workOrder,
    String? wbCd,
    String? wcCd,
    CheckType? checkType,
    String? checkSheetCd,
    String? checkSheetName,
    String? checkSheetValue,
    String? standardCd,
    String? standard,
    String? imageFileName,
    String? originalFileName,
    String? comboCd,
    List<Combo>? combos,
    String? unit,
    String? divCd,
    String? phtCd,
  }) {
    return CheckItem(
      planSeq: planSeq ?? this.planSeq,
      workOrder: workOrder ?? this.workOrder,
      wbCd: wbCd ?? this.wbCd,
      wcCd: wcCd ?? this.wcCd,
      checkType: checkType ?? this.checkType,
      checkSheetCd: checkSheetCd ?? this.checkSheetCd,
      checkSheetName: checkSheetName ?? this.checkSheetName,
      checkSheetValue: checkSheetValue ?? this.checkSheetValue,
      standardCd: standardCd ?? this.standardCd,
      standard: standard ?? this.standard,
      imageFileName: imageFileName ?? this.imageFileName,
      originalFileName: originalFileName ?? this.originalFileName,
      comboCd: comboCd ?? this.comboCd,
      combos: combos ?? this.combos,
      unit: unit ?? this.unit,
      divCd: divCd ?? this.divCd,
      phtCd: phtCd ?? this.phtCd,
    );
  }
}
