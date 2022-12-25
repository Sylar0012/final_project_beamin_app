import 'dart:convert';

import 'package:final_project_beamin_app/service/local_service.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_core/iamport_http_connector.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_core/iamport_token.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_req_dto/iamport_login_req_dto.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_req_dto/iamport_payment_cancel_req_dto.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_resp_dto/iamport_response_dto.dart';
import 'package:final_project_beamin_app/view/pages/util/parsing_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class PaymentCancelService {
  final IamporthttpConnector httpConnector = IamporthttpConnector();

  static final PaymentCancelService _instance = PaymentCancelService._single();
  PaymentCancelService._single();
  factory PaymentCancelService() {
    return _instance;
  }

  Future<IamportResponseDto> fetchPaymentCancel(PaymentsCancelReqDto paymentsCancelReqDto) async {
    String requestBody = jsonEncode(paymentsCancelReqDto.toJson());
    Logger().d("requestBody : ${requestBody.toString()}");
    Logger().d("IamportToken : ${IamportToken.AccessToken}");
    Response response = await httpConnector.postInitSession("payments/cancel", requestBody, IamportToken.AccessToken);

    IamportResponseDto responseDto = toIamportResponseDto(response);
    if (responseDto.code == 0) {
      Logger().d("환불 성공");
    }
    return responseDto;
  }

  Future<IamportResponseDto> fetchPaymentlogin(IamPortLoginReqDto loginReqDto) async {
    // 1. json 변환
    String requestBody = jsonEncode(loginReqDto.toJson());
    // 2. 통신 시작
    Response response = await httpConnector.post("/users/getToken", requestBody);
    IamportResponseDto responseDto = toIamportResponseDto(response);

    // 3. 토큰 받기
    String accessToken = responseDto.response["access_token"].toString();

    // 4. 토큰을 디바이스와 세션에 저장
    await secureStorage.write(key: "access_token", value: accessToken); // 자동 로그인시 필요

    // 5. AuthProvider에 로긴 정보 저장
    IamportToken.successAuthentication(accessToken);

    Logger().d("토큰 저장 ? : ${IamportToken.AccessToken}");

    return responseDto; // ResponseDto 응답
  }
}
