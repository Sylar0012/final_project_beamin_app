import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/model/my_order_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myOrderListPageViewModel = StateNotifierProvider<MyOrderListPageViewModel, List<MyOrderRespDto>>((ref) {
  return MyOrderListPageViewModel([], ref)..initViewModel();
});

class MyOrderListPageViewModel extends StateNotifier<List<MyOrderRespDto>> {
  Ref _ref;
  MyOrderListPageViewModel(super.state, this._ref);

  void initViewModel() {}

  void addOrderList(MyOrderRespDto myOrderRespDto) {
    state = [...state, myOrderRespDto];
  }
}
