import 'dart:convert';

import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/auth_req_dto.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/dto/user_info_update_req_dto.dart';
import 'package:final_project_beamin_app/model/user.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_util/iamport_util.dart';
import 'package:http/http.dart';
import 'local_service.dart';

class UserService {
  final HttpConnector httpConnector = HttpConnector();

  static final UserService _instance = UserService._single();
  UserService._single();
  factory UserService() {
    return _instance;
  }

  Future<ResponseDto> fetchInactive(bool isActive) async {
    String requestBody = jsonEncode(isActive);
    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/delete", requestBody, UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }

  Future<ResponseDto> fetchInfoUpdate(UserInfoUpdateReqDto userInfoUpdateReqDto) async {
    String requestBody = jsonEncode(userInfoUpdateReqDto.toJson());
    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/update", requestBody, UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      responseDto.data = User.fromJson(responseDto.data);
    }
    return responseDto;
  }

  Future<ResponseDto> fetchJoin(JoinReqDto joinReqDto) async {
    String requestBody = jsonEncode(joinReqDto.toJson());
    Response response = await httpConnector.post("/api/join", requestBody);
    return toResponseDto(response); // ResponseDto 응답
  }

  Future<ResponseDto> fetchLogin(LoginReqDto loginReqDto) async {
    // 1. json 변환
    String requestBody = jsonEncode(loginReqDto.toJson());

    // 2. 통신 시작
    Response response = await httpConnector.post("/login", requestBody);

    // 3. 토큰 받기
    String jwtToken = response.headers["authorization"].toString();

    // 4. 토큰을 디바이스와 세션에 저장
    await secureStorage.write(key: "jwtToken", value: jwtToken); // 자동 로그인시 필요

    // 5. ResponseDto에서 User 꺼내기
    ResponseDto responseDto = toResponseDto(response);

    // 6. AuthProvider에 로긴 정보 저장
    User user = User.fromJson(responseDto.data);
    UserSession.successAuthentication(user, jwtToken);
    return responseDto; // ResponseDto 응답
  }

  Future<ResponseDto> fetchUserInfo() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/detail", UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      // 통신이 성공했을 때만 파싱을 해줘야 한다.
      responseDto.data = UserInfo.fromJson(responseDto.data);
    }
    return responseDto;
  }
}
