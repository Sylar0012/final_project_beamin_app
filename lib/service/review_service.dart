import 'dart:convert';

import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/dto/user_review_req_dto.dart';
import 'package:final_project_beamin_app/model/store_review_find_by_store_id_resp_dto.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/view/pages/util/parsing_util.dart';
import 'package:http/http.dart';

class ReviewService {
  final HttpConnector httpConnector = HttpConnector();
  static final ReviewService _instance = ReviewService._single();

  ReviewService._single();

  factory ReviewService() {
    return _instance;
  }
  Future<ResponseDto> fetchReviewWrite(UserReviewReqDto userReviewReqDto, int storeId, int orderId) async {
    String requestBody = jsonEncode(userReviewReqDto.toJson());
    Response response = await httpConnector.postInitSession(
        "/api/user/${UserSession.user.id}/store/$storeId/order/$orderId/review/save", requestBody, UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      responseDto.data = UserReviewReqDto.fromJson(responseDto.data);
    }
    return responseDto;
  }
}
