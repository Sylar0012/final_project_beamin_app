import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_req_dto/iamport_data.dart';

class IamportValidation {
  bool isValid = true;
  String? errorMessage;

  IamportValidation(String userCode, PaymentData data, Function callback) {
    if (data.pg == 'syrup') {
      isValid = false;
      errorMessage = '해당 모듈은 해당 PG사를 지원하지 않습니다.';
      return;
    }
  }
  bool getIsValid() {
    return isValid;
  }

  String? getErrorMessage() {
    return errorMessage;
  }
}
