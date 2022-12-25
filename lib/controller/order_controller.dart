import 'package:final_project_beamin_app/dto/payment_req_dto.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/service/order_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderController = Provider<OrderController>((ref) {
  return OrderController();
});

class OrderController {
  final mContext = navigatorKey.currentContext;
  final OrderService orderService = OrderService();
  Future<void> saveOrder(PaymentReqDto paymentReqDto) async {
    ResponseDto responseDto = await orderService.fetchOrderInsert(paymentReqDto);
  }
}
