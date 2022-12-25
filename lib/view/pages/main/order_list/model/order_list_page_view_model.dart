import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/service/main_service.dart';
import 'package:final_project_beamin_app/service/order_service.dart';
import 'package:final_project_beamin_app/view/pages/main/home/model/home_page_model.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/model/order_list_page_model.dart';
import 'package:final_project_beamin_app/view/pages/main/search/model/search_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final orderListPageViewModel = StateNotifierProvider<OrderListPageViewModel, OrderListPageModel?>((ref) {
  return OrderListPageViewModel(null)..notifyViewModel();
});

//.autoDispose : 화면이 날아가면 데이터도 같이 날림

class OrderListPageViewModel extends StateNotifier<OrderListPageModel?> {
  final OrderService orderService = OrderService();
  final mContext = navigatorKey.currentContext;

  OrderListPageViewModel(super.state);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await orderService.fetchOrderHistory();

    if (responseDto.code == 1) {
      state = OrderListPageModel(responseDto.data);
    }
  }
}
