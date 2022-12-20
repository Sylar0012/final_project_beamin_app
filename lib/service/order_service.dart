import 'dart:convert';

import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/payment_req_dto.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/model/order_list.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_util/iamport_util.dart';
import 'package:http/http.dart';

class OrderService {
  final HttpConnector httpConnector = HttpConnector();
  static final OrderService _instance = OrderService._single();

  OrderService._single();

  factory OrderService() {
    return _instance;
  }
  Future<ResponseDto> fetchOrderInsert(PaymentReqDto paymentReqDto) async {
    String requestBody = jsonEncode(paymentReqDto);
    Response response = await httpConnector.postInitSession("/api/user/${UserSession.user.id}/store/${paymentReqDto.orderDetailList[0].storeId}/order/insert", requestBody, UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);

    return responseDto;
  }

  Future<ResponseDto> fetchOrderHistory() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/order/history/list", UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> list = responseDto.data["orders"];
      List<OrderHistory> orderHistorys = list.map((e) => OrderHistory.fromJson(e)).toList();
      // 3. stores 에 json -> dart 변환
      responseDto.data = orderHistorys;
    }
    return responseDto;
  }
}
