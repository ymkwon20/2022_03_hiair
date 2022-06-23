import 'package:frontend/src/version/domain/repositories/i_version_repository.dart';

class FetchLocalVersion {
  const FetchLocalVersion({
    required IVersionRepository repository,
  }) : _repository = repository;

  final IVersionRepository _repository;

  Future<String> call() async {
    return _repository.fetchLocalVersion();
  }
}
