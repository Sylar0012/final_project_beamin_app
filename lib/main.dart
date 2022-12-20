import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/service/local_service.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/favorite_store/favorite_store_page.dart';
import 'package:final_project_beamin_app/view/pages/main/home/home_page.dart';
import 'package:final_project_beamin_app/view/pages/main/main_page.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/order_list_page.dart';
import 'package:final_project_beamin_app/view/pages/my_info/my_info_page.dart';
import 'package:final_project_beamin_app/view/pages/my_info/review_list/reivew_list.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list_page.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/payment_request/iamport_payment.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/payment_request/iamport_payment_page.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/payment_request/iamport_result.dart';
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
        Routers.myInfo: (context) => MyInfoPage(),
        Routers.home: (context) => HomePage(),
        Routers.main: (context) => MainPage(),
        Routers.favoriteStore: (context) => FavoriteStore(), // 더미 완
        Routers.orderList: (context) => OrderListPage(),
        Routers.myOrderList: (context) => MyOrderListPage(),
        "/iaportTest": (context) => PaymentTest(),
        "/iamportPayment": (context) => IamportPaymentPage(),
        "/iamportresult": (context) => PaymentResult(),
      },
      title: "beamin_ui",
      debugShowCheckedModeBanner: false,
      theme: theme(),
    );
  }
}
