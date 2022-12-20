import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/model/menu_detail.dart';
import 'package:final_project_beamin_app/model/menu_list.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_util/iamport_util.dart';
import 'package:http/http.dart';

class MenuService {
  final HttpConnector httpConnector = HttpConnector();
  static final MenuService _instance = MenuService._single();

  MenuService._single();

  factory MenuService() {
    return _instance;
  }

  Future<ResponseDto> fetchMenuList(int storeId) async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user?.id}/store/${storeId}/menu/list", UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> list = responseDto.data["menus"];
      // 3. stores 에 json -> dart 변환
      List<Menus> menus = list.map((e) => Menus.fromJson(e)).toList();
      responseDto.data = menus;
    }
    return responseDto;
  }

  Future<ResponseDto> fetchMenuDetail(int storeId, int menuId) async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user?.id}/store/${storeId}/menu/${menuId}/detail", UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      // 3. stores 에 json -> dart 변환
      responseDto.data = MenuDetail.fromJson(responseDto.data);
    }
    return responseDto;
  }
}
