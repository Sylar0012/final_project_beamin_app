import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/model/order_list.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/components/main_app_bar.dart';
import 'package:final_project_beamin_app/view/pages/components/my_modal_bottom_sheet.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/model/order_list_page_model.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/model/order_list_page_view_model.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/my_order_detial/my_order_detail.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/review_write/review_write_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderListPage extends ConsumerWidget {
  OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OrderListPageModel? model = ref.watch(orderListPageViewModel);
    return Scaffold(
      appBar: MainAppBar(appBar: AppBar(), title: "주문 내역"),
      body: model == null
          ? Center(
              child: Text("주문 내역이 없습니다!", style: textTheme().headline1),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: model.orderHistoryList.length,
              itemBuilder: (context, index) {
                return _bulidOrder(model.orderHistoryList[index], context);
              },
            ),
    );
  }

  Widget _bulidOrder(OrderHistory orderHistory, BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(gap_s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "${orderHistory.createdAt}".toString().substring(5, 16),
                          style: textTheme().bodyText2,
                        ),
                        SizedBox(width: gap_xxs),
                        Text(
                          "${orderHistory.deliveryState}",
                          style: textTheme().bodyText2,
                        ),
                      ],
                    ),
                  ),
                  MyModalBottomSheet(text: "주문내역"),
                ],
              ),
              SizedBox(height: gap_xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          orderHistory.thumbnail,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: gap_s),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderDetail()));
                                },
                                child: Text(
                                  "${orderHistory.name}  >",
                                  style: textTheme().headline2,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${orderHistory.intro}",
                            style: textTheme().subtitle1,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kMainColor),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        alignment: Alignment.bottomCenter,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewWritePage(orderId: 1, storeId: 1)));
                      },
                      child: Text(
                        '리뷰 쓰기',
                        style: TextStyle(color: kMainColor, fontSize: 14, height: 0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(color: Colors.grey[200], height: gap_xs),
      ],
    );
  }
}
