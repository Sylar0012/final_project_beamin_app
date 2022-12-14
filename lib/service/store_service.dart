import 'dart:convert';

import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/model/store_detail.dart';
import 'package:final_project_beamin_app/model/store_info.dart';
import 'package:final_project_beamin_app/model/store_review_find_by_store_id_resp_dto.dart';
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

  Future<ResponseDto> fetchStoreinfo(int storeId) async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user?.id}/store/${storeId}/info", UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("responseDto 실행됨? ${responseDto.data}");
    if (responseDto.code == 1) {
      Logger().d("responseDto.data 의 타입 = ${responseDto.data.runtimeType}");
      responseDto.data = StoreInfo.fromJson(responseDto.data);
      Logger().d("responseDto.data 의 타입 = ${responseDto.data.runtimeType}");
    }
    return responseDto;
  }

  Future<ResponseDto> fetchStoreReview(int storeId) async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user?.id}/store/${storeId}/review/list", UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("responseDto 실행됨? ${responseDto.data}");
    if (responseDto.code == 1) {
      Logger().d("responseDto.data 의 타입 = ${responseDto.data.runtimeType}");
      List<dynamic> list = responseDto.data["customerReviewDtoList"];
      Logger().d("customerReviewDtoList 로 한번 푼 responseDto.data 의 타입 = ${list}");
      List<CustomerReviewDto> customerReviewDtoList = list.map((e) => CustomerReviewDto.fromJson(e)).toList();
      Logger().d("customerReviewDtoList 의 내용 : ${customerReviewDtoList}");
      Logger().d("customerReviewDtoList 의 타입 : ${customerReviewDtoList.runtimeType}");
      responseDto.data = customerReviewDtoList;
    }
    return responseDto;
  }
}
