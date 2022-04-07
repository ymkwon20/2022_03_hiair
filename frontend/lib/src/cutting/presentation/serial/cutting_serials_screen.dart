import 'package:flutter/material.dart';
import 'package:frontend/src/core/widgets/responsive_widget.dart';
import 'package:frontend/src/cutting/presentation/serial/cutting_serials_page.dart';

class CuttingSerialsScreen extends StatelessWidget {
  const CuttingSerialsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobile: CuttingSerialsPage(),
      tablet: CuttingSerialsPage(),
      desktop: CuttingSerialsPage(),
    );
  }
}
