import 'package:frontend/src/fct/domain/entities/fct.dart';

/// Implementations are seperated for architectural reasons.
/// To find implementation details,
/// go to lib/src/fct/infrastructure/repositories/fct_repository.dart
/// for implementation
abstract class IFctService {
  Future<List<String>> getFctSerials();
  Future<List<Fct>> getFctItems(String serial);
  Future<void> saveFctItem(List<Map<String, dynamic>> params);
}
