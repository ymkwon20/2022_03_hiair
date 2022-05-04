import 'package:frontend/src/qm/domain/entities/qm_item.dart';

class QmItemList {
  final bool isNextAvailable;
  final List<QmItem> items;

  const QmItemList({
    required this.isNextAvailable,
    required this.items,
  });

  QmItemList copyWith({
    bool? isNextAvailable,
    List<QmItem>? items,
  }) {
    return QmItemList(
      isNextAvailable: isNextAvailable ?? this.isNextAvailable,
      items: items ?? this.items,
    );
  }
}
