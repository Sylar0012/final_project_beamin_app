import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/model/my_order_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myOrderListPageViewModel = StateNotifierProvider.family<MyOrderListPageViewModel, MyOrderListPageModel?, MyOrderRespDto>((ref, MyOrderRespDto) {
  return MyOrderListPageViewModel(null, MyOrderRespDto)..notifyViewModel();
});

class MyOrderListPageViewModel extends StateNotifier<MyOrderListPageModel?> {
  final MyOrderRespDto myOrderRespDto;
  final mContext = navigatorKey.currentContext;
  MyOrderListPageViewModel(super.state, this.myOrderRespDto);

  void notifyViewModel() {
    state = MyOrderListPageModel(myOrderRespDto);
  }
}
