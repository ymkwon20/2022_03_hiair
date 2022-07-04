import 'package:frontend/src/core/domain/entities/table_cell.dart';

class SafetyInfo implements TableCellEntity {
  const SafetyInfo({
    required this.plantNm,
    required this.equipCd,
    required this.equipNm,
    required this.type,
    required this.location,
  });

  /// PLANT_CD: 사업장 코드
  final String plantNm;

  /// EQUIP_CD: 장비 코드
  final String equipCd;

  /// EQUIP_NM: 장비 이름
  final String equipNm;

  /// EQUIP_TYPE_NM: 타입 이름
  final String type;

  /// EQUIP_LOC: 장비 위치
  final String location;

  @override
  String? getProp(String key) => <String, String>{
        "plantNm": plantNm,
        "equipCd": equipCd,
        "equipNm": equipNm,
        "type": type,
        "location": location,
      }[key];

  SafetyInfo copyWith({
    String? plantNm,
    String? equipCd,
    String? equipNm,
    String? type,
    String? location,
  }) {
    return SafetyInfo(
      plantNm: plantNm ?? this.plantNm,
      equipCd: equipCd ?? this.equipCd,
      equipNm: equipNm ?? this.equipNm,
      type: type ?? this.type,
      location: location ?? this.location,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SafetyInfo &&
        other.plantNm == plantNm &&
        other.equipCd == equipCd &&
        other.equipNm == equipNm &&
        other.type == type &&
        other.location == location;
  }

  @override
  int get hashCode {
    return plantNm.hashCode ^
        equipCd.hashCode ^
        equipNm.hashCode ^
        type.hashCode ^
        location.hashCode;
  }
}
