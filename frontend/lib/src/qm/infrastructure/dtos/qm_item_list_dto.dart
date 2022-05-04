import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/src/qm/domain/entities/qm_item_list.dart';
import 'package:frontend/src/qm/infrastructure/dtos/qm_item_dto.dart';

class QmItemListDto {
  final bool isNextAvailable;
  final List<QmItemDto> items;

  const QmItemListDto({
    required this.isNextAvailable,
    required this.items,
  });

  factory QmItemListDto.fromDomain(QmItemList domain) {
    return QmItemListDto(
      isNextAvailable: domain.isNextAvailable,
      items: domain.items.map((e) => QmItemDto.fromDomain(e)).toList(),
    );
  }

  QmItemList toDomain() {
    return QmItemList(
      isNextAvailable: isNextAvailable,
      items: items.map((e) => e.toDomain()).toList(),
    );
  }

  QmItemListDto copyWith({
    bool? isNextAvailable,
    List<QmItemDto>? items,
  }) {
    return QmItemListDto(
      isNextAvailable: isNextAvailable ?? this.isNextAvailable,
      items: items ?? this.items,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QmItemListDto &&
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

  factory QmItemListDto.fromMap(Map<String, dynamic> map) {
    return QmItemListDto(
      isNextAvailable: map['is_next_available'] ?? false,
      items: (map['data'] as List<dynamic>)
          .map((e) => QmItemDto.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory QmItemListDto.fromJson(String source) =>
      QmItemListDto.fromMap(json.decode(source));
}
