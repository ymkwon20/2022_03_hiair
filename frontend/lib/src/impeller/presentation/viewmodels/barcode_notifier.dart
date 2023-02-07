import 'package:flutter/material.dart';
import 'package:frontend/src/impeller/domain/entities/barcode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final barcodeNotifier =
    ChangeNotifierProvider.autoDispose((ref) => BarcodeNotifier());

final barcodeStringNotifier = Provider<Barcode>(
  (ref) => throw UnimplementedError(),
);

class BarcodeNotifier with ChangeNotifier {
  Barcode _barcode = Barcode(qrBarcodeString: "");

  Barcode get item => _barcode;

  void setOrderList(Barcode value) {
    _barcode = value;
    notifyListeners();
  }
}
