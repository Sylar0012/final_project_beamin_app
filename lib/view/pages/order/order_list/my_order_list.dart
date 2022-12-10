import 'package:final_project_beamin_app/model/menu_find_by_id_resp_dto.dart';
import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/components/order_appbar.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/components/my_order_list_body.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MyOrderList extends StatelessWidget {
  const MyOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myOrderRespDto = ModalRoute.of(context)!.settings.arguments as MyOrderRespDto?;

    if (myOrderRespDto?.id == null) {
      Logger().d(myOrderRespDto?.id);
      return Scaffold(
        appBar: OrderAppBar(appBar: AppBar(), center: true, title: "장바구니"),
        body: Center(child: Text("장바구니가 비었습니다 !", style: textTheme().headline1)),
      );
    } else {
      Logger().d(myOrderRespDto?.id);
      final list = [];
      for (int i = 0; i < myOrderRespDtoList.length; i++) {
        if (myOrderRespDto?.id == myOrderRespDtoList[i].id) {
          list.add(myOrderRespDtoList[i]);
        }
      }
      return Scaffold(
        appBar: OrderAppBar(appBar: AppBar(), center: true, title: "장바구니"),
        body: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) => MyOrderListBody(
            myOrderRespDto: list[index],
          ),
        ),
      );
    }
  }
}
