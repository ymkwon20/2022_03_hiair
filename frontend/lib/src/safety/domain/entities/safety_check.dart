import 'package:frontend/src/core/domain/entities/table_cell.dart';

class SafetyCheck implements TableCellEntity {
  /// EQUIP_CHECK_CD: 점검개소 코드
  final String checkCd;

  /// EQUIP_CHECK: 점검개소
  final String checkNm;

  /// CHECK_STD_CD: 점검기준 코드
  final String checkStandardCd;

  /// CHECK_STD: 점검기준
  final String checkStandardNm;

  /// CHECK_CYCLE: 주기
  final String checkCycle;

  // DATA: 데이터
  final String data;

  final String remark;

  final bool edited;

  const SafetyCheck({
    required this.checkCd,
    required this.checkNm,
    required this.checkStandardCd,
    required this.checkStandardNm,
    required this.checkCycle,
    required this.data,
    this.remark = "",
    this.edited = false,
  });

  SafetyCheck copyWith({
    String? checkCd,
    String? checkNm,
    String? checkStandardCd,
    String? checkStandardNm,
    String? checkCycle,
    String? data,
    String? remark,
    bool? edited,
  }) {
    return SafetyCheck(
      checkCd: checkCd ?? this.checkCd,
      checkNm: checkNm ?? this.checkNm,
      checkStandardCd: checkStandardCd ?? this.checkStandardCd,
      checkStandardNm: checkStandardNm ?? this.checkStandardNm,
      checkCycle: checkCycle ?? this.checkCycle,
      data: data ?? this.data,
      remark: remark ?? this.remark,
      edited: edited ?? this.edited,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SafetyCheck &&
        other.checkCd == checkCd &&
        other.checkNm == checkNm &&
        other.checkStandardCd == checkStandardCd &&
        other.checkStandardNm == checkStandardNm &&
        other.checkCycle == checkCycle &&
        other.data == data &&
        other.remark == remark &&
        other.edited == edited;
  }

  @override
  int get hashCode {
    return checkCd.hashCode ^
        checkNm.hashCode ^
        checkStandardCd.hashCode ^
        checkStandardNm.hashCode ^
        checkCycle.hashCode ^
        data.hashCode ^
        remark.hashCode ^
        edited.hashCode;
  }

  @override
  String? getProp(String key) => <String, String>{
        "checkCd": checkCd,
        "checkNm": checkNm,
        "checkStandardCd": checkStandardCd,
        "checkStandardNm": checkStandardNm,
        "checkCycle": checkCycle,
        "data": data,
        "remark": remark,
      }[key];
}
