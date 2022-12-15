import 'dart:convert';

import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/model/home.dart';
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
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/list", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);

    if (responseDto.data != null) {
      // 1. responseDto.data 를 맵 타입으로 변환
      // Map<String, dynamic> temp = responseDto.data;
      // Logger().d("temp의 타입 : ${temp.runtimeType}");
      // Logger().d(temp["stores"]);

      // 2. 맵 타입으로 변환한 temp stores 로 감싼거 풀고 List에 담음
      List<dynamic> list = responseDto.data["stores"];
      Logger().d("list 의 타입 ${list.runtimeType}");

      // 3. stores 에 json -> dart 변환
      List<Stores> stores = list.map((e) => Stores.fromJson(e)).toList();
      Logger().d(stores);

      // 4. 변환된 데이터를 responseDto.data 에 담음
      responseDto.data = stores;
    }
    return responseDto;
  }

  Future<ResponseDto> fetchStoreCategoryList(String categoryName) async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/${categoryName}/list", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);

    if (responseDto.data != null) {
      // 1. responseDto.data 를 맵 타입으로 변환
      // Map<String, dynamic> temp = responseDto.data;
      // Logger().d("temp의 타입 : ${temp.runtimeType}");
      // Logger().d(temp["stores"]);

      // 2. 맵 타입으로 변환한 temp stores 로 감싼거 풀고 List에 담음
      List<dynamic> list = responseDto.data["stores"];
      Logger().d("list 의 타입 ${list.runtimeType}");

      // 3. stores 에 json -> dart 변환
      List<Stores> stores = list.map((e) => Stores.fromJson(e)).toList();
      Logger().d(stores);

      // 4. 변환된 데이터를 responseDto.data 에 담음
      responseDto.data = stores;
    }
    return responseDto;
  }

  Future<ResponseDto> fetchFavoriteStoreList() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/like/store/list", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);

    if (responseDto.data != null) {
      // 1. responseDto.data 를 맵 타입으로 변환
      // Map<String, dynamic> temp = responseDto.data;
      // Logger().d("temp의 타입 : ${temp.runtimeType}");
      // Logger().d(temp["stores"]);

      // 2. 맵 타입으로 변환한 temp stores 로 감싼거 풀고 List에 담음
      List<dynamic> list = responseDto.data["likes"];
      Logger().d("list 의 타입 ${list.runtimeType}");

      // 3. stores 에 json -> dart 변환
      List<Stores> stores = list.map((e) => Stores.fromJson(e)).toList();
      Logger().d(stores);

      // 4. 변환된 데이터를 responseDto.data 에 담음
      responseDto.data = stores;
    }
    return responseDto;
  }
}
