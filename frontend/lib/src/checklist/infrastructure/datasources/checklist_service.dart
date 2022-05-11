import 'package:frontend/src/checklist/domain/entities/check_item.dart';

abstract class ChecklistService {
  Future<List<CheckItem>> fetchChecklist(Map<String, dynamic> params);
  Future<void> saveCheckitem(List<Map<String, dynamic>> params);
}
