import 'package:frontend/src/workorder/infrastructure/dtos/qm_work_order_list_dto.dart';
import 'package:frontend/src/workorder/infrastructure/dtos/work_order_list_dto.dart';

abstract class WorkOrderService {
  Future<WorkOrderListDto> fetchWorkOrderList(Map<String, dynamic> params);
  Future<WorkOrderListDto> searchWorkOrderList(Map<String, dynamic> params);
  Future<void> updateRemark(Map<String, dynamic> params);
  Future<void> saveWorkOrder(Map<String, dynamic> params);
  Future<void> saveWorkOrderList(List<Map<String, dynamic>> params);
  Future<void> startCancelWorkOrder(Map<String, dynamic> params);
  Future<void> startCancelWorkOrderList(List<Map<String, dynamic>> params);
  Future<QmWorkOrderListDto> fetchQmWorkOrder();
  Future<void> saveQmWorkOrder(Map<String, dynamic> params);
  Future<QmWorkOrderListDto> searchQmWorkOrder(Map<String, dynamic> params);
}
