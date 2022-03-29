import 'package:frontend/src/inspection/presentation/fakes/unit_list.dart';

/// 제품 검사 항목
class InspectItem {
  /// 검사 항목 이름
  final String name;

  /// 검사 항목 단위
  final String unit;
  final UnitList? unitList;

  /// 검사 항목 기준 정보
  final String spec;

  /// 실제 검사 측정 값
  final String? inspectValue;

  /// 첨부 사진 목록
  final List<String> imgPaths;

  /// 검사 측정값 타입
  /// 각 타입마다 다른 입력값을 보여줘야 하기 때문
  final String valueType;

  const InspectItem({
    required this.name,
    required this.unit,
    this.unitList,
    required this.spec,
    this.inspectValue,
    this.imgPaths = const [],
    required this.valueType,
  });

  InspectItem copyWith({
    String? name,
    String? unit,
    UnitList? unitList,
    String? spec,
    String? inspectValue,
    List<String>? imgPaths,
    String? valueType,
  }) {
    return InspectItem(
      name: name ?? this.name,
      unit: unit ?? this.unit,
      unitList: unitList ?? this.unitList,
      spec: spec ?? this.spec,
      inspectValue: inspectValue ?? this.inspectValue,
      imgPaths: imgPaths ?? this.imgPaths,
      valueType: valueType ?? this.valueType,
    );
  }
}
