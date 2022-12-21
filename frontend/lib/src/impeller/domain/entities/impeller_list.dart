import 'package:frontend/src/impeller/domain/entities/impeller.dart';

class ImpellerList {
  final bool isNextAvailable;
  final List<Impeller> items;

  const ImpellerList({
    required this.isNextAvailable,
    required this.items,
  });

  ImpellerList copyWith({
    bool? isNextAvailable,
    List<Impeller>? items,
  }) {
    return ImpellerList(
      isNextAvailable: isNextAvailable ?? this.isNextAvailable,
      items: items ?? this.items,
    );
  }
}
