import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_req_dto/iamport_data.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/payment_model/utils.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/payment_page/iamport.dart';
import 'package:final_project_beamin_app/view/pages/order/payment_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class IamportPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PaymentData data = ModalRoute.of(context)!.settings.arguments as PaymentData;
    Logger().d("data : ${data}");
    return IamportPayment(
      appBar: AppBar(
        title: Text('아임포트 결제', style: textTheme().headline1),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentDetail()));
              },
              child: Text("결제 완료", style: textTheme().headline1)),
        ],
      ),
      initialChild: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ),
      userCode: Utils.getUserCodeByPg(data.pg),
      data: data,
      callback: (Map<String, String> result) {
        Logger().d("이거 실행됨 ~~");
        Navigator.pushReplacementNamed(context, "/iamportresult", arguments: result);
      },
    );
  }
}
