import 'package:frontend/src/qm/infrastructure/dtos/qm_item_list_dto.dart';

abstract class QmService {
  Future<QmItemListDto> fetchQmItems(Map<String, dynamic> params);
  Future<void> saveQmItem(Map<String, dynamic> params);
  Future<void> saveQmList(List<Map<String, dynamic>> params);
}
