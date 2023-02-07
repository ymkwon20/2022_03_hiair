import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/impeller/domain/entities/barcode.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/src/impeller/domain/repositories/i_barcode_repository.dart';
import 'package:frontend/src/impeller/infrastructure/datasources/barcode_service.dart';

class BarcodeRepository implements IBarcodeRepository {
  final BarcodeService _remoteService;

  const BarcodeRepository({
    required BarcodeService remote,
  }) : _remoteService = remote;

  @override
  Future<Either<Failure, Barcode>> getQRBarcodeString(
      Map<String, dynamic> params) async {
    try {
      final remoteFetch = await _remoteService.getQRCode(params);
      return right(remoteFetch.toDomain());
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }
}
