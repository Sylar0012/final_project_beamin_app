import 'package:final_project_beamin_app/model/menu_find_by_id_resp_dto.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/components/order_appbar.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/components/my_order_list_body.dart';
import 'package:flutter/material.dart';

class MyOrderList extends StatelessWidget {
  final int id;
  const MyOrderList({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MyOrderList 페이지에 id값 : ${id}");
    if (id == 0) {
      return Scaffold(
        appBar: OrderAppBar(appBar: AppBar(), center: true, title: "장바구니"),
        body: Center(child: Text("장바구니가 비었습니다 !", style: textTheme().headline1)),
      );
    }
    final list = [];
    for (int i = 0; i < menuFindByIdRespDtoList.length; i++) {
      if (id == menuFindByIdRespDtoList[i].id) {
        list.add(menuFindByIdRespDtoList[i]);
      }
    }
    return Scaffold(
      appBar: OrderAppBar(appBar: AppBar(), center: true, title: "장바구니"),
      body: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) => MyOrderListBody(
          myOrderModal: list[index],
        ),
      ),
    );
  }
}
