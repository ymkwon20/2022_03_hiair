import 'dart:convert';

import 'package:frontend/src/checklist/domain/entities/check_image.dart';

class CheckImageDto {
  /// PHT_SEQ: sequence
  final int seq;
  final String path;
  final String remark;

  const CheckImageDto({
    required this.seq,
    required this.path,
    required this.remark,
  });

  factory CheckImageDto.fromDomain(CheckImage domain) {
    return CheckImageDto(
        seq: domain.seq, path: domain.path, remark: domain.remark);
  }

  CheckImage toDomain() {
    return CheckImage.remote(seq: seq, path: path, remark: remark);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CheckImageDto &&
        other.seq == seq &&
        other.path == path &&
        other.remark == remark;
  }

  @override
  int get hashCode => seq.hashCode ^ path.hashCode ^ remark.hashCode;

  CheckImageDto copyWith({
    int? seq,
    String? path,
    String? remark,
  }) {
    return CheckImageDto(
      seq: seq ?? this.seq,
      path: path ?? this.path,
      remark: remark ?? this.remark,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'seq': seq.toString(),
      'name': path.split("/").last,
      'remark': remark,
    };
  }

  factory CheckImageDto.fromMap(Map<String, dynamic> map) {
    return CheckImageDto(
      seq: map['PHT_SEQ']?.toInt() ?? 0,
      path: map['NEW1_FN'] ?? '',
      remark: map['RMK'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckImageDto.fromJson(String source) =>
      CheckImageDto.fromMap(json.decode(source));
}
