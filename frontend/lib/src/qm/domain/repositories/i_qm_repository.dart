import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/qm/domain/entities/qm_menu.dart';

abstract class IQmRepository {
  Future<Either<Failure, List<QmMenu>>> fetchQmMenulist(
      Map<String, dynamic> params);
}
