import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/impeller/domain/entities/impeller_list.dart';
import 'package:frontend/src/impeller/domain/repositories/i_impeller_repository.dart';

class GetQRBarcode {
  final IImpellerRepository _repository;

  const GetQRBarcode({
    required IImpellerRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, ImpellerList>> call(
      Map<String, dynamic> params) async {
    return _repository.getQRBarcode(params);
  }
}
