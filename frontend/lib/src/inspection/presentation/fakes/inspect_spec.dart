import 'package:frontend/src/inspection/presentation/fakes/inspect_item.dart';

class InspectSpec {
  final String name;
  final List<InspectItem> items;

  const InspectSpec({
    required this.name,
    required this.items,
  });

  InspectSpec copyWith({
    String? name,
    List<InspectItem>? items,
  }) {
    return InspectSpec(
      name: name ?? this.name,
      items: items ?? this.items,
    );
  }
}
