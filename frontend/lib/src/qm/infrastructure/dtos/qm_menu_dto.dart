import 'dart:convert';

import 'package:frontend/src/qm/domain/entities/qm_menu.dart';

class QmMenuDto {
  final String code;
  final String name;

  const QmMenuDto({
    required this.code,
    required this.name,
  });

  factory QmMenuDto.fromDomain(QmMenu domain) {
    return QmMenuDto(code: domain.code, name: domain.name);
  }

  QmMenu toDomain() {
    return QmMenu(code: code, name: name);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QmMenuDto && other.code == code && other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;

  QmMenuDto copyWith({
    String? code,
    String? name,
  }) {
    return QmMenuDto(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
    };
  }

  factory QmMenuDto.fromMap(Map<String, dynamic> map) {
    return QmMenuDto(
      code: map['QM_CD'] ?? '',
      name: map['QM_NM'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QmMenuDto.fromJson(String source) =>
      QmMenuDto.fromMap(json.decode(source));
}
