import 'dart:convert';

import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/auth_req_dto.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/model/user.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/view/pages/util/parsing_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'local_service.dart';

class UserService {
  final HttpConnector httpConnector = HttpConnector();

  static final UserService _instance = UserService._single();
  UserService._single();
  factory UserService() {
    return _instance;
  }

  Future<ResponseDto> fetchJoin(JoinReqDto joinReqDto) async {
    String requestBody = jsonEncode(joinReqDto.toJson());
    Response response = await httpConnector.post("/join", requestBody);

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

    Logger().d(jwtToken);
    // 5. ResponseDto에서 User 꺼내기
    ResponseDto responseDto = toResponseDto(response);

    // 6. AuthProvider에 로긴 정보 저장
    User user = User.fromJson(responseDto.data);
    UserSession.successAuthentication(user, jwtToken);
    Logger().d("로그인시 id 값 저장 하나여 ${UserSession.user.id}");
    return responseDto; // ResponseDto 응답
  }

  Future<ResponseDto> fetchUserInfo(int id) async {
    Response response = await httpConnector.get("/user/$id");
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.data != null) {
      // 통신이 성공했을 때만 파싱을 해줘야 한다.
      responseDto.data = User.fromJson(responseDto.data);
    }
    return responseDto;
  }
}
