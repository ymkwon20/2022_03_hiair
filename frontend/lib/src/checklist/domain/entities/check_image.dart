class CheckImage {
  /// PHT_SEQ: sequence
  final int seq;
  final String path;
  final String remark;
  final bool isLocal;

  const CheckImage({
    required this.seq,
    required this.path,
    required this.remark,
    this.isLocal = false,
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
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CheckImage &&
        other.seq == seq &&
        other.path == path &&
        other.remark == remark &&
        other.isLocal == isLocal;
  }

  @override
  int get hashCode {
    return seq.hashCode ^ path.hashCode ^ remark.hashCode ^ isLocal.hashCode;
  }

  CheckImage copyWith({
    int? seq,
    String? path,
    String? remark,
    bool? isLocal,
  }) {
    return CheckImage(
      seq: seq ?? this.seq,
      path: path ?? this.path,
      remark: remark ?? this.remark,
      isLocal: isLocal ?? this.isLocal,
    );
  }
}
