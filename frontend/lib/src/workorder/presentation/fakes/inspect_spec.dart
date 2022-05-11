import 'package:frontend/src/workorder/presentation/fakes/inspect_item.dart';

class InspectSpec {
  String name;
  List<InspectItem> items;

  InspectSpec({
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
