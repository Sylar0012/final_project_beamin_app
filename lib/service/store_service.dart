import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/model/store_detail.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/view/pages/util/parsing_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class StoreService {
  final HttpConnector httpConnector = HttpConnector();
  static final StoreService _instance = StoreService._single();

  StoreService._single();

  factory StoreService() {
    return _instance;
  }

  Future<ResponseDto> fetchStoreDetail(int storeId) async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user?.id}/store/${storeId}/detail", UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("responseDto 실행됨? ${responseDto.data}");
    if (responseDto.code == 1) {
      Logger().d("responseDto.data 의 타입 = ${responseDto.data.runtimeType}");
      responseDto.data = StoreDetailRespDto.fromJson(responseDto.data);
      Logger().d("responseDto.data 의 타입 = ${responseDto.data.runtimeType}");
    }
    return responseDto;
  }
}
