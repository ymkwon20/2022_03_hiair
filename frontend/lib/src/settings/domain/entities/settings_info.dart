import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'themeMode': themeMode,
    };
  }

  factory SettingsInfo.fromMap(Map<String, dynamic> map) {
    return SettingsInfo(
      themeMode: map['themeMode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsInfo.fromJson(String source) =>
      SettingsInfo.fromMap(json.decode(source));

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
