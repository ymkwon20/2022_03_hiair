class MotorInfo {
  final String name;
  final List<MotorItem> items;

  const MotorInfo({
    required this.name,
    required this.items,
  });
}

class MotorItem {
  final String title;
  final String description;
  final bool checked;

  const MotorItem({
    required this.title,
    required this.description,
    required this.checked,
  });
}
