import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/service/local_service.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/favorite_store/favorite_store.dart';
import 'package:final_project_beamin_app/view/pages/main/home/home_page.dart';
import 'package:final_project_beamin_app/view/pages/main/main_page.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/my_order_detial/my_order_detail.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/order_list_page.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/my_baemin.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/review_list/reivew_list.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/review_write/review_write.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/user_inactive/user_inactive.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/user_info/info_update.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list_page.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/payment.dart';
import 'package:final_project_beamin_app/view/pages/order/payment_detail.dart';
import 'package:final_project_beamin_app/view/pages/store/menu_detail/menu_detail_page.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_detail_page.dart';
import 'package:final_project_beamin_app/view/pages/user/join/join_Page.dart';
import 'package:final_project_beamin_app/view/pages/user/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalService().fetchJwtToken();
  // 자동 로그인시 필요
  runApp(ProviderScope(child: const MyApp()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: Routers.login,
      routes: {
        Routers.login: (context) => LoginPage(),
        Routers.myBaemin: (context) => MyBaemin(),
        Routers.home: (context) => HomePage(),
        Routers.main: (context) => MainPage(),
        Routers.favoriteStore: (context) => FavoriteStore(), // 더미 완
        Routers.orderList: (context) => OrderListPage(),
        Routers.myOrderList: (context) => MyOrderListPage(),
        Routers.reviewList: (context) => ReviewList(),
      },
      title: "beamin_ui",
      debugShowCheckedModeBanner: false,
      theme: theme(),
    );
  }
}
