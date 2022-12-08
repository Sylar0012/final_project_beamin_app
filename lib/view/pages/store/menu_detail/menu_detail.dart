import 'dart:math';

import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/model/menu_find_by_id_resp_dto.dart';
import 'package:final_project_beamin_app/model/menu_find_by_store_id_resp_dto.dart';
import 'package:final_project_beamin_app/model/store.dart';
import 'package:final_project_beamin_app/model/store_detail_resp_dto.dart';
import 'package:final_project_beamin_app/model/store_find_all_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/payment.dart';
import 'package:final_project_beamin_app/view/pages/store/components/store_detail_appber.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_detail.dart';
import 'package:final_project_beamin_app/view/pages/util/number_formet/my_number_formet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuDetail extends StatefulWidget {
  const MenuDetail({Key? key}) : super(key: key);

  @override
  State<MenuDetail> createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  int orderCount = 1;

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
    var menuFindByStoreIdRespDto = ModalRoute.of(context)!.settings.arguments as MenuFindByStoreIdRespDto;

    final list = [];
    for (int i = 0; i < menuFindByIdRespDtoList.length; i++) {
      if (menuFindByStoreIdRespDto.id == menuFindByIdRespDtoList[i].id) {
        list.add(menuFindByIdRespDtoList[i]);
      }
    }
    MenuFindByIdRespDto menuFindByIdRespDto = list[0];

    return Scaffold(
      appBar: StoreDetailAppBer(appBar: AppBar(), title: "", center: false),
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
                    image: AssetImage("${menuFindByIdRespDto.thumbnail}"),
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
                              Text(menuFindByIdRespDto.name,
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
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      menuFindByIdRespDto.intro,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF1E2D2A),
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                      numberPriceFormat("${menuFindByIdRespDto.price * orderCount}"),
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
                                print("스낵바에서 id값 던지나요? 이거 메뉴 아이디임 ${menuFindByIdRespDto.id}");
                                print("혹시 이거 몇개인지 못알아서 터지는 건가요? ${menuFindByIdRespDtoList.length}");
                                Navigator.pushNamed(context, "/myOrderList", arguments: menuFindByIdRespDto.id);
                              },
                            ),
                          ),
                        );

                        Navigator.popAndPushNamed(
                          context,
                          "/storeDetail",
                          arguments: StoreDetailRespDto(
                              id: menuFindByStoreIdRespDto.store.id,
                              name: "",
                              thumbnail: "",
                              starPoint: 0,
                              phone: "",
                              minAmount: 0,
                              deliveryHour: "",
                              deliveryCost: 0,
                              customerReviewCount: 0,
                              ceoReviewCount: 0,
                              likeCount: 0),
                        );
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
