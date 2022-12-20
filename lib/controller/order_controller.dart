import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';
import 'package:final_project_beamin_app/service/order_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final orderController = Provider<OrderController>((ref) {
  return OrderController();
});

class OrderController {
  final mContext = navigatorKey.currentContext;
  final OrderService orderService = OrderService();
  Future<void> saveOrder(List<MyOrderRespDto> myOrderRespDto) async {
    ResponseDto responseDto = await orderService.fetchOrderInsert(myOrderRespDto);
    Logger().d("컨트롤러의 responseDto ? $responseDto");
  }
}
