import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/impeller/domain/entities/impeller_list.dart';

abstract class IImpellerRepository {
  Future<Either<Failure, ImpellerList>> fetchImpellerList(
      Map<String, dynamic> params);
  Future<Either<Failure, ImpellerList>> searchImpellerList(
      Map<String, dynamic> params);
  Future<Either<Failure, ImpellerList>> getQRBarcode(
      Map<String, dynamic> params);
  Future<Either<Failure, Unit>> saveImpeller(Map<String, dynamic> params);
  Future<Either<Failure, Unit>> saveImpellerList(
      List<Map<String, dynamic>> params);
}
