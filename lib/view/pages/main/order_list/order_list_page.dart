import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/components/main_app_bar.dart';
import 'package:final_project_beamin_app/view/pages/components/my_modal_bottom_sheet.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/my_order_detial/my_order_detail.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/review_write/review_write.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBar: AppBar(), title: "주문 내역"),
      body: Column(
        children: [
          _bulidOrder(context, "6/20 (월)", "배달중", "치킨", "네네치킨", "후라이드 치킨 외 2개 43,000원"),
          _bulidOrder(context, "6/19 (일)", "배달완료", "피자", "도미노피자", "포테이토 피자 14,000원"),
          _bulidOrder(context, "6/18 (토)", "배달완료", "보쌈", "원할머니보쌈", "수육 ( 중 ) 외 3개 57,000원"),
        ],
      ),
    );
  }
}

Widget _bulidOrder(BuildContext context, String orderDay, String ordeyState, String img, String storeName, String order) {
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
                        "${orderDay}",
                        style: textTheme().bodyText2,
                      ),
                      SizedBox(width: gap_xs),
                      Text(
                        "${ordeyState}",
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
                        "assets/images/category/${img}.jpg",
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
                                "${storeName}  >",
                                style: textTheme().headline2,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${order}",
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewWrite()));
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
