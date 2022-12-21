import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/src/impeller/domain/entities/impeller_list.dart';
import 'package:frontend/src/impeller/infrastructure/dtos/impeller_dto.dart';

class ImpellerListDto {
  final bool isNextAvailable;
  final List<ImpellerDto> items;

  const ImpellerListDto({
    required this.isNextAvailable,
    required this.items,
  });

  factory ImpellerListDto.fromDomain(ImpellerList domain) {
    return ImpellerListDto(
      isNextAvailable: domain.isNextAvailable,
      items: domain.items.map((e) => ImpellerDto.fromDomain(e)).toList(),
    );
  }

  ImpellerList toDomain() {
    return ImpellerList(
      isNextAvailable: isNextAvailable,
      items: items.map((e) => e.toDomain()).toList(),
    );
  }

  ImpellerListDto copyWith({
    bool? isNextAvailable,
    List<ImpellerDto>? items,
  }) {
    return ImpellerListDto(
      isNextAvailable: isNextAvailable ?? this.isNextAvailable,
      items: items ?? this.items,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImpellerList &&
        other.isNextAvailable == isNextAvailable &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode => isNextAvailable.hashCode ^ items.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'is_next_available': isNextAvailable,
      'data': items.map((x) => x.toMap()).toList(),
    };
  }

  factory ImpellerListDto.fromMap(Map<String, dynamic> map) {
    return ImpellerListDto(
      isNextAvailable: map['is_next_available'] ?? false,
      items: (map['data'] as List<dynamic>)
          .map((e) => ImpellerDto.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImpellerListDto.fromJson(String source) =>
      ImpellerListDto.fromMap(json.decode(source));
}
