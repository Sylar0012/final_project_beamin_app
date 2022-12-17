import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/components/order_appbar.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/components/my_order_list_body.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/model/my_order_list_model.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/model/my_order_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyOrderListPage extends ConsumerStatefulWidget {
  const MyOrderListPage({this.myOrderRespDto, Key? key}) : super(key: key);
  final MyOrderRespDto? myOrderRespDto;
  @override
  ConsumerState<MyOrderListPage> createState() => _MyOrderListPageState();
}

class _MyOrderListPageState extends ConsumerState<MyOrderListPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    MyOrderListPageModel? model = ref.read(myOrderListPageViewModel(widget.myOrderRespDto!));
    return Scaffold(
      appBar: OrderAppBar(appBar: AppBar(), center: true, title: "장바구니"),
      body: model == null ? _buildNullStoreId() : _buildNotNullStoreId(model),
    );
  }
}

Widget _buildNullStoreId() {
  return Center(child: Text("장바구니가 비었습니다 !", style: textTheme().headline1));
}

Widget _buildNotNullStoreId(MyOrderListPageModel model) {
  return MyOrderListBody(myOrderRespDto: model.myOrderRespDto);
}
