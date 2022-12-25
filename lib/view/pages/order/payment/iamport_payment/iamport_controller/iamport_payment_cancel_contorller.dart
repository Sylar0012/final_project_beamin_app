import 'package:final_project_beamin_app/dto/auth_req_dto.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_req_dto/iamport_login_req_dto.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_req_dto/iamport_payment_cancel_req_dto.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_resp_dto/iamport_response_dto.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_service/iamport_payment_cancel_service.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/payment_cancel_request/iamport_payment_cancel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final paymentCancelController = Provider<PaymentCancelController>((ref) {
  return PaymentCancelController(ref);
});

class PaymentCancelController {
  final mContext = navigatorKey.currentContext;
  final PaymentCancelService paymentCancelService = PaymentCancelService();
  final Ref _ref;

  PaymentCancelController(this._ref);

  Future<void> login() async {
    // 1. DTO 변환
    IamPortLoginReqDto loginReqDto = IamPortLoginReqDto();
    // 2. 통신 요청
    IamportResponseDto responseDto = await paymentCancelService.fetchPaymentlogin(loginReqDto);

    //3. 비지니스 로직 처리
    if (responseDto.code == 0) {
      Navigator.push(mContext!, MaterialPageRoute(builder: (context) => PaymentCancelTest()));
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
          content: Text("아이디 또는 비밀번호가 다릅니다."),
        ),
      );
    }
  }

  Future<void> paymentCancel(String impUid, String merchantUid, int amount, int taxFree, String checkSum, String reason) async {
    PaymentsCancelReqDto paymentsCancelReqDto = PaymentsCancelReqDto(impUid: impUid, merchantUid: merchantUid, amount: amount, taxFree: taxFree, checkSum: checkSum, reason: reason);

    IamportResponseDto responseDto = await paymentCancelService.fetchPaymentCancel(paymentsCancelReqDto);
    Logger().d("responseDto : ${responseDto.code}");
    Logger().d("responseDto : ${responseDto.message}");
    Logger().d("responseDto : ${responseDto.response}");
    if (responseDto.code == 0) {
      Navigator.push(mContext!, MaterialPageRoute(builder: (context) => PaymentCancelTest()));
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
          content: Text("아이디 또는 비밀번호가 다릅니다."),
        ),
      );
    }
  }
}
