import 'package:final_project_beamin_app/dto/menu_req_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderController = Provider<OrderController>((ref) {
  return OrderController();
});

class OrderController {
  final mContext = navigatorKey.currentContext;

  Future<void> moveMyOrderListPage() async {
    Navigator.push(
      mContext!,
      MaterialPageRoute(
        builder: (context) => MyOrderListPage(),
      ),
    );
  }
}
