import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/main_page.dart';
import 'package:final_project_beamin_app/view/pages/order/order_detail.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/payment.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "beamin_ui",
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MainPage(),
    );
  }
}
