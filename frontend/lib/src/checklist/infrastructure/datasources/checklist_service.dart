import 'package:frontend/src/checklist/domain/entities/check_image.dart';
import 'package:frontend/src/checklist/domain/entities/check_item.dart';

abstract class ChecklistService {
  Future<List<CheckItem>> fetchChecklist(Map<String, dynamic> params);
  Future<List<CheckItem>> fetchCutChecklist(Map<String, dynamic> params);
  Future<List<CheckImage>> fetchCheckimagelist(Map<String, dynamic> params);
  Future<void> saveCheckitem(List<Map<String, dynamic>> params);
  Future<void> saveImagelist(List<Map<String, dynamic>> params);
}
