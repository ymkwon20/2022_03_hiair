class Combo {
  /// CD: 코드
  final String code;

  /// CD_NM: 코드 이름
  final String name;

  const Combo({
    required this.code,
    required this.name,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Combo && other.code == code && other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;

  Combo copyWith({
    String? code,
    String? name,
  }) {
    return Combo(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }
}
