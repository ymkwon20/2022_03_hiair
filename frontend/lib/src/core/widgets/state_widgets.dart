import 'package:flutter/material.dart';

import 'package:frontend/src/core/constants/layout_constant.dart';

/// 초기 상태시 위젯
class InitialStateWidget extends StatelessWidget {
  const InitialStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Initial"),
    );
  }
}

/// 로딩 중 상태시 위젯
class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: LayoutConstant.spaceS,
      ),
    );
  }
}

/// 오류가 발생했을 시 위젯
class FailureStateWidget extends StatelessWidget {
  const FailureStateWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "오류가 발생하였습니다.\n내용은 다음과 같습니다.\n\n$message",
        textAlign: TextAlign.center,
      ),
    );
  }
}
