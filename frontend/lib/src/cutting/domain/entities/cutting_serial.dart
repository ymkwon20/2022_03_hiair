/// Cutting LOT
class CuttingSerial {
  /// 요청순번
  final int seq;

  /// 요청 일자
  final String dateRequested;

  /// 긴급 여부
  final String urgencyStatus;

  /// 작업 완료 여부
  final bool hasDone;

  /// 작업 시작일
  final String dateStart;

  /// 작업 완료일
  final String dateEnd;

  ///  NEW1_FN : 서버저장 파일명
  final String imageFileNm;

  const CuttingSerial({
    required this.seq,
    required this.dateRequested,
    required this.urgencyStatus,
    required this.hasDone,
    required this.dateStart,
    required this.dateEnd,
    required this.imageFileNm,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CuttingSerial &&
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

  CuttingSerial copyWith({
    int? seq,
    String? dateRequested,
    String? urgencyStatus,
    bool? hasDone,
    String? dateStart,
    String? dateEnd,
    String? imageFileNm,
  }) {
    return CuttingSerial(
      seq: seq ?? this.seq,
      dateRequested: dateRequested ?? this.dateRequested,
      urgencyStatus: urgencyStatus ?? this.urgencyStatus,
      hasDone: hasDone ?? this.hasDone,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      imageFileNm: imageFileNm ?? this.imageFileNm,
    );
  }
}
