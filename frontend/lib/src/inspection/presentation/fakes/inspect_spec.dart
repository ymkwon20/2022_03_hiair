import 'package:frontend/src/inspection/presentation/fakes/inspect_item.dart';

class InspectSpec {
  final String name;
  final List<InspectItem> items;

  const InspectSpec({
    required this.name,
    required this.items,
  });
}
