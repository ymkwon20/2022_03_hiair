import 'package:frontend/src/impeller/infrastructure/dtos/impeller_dto.dart';
import 'package:frontend/src/impeller/infrastructure/dtos/impeller_list_dto.dart';

abstract class ImpellerService {
  Future<ImpellerListDto> fetchImpellerList(Map<String, dynamic> params);
  Future<ImpellerListDto> searchImpellerList(Map<String, dynamic> params);
  Future<ImpellerDto> getQRCode(Map<String, dynamic> params);
  Future<String> getQRString(Map<String, dynamic> params);
  Future<void> saveImpeller(Map<String, dynamic> params);
  Future<void> saveImpellerList(List<Map<String, dynamic>> params);
}
