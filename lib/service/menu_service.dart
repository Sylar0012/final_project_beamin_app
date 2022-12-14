import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/model/menu_detail.dart';
import 'package:final_project_beamin_app/model/menu_list.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/view/pages/util/parsing_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

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
    Logger().d("responseDto 실행됨? ${responseDto.data}");
    if (responseDto.code == 1) {
      Logger().d("responseDto.data 의 타입 = ${responseDto.data.runtimeType}");
      List<dynamic> list = responseDto.data["menus"];
      Logger().d("MenuListRespDto로 파싱한 responseDto.data 의 타입 = ${list.runtimeType}");
      // 3. stores 에 json -> dart 변환
      List<Menus> menus = list.map((e) => Menus.fromJson(e)).toList();
      Logger().d(menus);
      responseDto.data = menus;
    }
    return responseDto;
  }

  Future<ResponseDto> fetchMenuDetail(int storeId, int menuId) async {
    Response response =
        await httpConnector.getInitSession("/api/user/${UserSession.user?.id}/store/${storeId}/menu/${menuId}/detail", UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("responseDto 실행됨? ${responseDto.data}");
    if (responseDto.code == 1) {
      Logger().d("responseDto.data 의 타입 = ${responseDto.data.runtimeType}");

      // 3. stores 에 json -> dart 변환
      responseDto.data = MenuDetail.fromJson(responseDto.data);
      Logger().d(responseDto.data);
    }
    return responseDto;
  }
}
