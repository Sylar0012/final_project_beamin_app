import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/model/store_find_all_resp_dto.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/view/pages/util/parsing_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class MainService {
  final HttpConnector httpConnector = HttpConnector();
  static final MainService _instance = MainService._single();

  MainService._single();

  factory MainService() {
    return _instance;
  }

  Future<ResponseDto> fetchStoreList() async {
    Response response = await httpConnector.getInitSession("/api/user/1/store/list", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);

    Logger().d("responseDto msg : ${responseDto.msg}");
    Logger().d("responseDto data : ${responseDto.data}");

    if (responseDto.data != null) {
      List<dynamic> mapList = responseDto.data; // dynamic
      List storeFindAllList = mapList.map((e) => StoreFindAllRespDto.fromJson(e)).toList();
      responseDto.data = storeFindAllList;
    }
    return responseDto;
  }
}
