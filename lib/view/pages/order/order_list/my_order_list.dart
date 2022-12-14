import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/components/order_appbar.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/components/my_order_list_body.dart';
import 'package:flutter/material.dart';

class MyOrderList extends StatelessWidget {
  const MyOrderList({this.myOrderRespDto, Key? key}) : super(key: key);
  final MyOrderRespDto? myOrderRespDto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrderAppBar(appBar: AppBar(), center: true, title: "장바구니"),
      body: myOrderRespDto?.menuList == null ? _buildNullStoreId() : _buildNotNullStoreId(myOrderRespDto!),
    );
  }
}

Widget _buildNullStoreId() {
  return Center(child: Text("장바구니가 비었습니다 !", style: textTheme().headline1));
}

Widget _buildNotNullStoreId(MyOrderRespDto myOrderRespDto) {
  return MyOrderListBody(myOrderRespDto: myOrderRespDto);
}
