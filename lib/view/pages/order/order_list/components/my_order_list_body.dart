import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';
import 'package:final_project_beamin_app/model/payment_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/payment_page.dart';
import 'package:final_project_beamin_app/view/pages/util/my_number_formet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum OrderType { delivery, pickup }

class MyOrderListBody extends StatefulWidget {
  const MyOrderListBody({required this.myOrderRespDto, Key? key}) : super(key: key);
  final List<MyOrderRespDto> myOrderRespDto;
  @override
  State<MyOrderListBody> createState() => _MyOrderListBodyState();
}

class _MyOrderListBodyState extends State<MyOrderListBody> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  OrderType? _orderType = OrderType.delivery;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    int totalPrice = 0;

    for (int i = 0; i < widget.myOrderRespDto.length; i++) {
      totalPrice += widget.myOrderRespDto[i].menuList[0].price * widget.myOrderRespDto[i].menuList[0].conut;
    }
    print("$totalPrice");
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: gap_s),
              Text("${widget.myOrderRespDto[0].storeName}", style: textTheme().headline1),
              SizedBox(height: gap_s),
              _bulidOrderType("배달", OrderType.delivery, "최소 주문 금액 : ${numberPriceFormat("${widget.myOrderRespDto[0].minAmount}")}"),
              SizedBox(height: gap_s),
              _bulidOrderType("포장", OrderType.pickup, "포장 시간 : ${widget.myOrderRespDto[0].deliveryHour}"),
              SizedBox(height: gap_s),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
        ),
        SizedBox(height: gap_m),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.myOrderRespDto.length,
          itemBuilder: (context, index) {
            return _buildMenuList(
              widget.myOrderRespDto[index].menuList[0],
            );
          },
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
        ),
        if (_orderType == OrderType.delivery) _buildDelivery(totalPrice),
        if (_orderType == OrderType.pickup) _buildPickUp(totalPrice),
      ],
    );
  }

  Widget _buildMenuList(OrderMenu orderMenu) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_s),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${orderMenu.name}", style: textTheme().headline2),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  for (int i = 0; i < widget.myOrderRespDto.length; i++) {
                    if (widget.myOrderRespDto[i].menuList[0].name == orderMenu.name) {
                      setState(() {
                        widget.myOrderRespDto.removeAt(i);
                      });
                    }
                  }
                },
                icon: Icon(
                  CupertinoIcons.multiply_square_fill,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: gap_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_m),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(numberPriceFormat("${orderMenu.price}"), style: textTheme().bodyText1),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (orderMenu.conut < 10) orderMenu.conut--;
                      });
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
                    '${orderMenu.conut}',
                    style: TextStyle(fontSize: 16.0, color: Color.fromRGBO(24, 24, 24, 1), fontWeight: FontWeight.bold, height: 1.5),
                  ),
                  SizedBox(width: gap_s),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (orderMenu.conut < 10) orderMenu.conut++;
                      });
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
        SizedBox(height: gap_m),
      ],
    );
  }

  Widget _buildPickUp(int totalPrice) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: gap_m),
          child: Column(
            children: [
              SizedBox(height: gap_m),
              _buildOrderPrice("상품 금액", numberPriceFormat("$totalPrice")),
              SizedBox(height: gap_s),
              _buildOrderPrice("결제 금액", numberPriceFormat("${totalPrice}")),
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
                if (totalPrice > widget.myOrderRespDto[0].minAmount) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage(myOrderRespDto: widget.myOrderRespDto, orderType: OrderType.pickup)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
                      content: Text("최소 주문금액보다 상품금액이 작습니다!"),
                    ),
                  );
                }
              },
              child: Text(
                '${numberPriceFormat("${totalPrice}")} 주문 하기',
                style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
              ),
            ),
          ),
        ),
        SizedBox(height: gap_m),
      ],
    );
  }

  Widget _buildDelivery(int totalPrice) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: gap_m),
          child: Column(
            children: [
              SizedBox(height: gap_m),
              _buildOrderPrice("상품 금액", numberPriceFormat("${totalPrice}")),
              SizedBox(height: gap_s),
              _buildOrderPrice("배달 비용", numberPriceFormat("${widget.myOrderRespDto[0].deliveryCost}")),
              SizedBox(height: gap_s),
              _buildOrderPrice("결제 금액", numberPriceFormat("${totalPrice + widget.myOrderRespDto[0].deliveryCost}")),
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
                if (totalPrice > widget.myOrderRespDto[0].minAmount) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(myOrderRespDto: widget.myOrderRespDto, orderType: OrderType.delivery),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
                      content: Text("최소 주문금액보다 상품금액이 작습니다!"),
                    ),
                  );
                }
              },
              child: Text(
                '${numberPriceFormat("${totalPrice + widget.myOrderRespDto[0].deliveryCost}")} 주문 하기',
                style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
              ),
            ),
          ),
        ),
        SizedBox(height: gap_m),
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
