import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_list.dart';
import 'package:frontend/src/workorder/infrastructure/dtos/work_order_dto.dart';

class WorkOrderListDto {
  final bool isNextAvailable;
  final List<WorkOrderDto> items;

  const WorkOrderListDto({
    required this.isNextAvailable,
    required this.items,
  });

  factory WorkOrderListDto.fromDomain(WorkOrderList domain) {
    return WorkOrderListDto(
      isNextAvailable: domain.isNextAvailable,
      items: domain.items.map((e) => WorkOrderDto.fromDomain(e)).toList(),
    );
  }

  WorkOrderList toDomain() {
    return WorkOrderList(
      isNextAvailable: isNextAvailable,
      items: items.map((e) => e.toDomain()).toList(),
    );
  }

  WorkOrderListDto copyWith({
    bool? isNextAvailable,
    List<WorkOrderDto>? items,
  }) {
    return WorkOrderListDto(
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

  factory WorkOrderListDto.fromMap(Map<String, dynamic> map) {
    return WorkOrderListDto(
      isNextAvailable: map['is_next_available'] ?? false,
      items: (map['data'] as List<dynamic>)
          .map((e) => WorkOrderDto.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkOrderListDto.fromJson(String source) =>
      WorkOrderListDto.fromMap(json.decode(source));
}
