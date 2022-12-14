import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';
import 'package:final_project_beamin_app/model/payment_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/model/my_order_list_model.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/model/my_order_list_view_model.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/payment_page.dart';
import 'package:final_project_beamin_app/view/pages/store/menu_detail/menu_detail_page.dart';
import 'package:final_project_beamin_app/view/pages/util/my_number_formet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum OrderType { delivery, pickup }

class MyOrderListBody extends ConsumerStatefulWidget {
  const MyOrderListBody({required this.orderMenu, Key? key}) : super(key: key);
  final List<OrderMenu> orderMenu;

  @override
  ConsumerState<MyOrderListBody> createState() => _MyOrderListBodyState();
}

class _MyOrderListBodyState extends ConsumerState<MyOrderListBody> {
  OrderType? _orderType = OrderType.delivery;

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;

    for (int i = 0; i < widget.orderMenu.length; i++) {
      totalPrice += widget.orderMenu[i].price * widget.orderMenu[i].count;
    }
    MyOrderListPageModel? model = ref.watch(myOrderListPageViewModel(widget.orderMenu[0].storeId));
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: gap_s),
              Text("${model?.storeDetail.name}", style: textTheme().headline1),
              SizedBox(height: gap_s),
              _bulidOrderType("??????", OrderType.delivery, "?????? ?????? ?????? : ${numberPriceFormat("${model?.storeDetail.minAmount}")}"),
              SizedBox(height: gap_s),
              _bulidOrderType("??????", OrderType.pickup, "?????? ?????? : ${model?.storeDetail.deliveryHour}"),
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
          itemCount: widget.orderMenu.length,
          itemBuilder: (context, index) {
            return _buildMenuList(
              widget.orderMenu[index],
            );
          },
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
        ),
        if (_orderType == OrderType.delivery) _buildDelivery(totalPrice, model),
        if (_orderType == OrderType.pickup) _buildPickUp(totalPrice, model!),
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
                  for (int i = 0; i < widget.orderMenu.length; i++) {
                    if (widget.orderMenu[i].name == orderMenu.name) {
                      setState(() {
                        widget.orderMenu.removeAt(i);
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
                        if (orderMenu.count < 10) orderMenu.count--;
                      });
                    },
                    padding: EdgeInsets.zero, // ?????? ??????
                    constraints: BoxConstraints(),
                    icon: Icon(
                      CupertinoIcons.minus_circle,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: gap_s),
                  Text(
                    '${orderMenu.count}',
                    style: TextStyle(fontSize: 16.0, color: Color.fromRGBO(24, 24, 24, 1), fontWeight: FontWeight.bold, height: 1.5),
                  ),
                  SizedBox(width: gap_s),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (orderMenu.count < 10) orderMenu.count++;
                      });
                    },
                    padding: EdgeInsets.zero, // ?????? ??????
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

  Widget _buildPickUp(int totalPrice, MyOrderListPageModel model) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: gap_m),
          child: Column(
            children: [
              SizedBox(height: gap_m),
              _buildOrderPrice("?????? ??????", numberPriceFormat("$totalPrice")),
              SizedBox(height: gap_s),
              _buildOrderPrice("?????? ??????", numberPriceFormat("${totalPrice}")),
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
                if (totalPrice >= 0) {
                  //model.storeDetail.minAmount
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage(orderType: OrderType.pickup, myOrderInfo: globalMyOrderInfo, orderMenu: globalOrderMenuItems)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
                      content: Text("?????? ?????????????????? ??????????????? ????????????!"),
                    ),
                  );
                }
              },
              child: Text(
                '${numberPriceFormat("${totalPrice}")} ?????? ??????',
                style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
              ),
            ),
          ),
        ),
        SizedBox(height: gap_m),
      ],
    );
  }

  Widget _buildDelivery(int totalPrice, model) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: gap_m),
          child: Column(
            children: [
              SizedBox(height: gap_m),
              _buildOrderPrice("?????? ??????", numberPriceFormat("${totalPrice}")),
              SizedBox(height: gap_s),
              _buildOrderPrice("?????? ??????", numberPriceFormat("${model.storeDetail.deliveryCost}")),
              SizedBox(height: gap_s),
              _buildOrderPrice("?????? ??????", numberPriceFormat("${totalPrice + model.storeDetail.deliveryCost}")),
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
                if (totalPrice >= model.storeDetail.minAmount) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage(orderType: OrderType.delivery, myOrderInfo: globalMyOrderInfo, orderMenu: globalOrderMenuItems)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
                      content: Text("?????? ?????????????????? ??????????????? ????????????!"),
                    ),
                  );
                }
              },
              child: Text(
                '${numberPriceFormat("${totalPrice + model.storeDetail.deliveryCost}")} ?????? ??????',
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
      // ????????? ?????? (?????? + ??????)
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
                print('????????? ????????? : $value');
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
