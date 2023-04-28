import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/src/workorderCurrent/domain/entities/current_work_order_list.dart';
import 'package:frontend/src/workorderCurrent/infrastructure/dtos/current_work_order_dto.dart';

class CurrentWorkOrderListDto {
  final List<CurrentWorkOrderDto> items;

  const CurrentWorkOrderListDto({
    required this.items,
  });

  factory CurrentWorkOrderListDto.fromDomain(CurrentWorkOrderList domain) {
    return CurrentWorkOrderListDto(
      items:
          domain.items.map((e) => CurrentWorkOrderDto.fromDomain(e)).toList(),
    );
  }

  CurrentWorkOrderList toDomain() {
    return CurrentWorkOrderList(
      items: items.map((e) => e.toDomain()).toList(),
    );
  }

  CurrentWorkOrderListDto copyWith({
    List<CurrentWorkOrderDto>? items,
  }) {
    return CurrentWorkOrderListDto(
      items: items ?? this.items,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentWorkOrderList && listEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'data': items.map((x) => x.toMap()).toList(),
    };
  }

  factory CurrentWorkOrderListDto.fromMap(Map<String, dynamic> map) {
    return CurrentWorkOrderListDto(
      items: (map['data'] as List<dynamic>)
          .map((e) => CurrentWorkOrderDto.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWorkOrderListDto.fromJson(String source) =>
      CurrentWorkOrderListDto.fromMap(json.decode(source));
}
