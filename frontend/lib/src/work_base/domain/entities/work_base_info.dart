import 'package:frontend/src/work_base/domain/entities/work_base_flag.dart';

class WorkBaseInfo {
  final String wbCode;
  final String wbName;
  final String wcCode;
  final String wcName;

  final WorkBaseFlag flag;

  const WorkBaseInfo({
    required this.wbCode,
    required this.wbName,
    required this.wcCode,
    required this.wcName,
    required this.flag,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkBaseInfo &&
        other.wbCode == wbCode &&
        other.wbName == wbName &&
        other.wcCode == wcCode &&
        other.wcName == wcName &&
        other.flag == flag;
  }

  @override
  int get hashCode {
    return wbCode.hashCode ^
        wbName.hashCode ^
        wcCode.hashCode ^
        wcName.hashCode ^
        flag.hashCode;
  }

  WorkBaseInfo copyWith({
    String? wbCode,
    String? wbName,
    String? wcCode,
    String? wcName,
    WorkBaseFlag? flag,
  }) {
    return WorkBaseInfo(
      wbCode: wbCode ?? this.wbCode,
      wbName: wbName ?? this.wbName,
      wcCode: wcCode ?? this.wcCode,
      wcName: wcName ?? this.wcName,
      flag: flag ?? this.flag,
    );
  }
}
