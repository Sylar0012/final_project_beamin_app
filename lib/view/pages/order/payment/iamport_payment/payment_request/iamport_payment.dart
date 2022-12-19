import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list_page.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_req_dto/iamport_data.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/payment_model/quota.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/payment_page.dart';
import 'package:flutter/material.dart';

class PaymentTest extends StatefulWidget {
  @override
  _PaymentTestState createState() => _PaymentTestState();
}

class _PaymentTestState extends State<PaymentTest> {
  final _formKey = GlobalKey<FormState>();
  String pg = 'html5_inicis'; // PG사
  String payMethod = 'card'; // 결제수단
  String cardQuota = '0'; // 할부개월수
  bool digital = false; // 실물컨텐츠 여부
  bool escrow = false; // 에스크로 여부
  String name = "결제 테스트용 상품"; // 주문명
  String amount = "100"; // 결제금액
  String merchantUid = "mid_${DateTime.now().millisecondsSinceEpoch}"; // 주문번호
  String buyerName = "홍길동"; // 구매자 이름
  String buyerTel = "01012345678"; // 구매자 전화번호

  @override
  Widget build(BuildContext context) {
    PaymentData data = ModalRoute.of(context)!.settings.arguments as PaymentData;
    return Scaffold(
      appBar: AppBar(
        title: Text('아임포트 결제', style: textTheme().headline1),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderListPage()));
          },
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'PG사',
                ),
                readOnly: true,
                initialValue: "웹 표준 이니시스",
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '결제수단',
                ),
                readOnly: true,
                initialValue: "신용카드",
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: '할부개월수',
                ),
                value: "${data.cardQuota}",
                onChanged: (String? value) {
                  setState(() {
                    data.cardQuota = int.parse(value!);
                  });
                },
                items: Quota.getListsByPg(pg).map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(Quota.getLabel(value)),
                  );
                }).toList(),
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: '주문명',
                ),
                initialValue: data.name,
                validator: (value) => value!.isEmpty ? '주문명은 필수입력입니다' : null,
                onSaved: (String? value) {
                  name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '결제금액',
                ),
                initialValue: "${data.amount}",
                validator: (value) {
                  if (value!.isEmpty) {
                    return '결제금액은 필수입력입니다.';
                  }
                  if (value.length > 0) {
                    RegExp regex = RegExp(r'^\d+(\.\d+)?$');
                    if (!regex.hasMatch(value)) return '결제금액이 올바르지 않습니다.';
                  }
                  return null;
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSaved: (String? value) {
                  amount = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '주문번호',
                ),
                readOnly: true,
                validator: (value) => value!.isEmpty ? '주문번호는 필수입력입니다' : null,
                initialValue: data.merchantUid,
                onSaved: (String? value) {
                  merchantUid = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '이름',
                ),
                readOnly: true,
                initialValue: data.buyerName,
                onSaved: (String? value) {
                  buyerName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '전화번호',
                ),
                readOnly: true,
                initialValue: buyerTel,
                validator: (value) {
                  if (value!.length > 0) {
                    RegExp regex = RegExp(r'^[0-9]+$');
                    if (!regex.hasMatch(value)) return '전화번호가 올바르지 않습니다.';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onSaved: (String? value) {
                  buyerTel = value!;
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print('creating payment data...');
                      Navigator.pushNamed(
                        context,
                        "/iamportPayment",
                        arguments: PaymentData(
                          pg: data.pg, // 뭘로 결제?
                          payMethod: data.payMethod, // 카드
                          name: data.name, // 상품이름
                          cardQuota: data.cardQuota,
                          amount: data.amount, // 가격
                          merchantUid: data.merchantUid, // 거래 고유번호
                          buyerName: data.buyerName, // 결제자 이름
                          buyerTel: data.buyerTel, // 결제자 번호
                          appScheme: 'flutterexample', // 모바일 웹뷰에서 외부앱 ( 결제창 ) 을 띄우기 위한 코드
                          niceMobileV2: true,
                        ),
                      );
                    }
                  },
                  child: Text(
                    '결제하기',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
