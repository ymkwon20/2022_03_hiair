import 'package:frontend/src/qm/domain/entities/qm_menu.dart';

abstract class QmService {
  Future<List<QmMenu>> fetchQmMenulist(Map<String, dynamic> params);
}
