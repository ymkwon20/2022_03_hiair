import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check_detail.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';

/// Cutting 정보를 가져오는 서비스
abstract class CuttingService {
  Future<List<CuttingSerial>> fetchCuttings();
  Future<List<CuttingCheckDetail>> fetchCuttingRequests(CuttingSerial serial);
  Future<List<CuttingCheck>> fetchCuttingChecks(CuttingSerial serial);
  Future<void> saveCuttingCheck(Map<String, dynamic> params);
}
