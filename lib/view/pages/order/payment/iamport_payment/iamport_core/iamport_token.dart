// main 시작전에 확인이 필요해서 provider가 아닌 static으로 관리

import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_service/iamport_local_service.dart';

class IamportToken {
  static String? _accessToken;

  static get AccessToken => _accessToken;

  static void successAuthentication(String accessToken) {
    _accessToken = accessToken;
  }

  static Future<void> removeAuthentication() async {
    _accessToken = null;
    await IamportLocalService().fetchDeleteJwtToken();
  }

  static Map<String, String> getJwtTokenHeader(Map<String, String> headers) {
    return IamportToken._accessToken == null ? headers : {...headers, "Authorization": IamportToken._accessToken!};
  }
}
