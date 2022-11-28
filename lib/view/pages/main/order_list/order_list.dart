import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainColor,
      child: Align(
          alignment: Alignment.center,
          child: Text(
            "OrderList",
            style: textTheme().headline1,
          )),
    );
  }
}
