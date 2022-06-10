class LogicConstant {
  const LogicConstant._();

  // static const String baseApiServerUrl = "http://192.168.0.117:9090";
  static const String baseApiServerUrl = "http://172.16.30.105:9090";
  static const String baseImageServerUrl = "http://172.16.30.105/IMAGE/CAM_NO";
  static const String baseFileServerUrl = "http://172.16.30.105/FILE_UPLOAD";

  /// QM 데이터 조회 할 때마다 가져오는 row 갯수
  ///
  /// DB procedure 조회해보면 page 조회 할 때마다 300 개씩 넘겨받음
  /// 수량이 너무 많다 싶을 때는 PM에게  문의
  static const int qmFetchCount = 300;
}
