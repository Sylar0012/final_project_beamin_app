import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/model/order_list.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/view/pages/util/parsing_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class OrderService {
  final HttpConnector httpConnector = HttpConnector();
  static final OrderService _instance = OrderService._single();

  OrderService._single();

  factory OrderService() {
    return _instance;
  }
  Future<ResponseDto> fetchOrderHistory() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user?.id}/order/history/list", UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("responseDto 실행됨? ${responseDto.data}");
    if (responseDto.code == 1) {
      Logger().d("responseDto.data 의 타입 = ${responseDto.data.runtimeType}");
      List<dynamic> list = responseDto.data["orders"];
      Logger().d("orders로 파싱한 responseDto.data 의 타입 = ${list.runtimeType}");
      List<OrderHistory> orderHistorys = list.map((e) => OrderHistory.fromJson(e)).toList();
      // 3. stores 에 json -> dart 변환

      Logger().d(orderHistorys);
      responseDto.data = orderHistorys;
    }
    return responseDto;
  }
}
