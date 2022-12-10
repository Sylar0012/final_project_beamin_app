import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/model/menu_find_by_id_resp_dto.dart';
import 'package:final_project_beamin_app/model/my_order_modal.dart';

import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/util/my_number_formet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum OrderType { delivery, pickup }

class MyOrderListBody extends StatefulWidget {
  const MyOrderListBody({required this.myOrderModal, Key? key}) : super(key: key);
  final MyOrderModal myOrderModal;
  @override
  State<MyOrderListBody> createState() => _MyOrderListBodyState();
}

class _MyOrderListBodyState extends State<MyOrderListBody> {
  OrderType? _orderType = OrderType.delivery;
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
    myOrderListModal.add(widget.myOrderModal);
    print("내 장바구니 목록 : ${myOrderListModal[0]}");
    return Container();
    // return Column(
    //   children: [
    //     Container(
    //       padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SizedBox(height: gap_s),
    //           Text("${menuFindByIdRespDto.store.name}", style: textTheme().headline1),
    //           SizedBox(height: gap_s),
    //           _bulidOrderType("배달", OrderType.delivery, "최소 주문 금액 : ${numberPriceFormat("${menuFindByIdRespDto.price}")}"),
    //           SizedBox(height: gap_s),
    //           _bulidOrderType("포장", OrderType.pickup, "포장 시간 : ${menuFindByIdRespDto.store.deliveryHour}"),
    //           SizedBox(height: gap_s),
    //         ],
    //       ),
    //     ),
    //     Divider(
    //       height: 1,
    //       thickness: 1,
    //       color: Colors.grey[300],
    //     ),
    //     SizedBox(height: gap_m),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: gap_s),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text("${menuFindByIdRespDto.name}", style: textTheme().headline2),
    //           IconButton(
    //             padding: EdgeInsets.zero,
    //             constraints: BoxConstraints(),
    //             onPressed: () {},
    //             icon: Icon(
    //               CupertinoIcons.multiply_square_fill,
    //               color: Colors.grey[400],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(height: gap_s),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: gap_m),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(numberPriceFormat("${menuFindByIdRespDto.price}"), style: textTheme().bodyText1),
    //           Row(
    //             children: [
    //               IconButton(
    //                 onPressed: () {
    //                   decrease();
    //                 },
    //                 padding: EdgeInsets.zero, // 패딩 설정
    //                 constraints: BoxConstraints(),
    //                 icon: Icon(
    //                   CupertinoIcons.minus_circle,
    //                   size: 28,
    //                 ),
    //               ),
    //               SizedBox(width: gap_s),
    //               Text(
    //                 '${orderCount}',
    //                 style: textTheme().headline2,
    //               ),
    //               SizedBox(width: gap_s),
    //               IconButton(
    //                 onPressed: () {
    //                   increase();
    //                 },
    //                 padding: EdgeInsets.zero, // 패딩 설정
    //                 constraints: BoxConstraints(),
    //                 icon: Icon(
    //                   CupertinoIcons.plus_circle,
    //                   size: 28,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(height: gap_m),
    //     Divider(
    //       height: 1,
    //       thickness: 1,
    //       color: Colors.grey[300],
    //     ),
    //     if (_orderType == OrderType.delivery) _buildDelivery(),
    //     if (_orderType == OrderType.pickup) _buildPickUp(),
    //   ],
    // );
  }

  Widget _buildPickUp() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: gap_m),
          child: Column(
            children: [
              SizedBox(height: gap_m),
              _buildOrderPrice("상품 금액", numberPriceFormat("${orderCount}")),
              SizedBox(height: gap_s),
              _buildOrderPrice("결제 금액", numberPriceFormat("${orderCount}")),
              SizedBox(height: gap_m),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
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
                Navigator.pushNamed(context, "/payment");
              },
              child: Text(
                '${numberPriceFormat("${orderCount}")} 주문 하기',
                style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDelivery() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: gap_m),
          child: Column(
            children: [
              SizedBox(height: gap_m),
              _buildOrderPrice("상품 금액", numberPriceFormat("${orderCount}")),
              SizedBox(height: gap_s),
              _buildOrderPrice("배달 비용", numberPriceFormat("${orderCount}")),
              SizedBox(height: gap_s),
              _buildOrderPrice("결제 금액", numberPriceFormat("${(orderCount) + orderCount * orderCount * (orderCount)}")),
              SizedBox(height: gap_m),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
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
                Navigator.pushNamed(context, "/payment");
              },
              child: Text(
                '${numberPriceFormat("${orderCount}")} 주문 하기',
                style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildOrderPrice(String menu, String calculation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(menu, style: textTheme().bodyText1),
        Text("${calculation}", style: textTheme().bodyText1),
      ],
    );
  }

  Widget _bulidOrderType(String orderType, OrderType OT, String msg) {
    return Row(
      // 가로로 진행 (버튼 + 이름)
      children: <Widget>[
        SizedBox(
          height: 20,
          width: 40,
          child: Radio<OrderType>(
            value: OT,
            groupValue: _orderType,
            onChanged: (value) {
              setState(() {
                _orderType = value;
                print('라디오 테스트 : $value');
              });
            },
          ),
        ),
        Text(orderType, style: textTheme().headline2),
        SizedBox(width: gap_s),
        Text(msg, style: textTheme().bodyText2),
      ],
    );
  }
}
