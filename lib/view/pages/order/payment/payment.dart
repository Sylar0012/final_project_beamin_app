import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/order_detail.dart';
import 'package:flutter/material.dart';

enum Comment { defaultMsg, costomMsg }

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Comment? _comment = Comment.defaultMsg;
  int selectedId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("주문자 정보", style: textTheme().headline1),
                SizedBox(height: gap_s),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_s),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("연락 받을 번호 : 010-0000-0000", style: textTheme().bodyText2),
                      SizedBox(height: gap_s),
                      Text("경상남도 김해시 외동 9999-9", style: textTheme().bodyText2),
                      SizedBox(height: gap_s),
                      _buildTextFormField("상세 주소", double.infinity),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("주문 요청 사항", style: textTheme().headline1),
                SizedBox(height: gap_s),
                _bulidOrderType(Comment.defaultMsg, "문 앞에 놔둬 주세요"),
                SizedBox(height: gap_s),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bulidOrderType(Comment.costomMsg, ""),
                    _buildTextFormField("주문시 요청 사항", 300),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("결제 수단", style: textTheme().headline1),
                SizedBox(height: gap_s),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: gap_m),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _bulidPaymentButton(1, "카카오 페이"),
                      _bulidPaymentButton(2, "네이버 페이"),
                    ],
                  ),
                ),
                SizedBox(height: gap_m),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: gap_m),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _bulidPaymentButton(3, "휴대폰 결제"),
                      _bulidPaymentButton(4, "카드 결제"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("주문 내역", style: textTheme().headline1),
                SizedBox(height: gap_s),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_s),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("후라이드 치킨", style: textTheme().bodyText2),
                      Text("17,000원", style: textTheme().bodyText2),
                    ],
                  ),
                ),
                SizedBox(height: gap_s),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_s),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("배달 비용", style: textTheme().bodyText2),
                      Text("3,000원", style: textTheme().bodyText2),
                    ],
                  ),
                ),
                SizedBox(height: gap_s),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_s),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("결제 금액", style: textTheme().bodyText1),
                      Text("20,000원", style: textTheme().bodyText1),
                    ],
                  ),
                ),
                SizedBox(height: gap_m),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_m),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: kMainColor),
                      color: kMainColor,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetail()));
                      },
                      child: Text(
                        '주문 하기',
                        style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bulidPaymentButton(int id, String paymentWay) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: id == selectedId ? kMainColor : null,
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedId = id;
          });
          print("선택한 번호 : ${id}");
        },
        child: Text(
          paymentWay,
          style: TextStyle(color: id == selectedId ? Colors.white : Colors.grey, fontSize: 14, height: 1.0),
        ),
      ),
    );
  }

  Widget _bulidOrderType(Comment CT, String? msg) {
    return Row(
      // 가로로 진행 (버튼 + 이름)
      children: <Widget>[
        SizedBox(
          height: 20,
          width: 40,
          child: Radio<Comment>(
            value: CT,
            groupValue: _comment,
            onChanged: (value) {
              setState(() {
                _comment = value;
                print('라디오 테스트 : $value');
              });
            },
          ),
        ),
        Text("${msg}", style: textTheme().bodyText2),
      ],
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    title: Text(
      "주문 하기",
      style: textTheme().headline1,
    ),
    centerTitle: true,
    elevation: 1.0,
  );
}

Widget _buildTextFormField(String? hintMsg, double setWidth) {
  return Container(
    height: 30,
    width: setWidth,
    child: TextFormField(
      scrollPadding: EdgeInsets.zero,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.bottom,
      validator: (value) => value!.isEmpty ? "값을 넣어 주세요" : null,
      obscureText: hintMsg == "비밀번호" ? true : false,
      decoration: InputDecoration(
        hintText: "${hintMsg}를(을) 입력하세요",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}