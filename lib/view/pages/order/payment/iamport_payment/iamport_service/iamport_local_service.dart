import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_core/iamport_http_connector.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_core/iamport_token.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_resp_dto/iamport_response_dto.dart';
import 'package:final_project_beamin_app/view/pages/util/parsing_util.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

const secureStorage = FlutterSecureStorage();

class IamportLocalService {
  final IamporthttpConnector iamporthttpConnector = IamporthttpConnector();

  static final IamportLocalService _instance = IamportLocalService._single();

  IamportLocalService._single();

  factory IamportLocalService() {
    return _instance;
  }

  Future<void> fetchJwtToken() async {
    String? deviceJwtToken = await secureStorage.read(key: "access_token");
    if (deviceJwtToken != null) {
      Response response = await iamporthttpConnector.getInitSession("/access_token", deviceJwtToken);
      IamportResponseDto responseDto = toIamportResponseDto(response);

      if (responseDto.code == 0) {
        IamportToken.successAuthentication(deviceJwtToken);
      }
    }
  }

  Future<void> fetchDeleteJwtToken() async {
    await secureStorage.delete(key: "jwtToken");
  }
}
