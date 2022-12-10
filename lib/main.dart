import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/favorite_store/favorite_store.dart';
import 'package:final_project_beamin_app/view/pages/main/main_page.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/my_order_detail.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/order_list.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/my_baemin.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/review_list/reivew_list.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/review_write/review_write.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/user_inactive/user_inactive.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/user_info/info_update.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/payment.dart';
import 'package:final_project_beamin_app/view/pages/order/payment_detail.dart';
import 'package:final_project_beamin_app/view/pages/store/menu_detail/menu_detail.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_detail.dart';
import 'package:final_project_beamin_app/view/pages/user/join/join_Page.dart';
import 'package:final_project_beamin_app/view/pages/user/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routers.login: (context) => LoginPage(),
        Routers.join: (context) => JoinPage(),
        Routers.home: (context) => MainPage(), // 더미 완
        Routers.myBaemin: (context) => MyBaemin(),
        Routers.favoriteStore: (context) => FavoriteStore(), // 더미 완
        Routers.myOrderList: (context) => MyOrderDetail(),
        Routers.storeDetail: (context) => StoreDetail(), // 더미 완
        Routers.orderList: (context) => OrderList(),
        Routers.reviewList: (context) => ReviewList(),
        Routers.reviewWrite: (context) => ReviewWrite(),
        Routers.inactive: (context) => UserInactive(),
        Routers.infoUpdate: (context) => InfoUpdate(),
        Routers.myOrderList: (context) => MyOrderList(id: 0),
        Routers.payment: (context) => Payment(),
        Routers.paymentDetail: (context) => PaymentDetail(),
        Routers.menuDetail: (context) => MenuDetail(), // 더미 완
      },
      title: "beamin_ui",
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: LoginPage(),
    );
  }
}
