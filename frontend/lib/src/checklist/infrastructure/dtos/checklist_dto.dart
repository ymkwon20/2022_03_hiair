import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:frontend/src/checklist/domain/entities/check_type.dart';
import 'package:frontend/src/checklist/domain/entities/checklist.dart';
import 'package:frontend/src/checklist/infrastructure/dtos/combo_dto.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';

class ChecklistDto {
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
  final List<ComboDto> combos;

  const ChecklistDto({
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

  factory ChecklistDto.fromDomain(Checklist domain) {
    return ChecklistDto(
      planSeq: domain.planSeq,
      workOrder: domain.workOrder,
      wbCd: domain.wbCd,
      wcCd: domain.wcCd,
      checkType: domain.checkType,
      checkSheetCd: domain.checkSheetCd,
      checkSheetName: domain.checkSheetName,
      checkSheetValue: domain.checkSheetValue,
      checkValue: domain.checkValue,
      standardCd: domain.standardCd,
      standard: domain.standard,
      imageFileName: domain.imageFileName,
      originalFileName: domain.originalFileName,
      comboCd: domain.comboCd,
      combos: domain.combos.map((e) => ComboDto.fromDomain(e)).toList(),
    );
  }

  Checklist toDomain() {
    return Checklist(
      planSeq: planSeq,
      workOrder: workOrder,
      wbCd: wbCd,
      wcCd: wcCd,
      checkType: checkType,
      checkSheetCd: checkSheetCd,
      checkSheetName: checkSheetName,
      checkSheetValue: checkSheetValue,
      checkValue: checkValue,
      standardCd: standardCd,
      standard: standard,
      imageFileName: imageFileName,
      originalFileName: originalFileName,
      comboCd: comboCd,
      combos: combos.map((e) => e.toDomain()).toList(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChecklistDto &&
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

  ChecklistDto copyWith({
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
    List<ComboDto>? combos,
  }) {
    return ChecklistDto(
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

  Map<String, dynamic> toMap() {
    return {
      'PRODPLANSEQ': planSeq,
      'WO_NB': workOrder,
      'WB_CD': wbCd,
      'wcCd': wcCd,
      'checkType': checkType.toString(),
      'checkSheetCd': checkSheetCd,
      'checkSheetName': checkSheetName,
      'checkSheetValue': checkSheetValue,
      'checkValue': checkValue,
      'standardCd': standardCd,
      'standard': standard,
      'imageFileName': imageFileName,
      'originalFileName': originalFileName,
      'comboCd': comboCd,
      'combos': combos.map((x) => x.toMap()).toList(),
    };
  }

  factory ChecklistDto.fromMap(Map<String, dynamic> map) {
    late final CheckType type;

    final rawType = map['CKS_TYPE'] ?? "";
    if (rawType == "N") {
      type = CheckType.number;
    } else if (rawType == "S") {
      type = CheckType.checkbox;
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
    } else {
      throw const InvalidServerResponseException(message: "invalid check type");
    }

    return ChecklistDto(
      planSeq: map['PRODPLANSEQ']?.toInt() ?? 0,
      workOrder: map['WO_NB'] ?? '',
      wbCd: map['WB_CD'] ?? '',
      wcCd: map['WC_CD'] ?? '',
      checkType: type,
      checkSheetCd: map['CKS_CD'] ?? '',
      checkSheetName: map['CKS_NM'] ?? '',
      checkSheetValue: map['CKS_VAL'] ?? '',
      checkValue: map['CHK_VAL'] ?? '',
      standardCd: map['BAS_CD'] ?? '',
      standard: map['BAS_VAL'] ?? '',
      imageFileName: map['NEW1_FN'] ?? '',
      originalFileName: map['ORG1_FN'] ?? '',
      comboCd: map['CBO_CD'] ?? '',
      combos: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChecklistDto.fromJson(String source) =>
      ChecklistDto.fromMap(json.decode(source));
}
