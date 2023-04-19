import 'package:frontend/src/workorderCurrent/infrastructure/dtos/current_work_order_list_dto.dart';

abstract class CurrentWorkOrderService {
  Future<CurrentWorkOrderListDto> fetchCurrentWorkOrderList(
      Map<String, dynamic> params);
}
