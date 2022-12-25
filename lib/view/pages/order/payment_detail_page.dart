import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("배달 완료", style: textTheme().bodyText1),
                SizedBox(height: gap_xs),
                Text("네네 치킨", style: textTheme().headline1),
                SizedBox(height: gap_m),
                Text("주문 일시 : 2022년 12월 20일 오후 06:00", style: textTheme().bodyText2),
                SizedBox(height: gap_xs),
                Text("주문 번호 : 123456778", style: textTheme().bodyText2),
                SizedBox(height: gap_xl),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStoreInfoIcon(CupertinoIcons.phone_solid, "전화"),
                    _buildStoreInfoIcon(CupertinoIcons.building_2_fill, "가게보기"),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 10,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.all(gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("주문 내역", style: textTheme().headline2),
                SizedBox(height: gap_m),
                _buildOrderProduct("레드마블 치킨", "20,000원"),
                SizedBox(height: gap_xs),
                _buildOrderProduct("콜라", "2,000원"),
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 10,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.all(gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOrderMenu("상품 합계", "22,000원"),
                SizedBox(height: gap_s),
                _buildOrderProduct("배달 요금", "3,000원"),
                SizedBox(height: gap_m),
                _buildOrderMenu("결제 금액", "25,000원"),
                SizedBox(height: gap_s),
                _buildOrderProduct("결제 방식", "카드 결제"),
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 10,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.all(gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("배달 주소", style: textTheme().bodyText1),
                SizedBox(height: gap_xxs),
                Text("부산시 진구 1243-1", style: textTheme().bodyText2),
                SizedBox(height: gap_m),
                Text("전화 번호", style: textTheme().bodyText1),
                SizedBox(height: gap_xxs),
                Text("010-1234-1234", style: textTheme().bodyText2),
                SizedBox(height: gap_m),
                Text("요청 사항", style: textTheme().bodyText1),
                SizedBox(height: gap_xxs),
                Text("문 앞에 놔둬 주세요", style: textTheme().bodyText2),
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 10,
            color: Colors.grey[300],
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "주문내역 삭제",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          Divider(
            height: 10,
            thickness: 10,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  Row _buildOrderMenu(String orderCategory, String totalPrice) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(orderCategory, style: textTheme().headline2),
        Text(totalPrice, style: textTheme().headline2),
      ],
    );
  }
}

Row _buildOrderProduct(String productName, String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(productName, style: textTheme().bodyText2),
      Text(price, style: textTheme().bodyText2),
    ],
  );
}

AppBar _buildAppBar(context) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {
        Navigator.pushNamed(context, Routers.main);
      },
      icon: Icon(CupertinoIcons.arrow_left),
    ),
    iconTheme: IconThemeData(color: Colors.black),
    title: Text(
      "결제 정보",
      style: textTheme().headline1,
    ),
    centerTitle: true,
    elevation: 1.0,
  );
}

Widget _buildStoreInfoIcon(CupertinoIcons, String msg) {
  return Row(
    children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                CupertinoIcons,
                color: Colors.red,
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0.5, 1),
                  ),
                ],
              ),
              SizedBox(width: gap_s),
              Text(msg, style: textTheme().bodyText2),
            ],
          ),
        ),
      ),
    ],
  );
}
