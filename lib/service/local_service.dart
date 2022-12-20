import 'package:final_project_beamin_app/core/http_connector.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/model/user.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_util/iamport_util.dart';
import 'package:final_project_beamin_app/view/pages/util/parsing_util.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

const secureStorage = FlutterSecureStorage();

class LocalService {
  final HttpConnector httpConnector = HttpConnector();

  static final LocalService _instance = LocalService._single();
  LocalService._single();
  factory LocalService() {
    return _instance;
  }

  Future<void> fetchJwtToken() async {
    String? deviceJwtToken = await secureStorage.read(key: "jwtToken");
    if (deviceJwtToken != null) {
      Response response = await httpConnector.getInitSession("/jwtToken", deviceJwtToken);
      ResponseDto responseDto = toResponseDto(response);

      if (responseDto.data != null) {
        User user = User.fromJson(responseDto.data);
        UserSession.successAuthentication(user, deviceJwtToken);
      } else {
        UserSession.removeAuthentication();
      }
    }
  }

  Future<void> fetchDeleteJwtToken() async {
    await secureStorage.delete(key: "jwtToken");
  }
}
