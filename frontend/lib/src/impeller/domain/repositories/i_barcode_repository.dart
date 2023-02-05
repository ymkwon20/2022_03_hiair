import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/impeller/domain/entities/barcode.dart';

abstract class IBarcodeRepository {
  Future<Either<Failure, Barcode>> getQRBarcodeString(
      Map<String, dynamic> params);
}
