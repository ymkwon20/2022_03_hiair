import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:go_router/go_router.dart';

class CuttingScreen extends StatelessWidget {
  const CuttingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildButton(
              context,
              title: "철판불출확인",
              onTap: () {
                context.push("/fct");
              },
            ),
            const SizedBox(width: LayoutConstant.spaceM),
            _buildButton(
              context,
              title: "네스팅 요청서 작성",
              onTap: () {
                context.push("/cut");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
