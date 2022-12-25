import 'dart:convert';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_resp_dto/iamport_response_dto.dart';
import 'package:http/http.dart';

IamportResponseDto toIamportResponseDto(Response response) {
  Map<String, dynamic> responseMap = jsonDecode(utf8.decode(response.bodyBytes)); // 문자열 -> Map

  IamportResponseDto responseDto = IamportResponseDto.fromJson(responseMap); // Map -> Dart Class

  return responseDto;
}
