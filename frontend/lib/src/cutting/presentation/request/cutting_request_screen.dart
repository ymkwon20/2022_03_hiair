import 'package:flutter/material.dart';
import 'package:frontend/src/core/widgets/responsive_widget.dart';
import 'package:frontend/src/cutting/presentation/request/cutting_request_page.dart';

class CuttingRequestScreen extends StatelessWidget {
  const CuttingRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobile: CuttingRequestPage(),
      tablet: CuttingRequestPage(),
      desktop: CuttingRequestPage(),
    );
  }
}
