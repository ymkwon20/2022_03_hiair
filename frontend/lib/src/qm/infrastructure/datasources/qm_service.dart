import 'package:frontend/src/qm/domain/entities/qm_item.dart';

abstract class QmService {
  Future<List<QmItem>> fetchQmItems(Map<String, dynamic> params);
  Future<void> saveQmItem(Map<String, dynamic> params);
  Future<void> saveQmList(List<Map<String, dynamic>> params);
}
