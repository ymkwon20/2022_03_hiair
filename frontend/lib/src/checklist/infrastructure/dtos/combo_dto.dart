import 'dart:convert';

import 'package:frontend/src/checklist/domain/entities/combo.dart';

class ComboDto {
  /// CD: 코드
  final String code;

  /// CD_NM: 코드 이름
  final String name;

  const ComboDto({
    required this.code,
    required this.name,
  });

  factory ComboDto.fromDomain(Combo domain) {
    return ComboDto(
      code: domain.code,
      name: domain.name,
    );
  }

  Combo toDomain() {
    return Combo(
      code: code,
      name: name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComboDto && other.code == code && other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;

  ComboDto copyWith({
    String? code,
    String? name,
  }) {
    return ComboDto(
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

  factory ComboDto.fromMap(Map<String, dynamic> map) {
    return ComboDto(
      code: map['CD'] ?? '',
      name: map['CD_NM'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ComboDto.fromJson(String source) =>
      ComboDto.fromMap(json.decode(source));
}
