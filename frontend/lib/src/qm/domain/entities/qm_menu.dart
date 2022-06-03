class QmMenu {
  final String code;
  final String name;

  const QmMenu({
    required this.code,
    required this.name,
  });

  QmMenu copyWith({
    String? code,
    String? name,
  }) {
    return QmMenu(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QmMenu &&
      other.code == code &&
      other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;
}
