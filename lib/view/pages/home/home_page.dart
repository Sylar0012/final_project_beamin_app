import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainColor,
      child: Align(
          alignment: Alignment.center,
          child: Text(
            "HomePage",
            style: textTheme().headline1,
          )),
    );
  }
}
