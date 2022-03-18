import 'dart:convert';

import 'package:frontend/src/settings/domain/entities/settings_info.dart';

class SettingsInfoDTO {
  final String themeMode;

  const SettingsInfoDTO({
    required this.themeMode,
  });

  SettingsInfoDTO copyWith({
    String? themeMode,
  }) {
    return SettingsInfoDTO(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  factory SettingsInfoDTO.fromDomain(SettingsInfo domain) {
    return SettingsInfoDTO(themeMode: domain.themeMode);
  }

  SettingsInfo toDomain() {
    return SettingsInfo(themeMode: themeMode);
  }

  Map<String, dynamic> toMap() {
    return {
      'themeData': themeMode,
    };
  }

  factory SettingsInfoDTO.fromMap(Map<String, dynamic> map) {
    return SettingsInfoDTO(
      themeMode: map['themeData'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsInfoDTO.fromJson(String source) =>
      SettingsInfoDTO.fromMap(json.decode(source));

  @override
  String toString() => 'SettingsInfoDTO(themeData: $themeMode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsInfoDTO && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;
}
