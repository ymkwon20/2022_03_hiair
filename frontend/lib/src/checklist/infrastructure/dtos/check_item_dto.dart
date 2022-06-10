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

  /// CBO_CD: 단위값 콤보박스 코드
  final String unitComboCd;

  /// CKS_TYPE_CBO_CD: 단위값 콤보박스 코드
  final String valueComboCd;

  /// 콤보박스 리스트
  final List<ComboDto> valueCombos;

  /// UNIT: 단위 값 정보
  final String unit;

  /// unit 유형 구분
  final UnitType unitType;

  /// 콤보박스 리스트
  final List<ComboDto> unitCombos;

  /// DIV_CD: 정보없음. QM1 구분하는 값으로 추정됨
  final String divCd;

  /// PHT_CD: 정보없음
  final String phtCd;

  final bool isLocal;

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
    required this.unitComboCd,
    required this.valueComboCd,
    required this.valueCombos,
    required this.unit,
    required this.unitType,
    required this.unitCombos,
    required this.divCd,
    required this.phtCd,
    required this.isLocal,
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
      valueComboCd: domain.valueComboCd,
      unitComboCd: domain.unitComboCd,
      unit: domain.unit,
      divCd: domain.divCd,
      phtCd: domain.phtCd,
      valueCombos:
          domain.valueCombos.map((e) => ComboDto.fromDomain(e)).toList(),
      unitCombos: domain.unitCombos.map((e) => ComboDto.fromDomain(e)).toList(),
      unitType: domain.unitType,
      isLocal: domain.isLocal,
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
      unitComboCd: unitComboCd,
      valueComboCd: valueComboCd,
      unit: unit,
      divCd: divCd,
      phtCd: phtCd,
      valueCombos: valueCombos.map((e) => e.toDomain()).toList(),
      unitCombos: unitCombos.map((e) => e.toDomain()).toList(),
      unitType: unitType,
      isLocal: isLocal,
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
        other.unitComboCd == unitComboCd &&
        other.valueComboCd == valueComboCd &&
        listEquals(other.valueCombos, valueCombos) &&
        other.unit == unit &&
        other.unitType == unitType &&
        listEquals(other.unitCombos, unitCombos) &&
        other.divCd == divCd &&
        other.phtCd == phtCd &&
        other.isLocal == isLocal;
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
        unitComboCd.hashCode ^
        valueComboCd.hashCode ^
        valueCombos.hashCode ^
        unit.hashCode ^
        unitType.hashCode ^
        unitCombos.hashCode ^
        divCd.hashCode ^
        phtCd.hashCode ^
        isLocal.hashCode;
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
    String? unitComboCd,
    String? valueComboCd,
    List<ComboDto>? valueCombos,
    String? unit,
    UnitType? unitType,
    List<ComboDto>? unitCombos,
    String? divCd,
    String? phtCd,
    bool? isLocal,
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
      unitComboCd: unitComboCd ?? this.unitComboCd,
      valueComboCd: valueComboCd ?? this.valueComboCd,
      valueCombos: valueCombos ?? this.valueCombos,
      unit: unit ?? this.unit,
      unitType: unitType ?? this.unitType,
      unitCombos: unitCombos ?? this.unitCombos,
      divCd: divCd ?? this.divCd,
      phtCd: phtCd ?? this.phtCd,
      isLocal: isLocal ?? this.isLocal,
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
      'value-cbo-cd': valueComboCd,
      'unit-cbo-cd': unitComboCd,
      // 'combos': combos.map((x) => x.toMap()).toList(),
      'unit': unit,
      'div-cd': divCd,
      'pht-cd': phtCd,
    };
  }

  factory CheckItemDto.fromMap(Map<String, dynamic> map) {
    late final CheckType checkType;

    final rawCheck = map['CKS_TYPE'] ?? "";
    String checkSheetValue = map['CKS_VAL'] ?? '';
    if (rawCheck == "N") {
      checkType = CheckType.number;
    } else if (rawCheck == "S") {
      checkType = CheckType.string;
    } else if (rawCheck == "C") {
      checkType = CheckType.checkbox;
      checkSheetValue = "1";
    } else if (rawCheck == "I") {
      checkType = CheckType.image;
    } else if (rawCheck == "D") {
      checkType = CheckType.date;
    } else if (rawCheck == "B") {
      checkType = CheckType.combo;
    } else if (rawCheck == "A") {
      checkType = CheckType.file;
    } else if (rawCheck == "R") {
      checkType = CheckType.readonly;
    } else {
      throw const InvalidServerResponseException(message: "invalid check type");
    }

    late final UnitType unitType;
    late final String unit;

    final rawUnit = map["UNIT"] ?? "";

    if (rawUnit == "B") {
      unit = "";
      unitType = UnitType.combo;
    } else {
      unit = rawUnit;
      unitType = UnitType.string;
    }

    return CheckItemDto(
      planSeq: map['PRODPLANSEQ']?.toInt() ?? 0,
      workOrder: map['WO_NB'] ?? '',
      wbCd: map['WB_CD'] ?? '',
      wcCd: map['WC_CD'] ?? '',
      checkType: checkType,
      checkSheetCd: map['CKS_CD'] ?? '',
      checkSheetName: map['CKS_NM'] ?? '',
      checkSheetValue: checkSheetValue,
      standardCd: map['BAS_CD'] ?? '',
      standard: map['BAS_VAL'] ?? '',
      imageFileName: map['NEW1_FN'] ?? '',
      originalFileName: map['ORG1_FN'] ?? '',
      unitComboCd: map['CBO_CD'] ?? '',
      valueComboCd: map['CKS_CBO_CD'] ?? '',
      valueCombos: [],
      phtCd: map['PHT_CD'] ?? '',
      divCd: map['DIV_CD'] ?? '',
      unitCombos: [],
      unit: unit,
      unitType: unitType,
      isLocal: false,
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
