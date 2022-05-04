import 'dart:convert';

import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';

/// Cutting LOT DTO
class CuttingSerialDTO {
  /// 요청순번
  final int seq;

  /// 요청 일자
  final String dateRequested;

  /// 긴급 여부
  final String urgencyStatus;

  /// 작업 완료 여부
  ///  - (2022-04-07일 기준) Stored Procedure 에서 N만 기본으로 던져주는 것으로
  ///    되어 있음
  final bool hasDone;

  /// 작업 시작일
  final String dateStart;

  /// 작업 완료일
  final String dateEnd;

  ///  NEW1_FN : 서버저장 파일명
  final String imageFileName;

  const CuttingSerialDTO({
    required this.seq,
    required this.dateRequested,
    required this.urgencyStatus,
    required this.hasDone,
    required this.dateStart,
    required this.dateEnd,
    required this.imageFileName,
  });

  factory CuttingSerialDTO.fromDomai(CuttingSerial domain) {
    return CuttingSerialDTO(
      seq: domain.seq,
      dateRequested: domain.dateRequested,
      urgencyStatus: domain.urgencyStatus,
      hasDone: domain.hasDone,
      dateStart: domain.dateStart,
      dateEnd: domain.dateEnd,
      imageFileName: domain.imageFileName,
    );
  }

  CuttingSerial toDomain() {
    return CuttingSerial(
      seq: seq,
      dateRequested: dateRequested,
      urgencyStatus: urgencyStatus,
      hasDone: hasDone,
      dateStart: dateStart,
      dateEnd: dateEnd,
      imageFileName: imageFileName,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CuttingSerialDTO &&
        other.seq == seq &&
        other.dateRequested == dateRequested &&
        other.urgencyStatus == urgencyStatus &&
        other.hasDone == hasDone &&
        other.dateStart == dateStart &&
        other.dateEnd == dateEnd;
  }

  @override
  int get hashCode {
    return seq.hashCode ^
        dateRequested.hashCode ^
        urgencyStatus.hashCode ^
        hasDone.hashCode ^
        dateStart.hashCode ^
        dateEnd.hashCode;
  }

  CuttingSerialDTO copyWith({
    int? seq,
    String? dateRequested,
    String? urgencyStatus,
    bool? hasDone,
    String? dateStart,
    String? dateEnd,
    String? imageFileName,
  }) {
    return CuttingSerialDTO(
        seq: seq ?? this.seq,
        dateRequested: dateRequested ?? this.dateRequested,
        urgencyStatus: urgencyStatus ?? this.urgencyStatus,
        hasDone: hasDone ?? this.hasDone,
        dateStart: dateStart ?? this.dateStart,
        dateEnd: dateEnd ?? this.dateEnd,
        imageFileName: imageFileName ?? this.imageFileName);
  }

  Map<String, dynamic> toMap() {
    return {
      'seq': seq,
      'requestDate': dateRequested,
      'urgencyStatus': urgencyStatus,
      'hasDone': hasDone,
      'startDate': dateStart,
      'endDate': dateEnd,
      'NEW1_FN': imageFileName,
    };
  }

  factory CuttingSerialDTO.fromMap(Map<String, dynamic> map) {
    return CuttingSerialDTO(
      seq: map['REQ_SEQ']?.toInt() ?? 0,
      dateRequested: map['REQ_DATE'] ?? '',
      urgencyStatus: map['ASORD_ECY'] ?? '',
      hasDone: map['WORK_STATUS'] == null || map['WORK_STATUS'] == 'N'
          ? false
          : true,
      dateStart: map['WORK_ST'] ?? '',
      dateEnd: map['WORK_ET'] ?? '',
      imageFileName: map['NEW1_FN'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CuttingSerialDTO.fromJson(String source) =>
      CuttingSerialDTO.fromMap(json.decode(source));
}
