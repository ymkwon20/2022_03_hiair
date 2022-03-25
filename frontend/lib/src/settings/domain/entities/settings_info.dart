class SettingsInfo {
  final String themeMode;

  const SettingsInfo({
    required this.themeMode,
  });

  SettingsInfo copyWith({
    String? themeMode,
  }) {
    return SettingsInfo(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  String toString() => 'SettingsInfo(themeMode: $themeMode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsInfo && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;
}
