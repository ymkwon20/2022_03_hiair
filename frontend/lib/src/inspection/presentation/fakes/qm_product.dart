/// QM 검사리스트 아이템
class QmProduct {
  /// 프로젝트번호
  final String projectNo;

  /// 작업지시번호
  final String orderNo;

  /// Hull No
  final String hullNo;

  /// 품번
  final String productNo;

  /// 품명
  final String productName;

  /// yard
  final String yard;

  /// SYSNO
  final String sysNo;

  /// 규격
  /// - 품번 정보와 거의 동일한듯 보임
  final String standard;

  /// 수량
  final int qty;

  /// 사이즈
  /// - 품번 정보의 뒷자리 숫자와 동일한 듯 보임
  final String size;

  /// 방폭여부
  final String explosionProof;

  /// 상세 페이지에 기술 되어 있는 정보들
  ///
  /// 공정 진행상태
  final String progress;

  /// 현 공정
  final String currentProcess;

  /// Type
  final String type;

  /// 검사 완료 여부
  final bool isInspected;

  const QmProduct({
    required this.projectNo,
    required this.orderNo,
    required this.hullNo,
    required this.productNo,
    required this.productName,
    required this.yard,
    required this.sysNo,
    required this.standard,
    required this.qty,
    required this.size,
    required this.explosionProof,
    required this.progress,
    required this.currentProcess,
    required this.type,
    this.isInspected = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QmProduct &&
        other.projectNo == projectNo &&
        other.orderNo == orderNo &&
        other.hullNo == hullNo &&
        other.productNo == productNo &&
        other.productName == productName &&
        other.yard == yard &&
        other.sysNo == sysNo &&
        other.standard == standard &&
        other.qty == qty &&
        other.size == size &&
        other.explosionProof == explosionProof &&
        other.progress == progress &&
        other.currentProcess == currentProcess &&
        other.type == type &&
        other.isInspected == isInspected;
  }

  @override
  int get hashCode {
    return projectNo.hashCode ^
        orderNo.hashCode ^
        hullNo.hashCode ^
        productNo.hashCode ^
        productName.hashCode ^
        yard.hashCode ^
        sysNo.hashCode ^
        standard.hashCode ^
        qty.hashCode ^
        size.hashCode ^
        explosionProof.hashCode ^
        progress.hashCode ^
        currentProcess.hashCode ^
        type.hashCode ^
        isInspected.hashCode;
  }

  QmProduct copyWith({
    String? projectNo,
    String? orderNo,
    String? hullNo,
    String? productNo,
    String? productName,
    String? yard,
    String? sysNo,
    String? standard,
    int? qty,
    String? size,
    String? explosionProof,
    String? progress,
    String? currentProcess,
    String? type,
    bool? isInspected,
  }) {
    return QmProduct(
      projectNo: projectNo ?? this.projectNo,
      orderNo: orderNo ?? this.orderNo,
      hullNo: hullNo ?? this.hullNo,
      productNo: productNo ?? this.productNo,
      productName: productName ?? this.productName,
      yard: yard ?? this.yard,
      sysNo: sysNo ?? this.sysNo,
      standard: standard ?? this.standard,
      qty: qty ?? this.qty,
      size: size ?? this.size,
      explosionProof: explosionProof ?? this.explosionProof,
      progress: progress ?? this.progress,
      currentProcess: currentProcess ?? this.currentProcess,
      type: type ?? this.type,
      isInspected: isInspected ?? this.isInspected,
    );
  }
}
