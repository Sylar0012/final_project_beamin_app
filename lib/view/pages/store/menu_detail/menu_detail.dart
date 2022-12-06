import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/model/store.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/payment.dart';
import 'package:final_project_beamin_app/view/pages/store/components/store_detail_appber.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuDetail extends StatefulWidget {
  const MenuDetail({Key? key}) : super(key: key);

  @override
  State<MenuDetail> createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  int orderCount = 1;
  int menuPrice = 17000;

  void increase() {
    setState(() {
      if (orderCount < 10) orderCount++;
    });
  }

  void decrease() {
    setState(() {
      if (orderCount > 1) orderCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreDetailAppBer(
        appBar: AppBar(),
        title: "",
        center: false,
      ),
      body: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  border: BorderDirectional(bottom: BorderSide(width: 1, color: Color.fromRGBO(221, 221, 221, 1))),
                  image: DecorationImage(
                    image: AssetImage("assets/images/category/치킨.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment(0, 2),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color.fromRGBO(221, 221, 221, 1), width: 1),
                          color: Colors.white,
                        ),
                        height: 160,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(gap_s),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("후라이드 치킨",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFF1E2D2A), shadows: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: const Offset(0.5, 1),
                                    )
                                  ])),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: gap_l),
                                  Text(
                                    "치킨에 대한 설명이 필요한 공간 ㅇ비니다아 아마도 두줄 내지 3줄은 될듯요 2줄을 해야할듯",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF1E2D2A),
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Divider(
                height: 1,
                thickness: 1,
                color: Color.fromRGBO(221, 221, 221, 1),
              ),
              SizedBox(height: gap_m),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_s),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "수량",
                        style: textTheme().headline1,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              decrease();
                            },
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(),
                            icon: Icon(
                              CupertinoIcons.minus_circle,
                              size: 28,
                            ),
                          ),
                          SizedBox(width: gap_s),
                          Text(
                            '${orderCount}',
                            style: textTheme().headline2,
                          ),
                          SizedBox(width: gap_s),
                          IconButton(
                            onPressed: () {
                              increase();
                            },
                            padding: EdgeInsets.zero, // 패딩 설정
                            constraints: BoxConstraints(),
                            icon: Icon(
                              CupertinoIcons.plus_circle,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: gap_m),
              Divider(
                height: 1,
                thickness: 1,
                color: Color.fromRGBO(221, 221, 221, 1),
              ),
              SizedBox(height: gap_m),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: gap_s),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '총 주문 금액 : ',
                      style: textTheme().headline1,
                    ),
                    Text(
                      '${menuPrice * orderCount} 원',
                      style: textTheme().headline1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_xs, vertical: gap_xs),
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kMainColor),
                    ),
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
                            content: Text("장바구니에 담았습니다!"),
                            action: SnackBarAction(
                              textColor: Colors.white,
                              label: '확인 하기',
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderList()));
                              },
                            ),
                          ),
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StoreDetail()));
                      },
                      child: Text(
                        '장바구니에 담기',
                        style: TextStyle(color: kMainColor, fontSize: 14, height: 1.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_xs, vertical: gap_xs),
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: kMainColor), color: kMainColor),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Payment()));
                      },
                      child: Text(
                        '주문 하기',
                        style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
