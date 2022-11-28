import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:flutter/material.dart';

class FavoriteStore extends StatelessWidget {
  const FavoriteStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainColor,
      child: Align(
          alignment: Alignment.center,
          child: Text(
            "FavoriteStroe",
            style: textTheme().headline1,
          )),
    );
  }
}
