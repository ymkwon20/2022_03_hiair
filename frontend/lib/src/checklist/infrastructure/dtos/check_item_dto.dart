import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/checklist/domain/entities/check_type.dart';
import 'package:frontend/src/checklist/infrastructure/dtos/combo_dto.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';

class CheckItemDto {
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
  final List<ComboDto> combos;

  /// UNIT: 단위 값 정보
  final String unit;

  /// DIV_CD: 정보없음. QM1 구분하는 값으로 추정됨
  final String divCd;

  /// PHT_CD: 정보없음
  final String phtCd;

  const CheckItemDto({
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

  factory CheckItemDto.fromDomain(CheckItem domain) {
    return CheckItemDto(
      planSeq: domain.planSeq,
      workOrder: domain.workOrder,
      wbCd: domain.wbCd,
      wcCd: domain.wcCd,
      checkType: domain.checkType,
      checkSheetCd: domain.checkSheetCd,
      checkSheetName: domain.checkSheetName,
      checkSheetValue: domain.checkSheetValue,
      standardCd: domain.standardCd,
      standard: domain.standard,
      imageFileName: domain.imageFileName,
      originalFileName: domain.originalFileName,
      comboCd: domain.comboCd,
      unit: domain.unit,
      divCd: domain.divCd,
      phtCd: domain.phtCd,
      combos: domain.combos.map((e) => ComboDto.fromDomain(e)).toList(),
    );
  }

  CheckItem toDomain() {
    return CheckItem(
      planSeq: planSeq,
      workOrder: workOrder,
      wbCd: wbCd,
      wcCd: wcCd,
      checkType: checkType,
      checkSheetCd: checkSheetCd,
      checkSheetName: checkSheetName,
      checkSheetValue: checkSheetValue,
      standardCd: standardCd,
      standard: standard,
      imageFileName: imageFileName,
      originalFileName: originalFileName,
      comboCd: comboCd,
      unit: unit,
      divCd: divCd,
      phtCd: phtCd,
      combos: combos.map((e) => e.toDomain()).toList(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CheckItemDto &&
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
        other.unit == unit &&
        other.phtCd == phtCd &&
        other.divCd == divCd &&
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
        standardCd.hashCode ^
        standard.hashCode ^
        imageFileName.hashCode ^
        originalFileName.hashCode ^
        comboCd.hashCode ^
        unit.hashCode ^
        divCd.hashCode ^
        phtCd.hashCode ^
        combos.hashCode;
  }

  CheckItemDto copyWith({
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
    String? unit,
    String? phtCd,
    String? divCd,
    List<ComboDto>? combos,
  }) {
    return CheckItemDto(
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

  Map<String, dynamic> toMap() {
    return {
      'seq': planSeq.toString(),
      'wo-nb': workOrder,
      'wb-cd': wbCd,
      'wc-cd': wcCd,
      'cks-type': checkTypeName,
      'cks-cd': checkSheetCd,
      'cks-nm': checkSheetName,
      'cks-val': checkSheetValue,
      'bas-cd': standardCd,
      'bas-val': standard,
      'new1-fn': imageFileName,
      'org1-fn': originalFileName,
      'cbo-cd': comboCd,
      // 'combos': combos.map((x) => x.toMap()).toList(),
      'unit': unit,
      'div-cd': divCd,
      'pht-cd': phtCd,
    };
  }

  factory CheckItemDto.fromMap(Map<String, dynamic> map) {
    late final CheckType type;

    final rawType = map['CKS_TYPE'] ?? "";
    if (rawType == "N") {
      type = CheckType.number;
    } else if (rawType == "S") {
      type = CheckType.string;
    } else if (rawType == "C") {
      type = CheckType.checkbox;
    } else if (rawType == "I") {
      type = CheckType.image;
    } else if (rawType == "D") {
      type = CheckType.date;
    } else if (rawType == "B") {
      type = CheckType.combo;
    } else if (rawType == "A") {
      type = CheckType.file;
    } else if (rawType == "R") {
      type = CheckType.readonly;
    } else {
      throw const InvalidServerResponseException(message: "invalid check type");
    }

    return CheckItemDto(
      planSeq: map['PRODPLANSEQ']?.toInt() ?? 0,
      workOrder: map['WO_NB'] ?? '',
      wbCd: map['WB_CD'] ?? '',
      wcCd: map['WC_CD'] ?? '',
      checkType: type,
      checkSheetCd: map['CKS_CD'] ?? '',
      checkSheetName: map['CKS_NM'] ?? '',
      checkSheetValue: map['CKS_VAL'] ?? '',
      standardCd: map['BAS_CD'] ?? '',
      standard: map['BAS_VAL'] ?? '',
      imageFileName: map['NEW1_FN'] ?? '',
      originalFileName: map['ORG1_FN'] ?? '',
      comboCd: map['CBO_CD'] ?? '',
      combos: [],
      unit: map['UNIT'] ?? '',
      phtCd: map['PHT_CD'] ?? '',
      divCd: map['DIV_CD'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckItemDto.fromJson(String source) =>
      CheckItemDto.fromMap(json.decode(source));

  String get checkTypeName {
    switch (checkType) {
      case CheckType.number:
        return "N";
      case CheckType.string:
        return "S";
      case CheckType.checkbox:
        return "C";
      case CheckType.date:
        return "D";
      case CheckType.image:
        return "I";
      case CheckType.combo:
        return "B";
      case CheckType.file:
        return "A";
      case CheckType.readonly:
        return "R";
    }
  }
}
