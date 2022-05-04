import 'package:flutter/foundation.dart';

import 'check_type.dart';
import 'combo.dart';

class Checklist {
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

  /// CHK_VAL: CKS_VAL에 입력해서 저장할 때 전달해야하는 값
  final String checkValue;

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

  const Checklist({
    required this.planSeq,
    required this.workOrder,
    required this.wbCd,
    required this.wcCd,
    required this.checkType,
    required this.checkSheetCd,
    required this.checkSheetName,
    required this.checkSheetValue,
    required this.checkValue,
    required this.standardCd,
    required this.standard,
    required this.imageFileName,
    required this.originalFileName,
    required this.comboCd,
    required this.combos,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Checklist &&
        other.planSeq == planSeq &&
        other.workOrder == workOrder &&
        other.wbCd == wbCd &&
        other.wcCd == wcCd &&
        other.checkType == checkType &&
        other.checkSheetCd == checkSheetCd &&
        other.checkSheetName == checkSheetName &&
        other.checkSheetValue == checkSheetValue &&
        other.checkValue == checkValue &&
        other.standardCd == standardCd &&
        other.standard == standard &&
        other.imageFileName == imageFileName &&
        other.originalFileName == originalFileName &&
        other.comboCd == comboCd &&
        listEquals(other.combos, combos);
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
        checkValue.hashCode ^
        standardCd.hashCode ^
        standard.hashCode ^
        imageFileName.hashCode ^
        originalFileName.hashCode ^
        comboCd.hashCode ^
        combos.hashCode;
  }

  Checklist copyWith({
    int? planSeq,
    String? workOrder,
    String? wbCd,
    String? wcCd,
    CheckType? checkType,
    String? checkSheetCd,
    String? checkSheetName,
    String? checkSheetValue,
    String? checkValue,
    String? standardCd,
    String? standard,
    String? imageFileName,
    String? originalFileName,
    String? comboCd,
    List<Combo>? combos,
  }) {
    return Checklist(
      planSeq: planSeq ?? this.planSeq,
      workOrder: workOrder ?? this.workOrder,
      wbCd: wbCd ?? this.wbCd,
      wcCd: wcCd ?? this.wcCd,
      checkType: checkType ?? this.checkType,
      checkSheetCd: checkSheetCd ?? this.checkSheetCd,
      checkSheetName: checkSheetName ?? this.checkSheetName,
      checkSheetValue: checkSheetValue ?? this.checkSheetValue,
      checkValue: checkValue ?? this.checkValue,
      standardCd: standardCd ?? this.standardCd,
      standard: standard ?? this.standard,
      imageFileName: imageFileName ?? this.imageFileName,
      originalFileName: originalFileName ?? this.originalFileName,
      comboCd: comboCd ?? this.comboCd,
      combos: combos ?? this.combos,
    );
  }
}
