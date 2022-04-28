class LogicConstant {
  const LogicConstant._();

  static const String baseApiServerUrl = "server-url";
  static const String baseImageServerUrl = "server-url";

  /// QM 데이터 조회 할 때마다 가져오는 row 갯수
  ///
  /// DB procedure 조회해보면 page 조회 할 때마다 300 개씩 넘겨받음
  /// 수량이 너무 많다 싶을 때는 관리자에게  문의
  static const int qmFetchCount = 300;
}
