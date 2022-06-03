import 'package:frontend/src/work_base/domain/entities/work_base_info.dart';

abstract class WorkBaseService {
  Future<List<WorkBaseInfo>> fetchWorkBases(Map<String, dynamic> params);
}
