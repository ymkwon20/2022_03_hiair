import 'package:frontend/src/checklist/domain/entities/checklist.dart';

abstract class ChecklistService {
  Future<List<Checklist>> fetchChecklist(Map<String, dynamic> params);
}
