import 'dart:convert';

import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/model/store_detail.dart';
import 'package:final_project_beamin_app/model/store_info.dart';
import 'package:final_project_beamin_app/model/store_review_find_by_store_id_resp_dto.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_util/iamport_util.dart';
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
    if (responseDto.code == 1) {
      responseDto.data = StoreDetailRespDto.fromJson(responseDto.data);
    }
    return responseDto;
  }

  Future<ResponseDto> fetchStoreinfo(int storeId) async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user?.id}/store/${storeId}/info", UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      responseDto.data = StoreInfo.fromJson(responseDto.data);
    }
    return responseDto;
  }

  Future<ResponseDto> fetchStoreReview(int storeId) async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user?.id}/store/${storeId}/review/list", UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> list = responseDto.data["customerReviewDtoList"];
      List<CustomerReviewDto> customerReviewDtoList = list.map((e) => CustomerReviewDto.fromJson(e)).toList();
      responseDto.data = customerReviewDtoList;
    }
    return responseDto;
  }
}
