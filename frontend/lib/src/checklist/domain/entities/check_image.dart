class CheckImage {
  /// PHT_SEQ: sequence
  final int seq;
  final String path;
  final String remark;
  final bool isLocal;
  final bool shouldSave;

  const CheckImage({
    required this.seq,
    required this.path,
    required this.remark,
    this.isLocal = false,
    this.shouldSave = true,
  });

  factory CheckImage.local({
    required int seq,
    required String path,
    required String remark,
  }) {
    return CheckImage(
      seq: seq,
      path: path,
      remark: remark,
      isLocal: true,
      shouldSave: true,
    );
  }

  factory CheckImage.remote({
    required int seq,
    required String path,
    required String remark,
  }) {
    return CheckImage(
      seq: seq,
      path: path,
      remark: remark,
      isLocal: false,
      shouldSave: false,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CheckImage &&
        other.seq == seq &&
        other.path == path &&
        other.remark == remark &&
        other.isLocal == isLocal &&
        other.shouldSave == shouldSave;
  }

  @override
  int get hashCode {
    return seq.hashCode ^
        path.hashCode ^
        remark.hashCode ^
        isLocal.hashCode ^
        shouldSave.hashCode;
  }

  CheckImage copyWith({
    int? seq,
    String? path,
    String? remark,
    bool? isLocal,
    bool? shouldSave,
  }) {
    return CheckImage(
      seq: seq ?? this.seq,
      path: path ?? this.path,
      remark: remark ?? this.remark,
      isLocal: isLocal ?? this.isLocal,
      shouldSave: shouldSave ?? this.shouldSave,
    );
  }
}
