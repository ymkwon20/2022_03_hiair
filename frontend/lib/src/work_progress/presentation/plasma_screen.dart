import 'package:flutter/material.dart';

class PlasmaScreen extends StatelessWidget {
  const PlasmaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Plasma'),
      ),
    );
  }
}

class PlangeScreen extends StatelessWidget {
  const PlangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Plange'),
      ),
    );
  }
}

class FanScreen extends StatelessWidget {
  const FanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Fan'),
      ),
    );
  }
}
