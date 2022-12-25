import 'package:final_project_beamin_app/dto/menu_req_dto.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';
import 'package:final_project_beamin_app/service/store_service.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/model/my_order_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myOrderListPageViewModel = StateNotifierProvider.family<MyOrderListPageViewModel, MyOrderListPageModel?, int>((ref, storeId) {
  return MyOrderListPageViewModel(null, storeId)..notifyViewModel();
});

class MyOrderListPageViewModel extends StateNotifier<MyOrderListPageModel?> {
  final StoreService storeService = StoreService();
  final mContext = navigatorKey.currentContext;
  final int storeId;
  MyOrderListPageViewModel(super.state, this.storeId);
  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await storeService.fetchStoreDetail(storeId);

    if (responseDto.data != null) {
      state = MyOrderListPageModel(responseDto.data);
    }
  }
}
