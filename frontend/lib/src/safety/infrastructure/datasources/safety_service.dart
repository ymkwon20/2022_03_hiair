import 'package:frontend/src/safety/domain/entities/safety_check.dart';
import 'package:frontend/src/safety/domain/entities/safety_info.dart';

abstract class SafetyService {
  Future<List<SafetyInfo>> fetchSafetyInfos(Map<String, dynamic> params);
  Future<List<SafetyCheck>> fetchSafetyChecks(Map<String, dynamic> params);
  Future<void> saveSafetyChecks(List<Map<String, dynamic>> params);
  Future<void> saveSafetyRepairInfo(Map<String, dynamic> params);
}
