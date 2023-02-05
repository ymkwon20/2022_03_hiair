import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/impeller/domain/entities/barcode.dart';
import 'package:frontend/src/impeller/domain/repositories/i_barcode_repository.dart';

class GetQRBarcode {
  final IBarcodeRepository _repository;

  const GetQRBarcode({
    required IBarcodeRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, Barcode>> call(Map<String, dynamic> params) async {
    return _repository.getQRBarcodeString(params);
  }
}
