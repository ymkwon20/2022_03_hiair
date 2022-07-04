import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order_list.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_list.dart';
import 'package:frontend/src/workorder/infrastructure/dtos/qm_work_order_dto.dart';

class QmWorkOrderListDto {
  final bool isNextAvailable;
  final List<QmWorkOrderDto> items;

  const QmWorkOrderListDto({
    required this.isNextAvailable,
    required this.items,
  });

  factory QmWorkOrderListDto.fromDomain(QmWorkOrderList domain) {
    return QmWorkOrderListDto(
      isNextAvailable: domain.isNextAvailable,
      items: domain.items.map((e) => QmWorkOrderDto.fromDomain(e)).toList(),
    );
  }

  QmWorkOrderList toDomain() {
    return QmWorkOrderList(
      isNextAvailable: isNextAvailable,
      items: items.map((e) => e.toDomain()).toList(),
    );
  }

  QmWorkOrderListDto copyWith({
    bool? isNextAvailable,
    List<QmWorkOrderDto>? items,
  }) {
    return QmWorkOrderListDto(
      isNextAvailable: isNextAvailable ?? this.isNextAvailable,
      items: items ?? this.items,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkOrderList &&
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

  factory QmWorkOrderListDto.fromMap(Map<String, dynamic> map) {
    return QmWorkOrderListDto(
      isNextAvailable: map['is_next_available'] ?? false,
      items: (map['data'] as List<dynamic>)
          .map((e) => QmWorkOrderDto.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory QmWorkOrderListDto.fromJson(String source) =>
      QmWorkOrderListDto.fromMap(json.decode(source));
}
