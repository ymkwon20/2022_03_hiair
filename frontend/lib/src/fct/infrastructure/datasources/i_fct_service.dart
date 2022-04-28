import 'package:frontend/src/fct/domain/entities/fct.dart';

abstract class IFctService {
  Future<List<String>> getFctSerials();
  Future<List<Fct>> getFctItems(String serial);
  Future<void> saveFctItem(List<Map<String, dynamic>> params);
}
