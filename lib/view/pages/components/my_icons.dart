import 'package:final_project_beamin_app/constants.dart';
import 'package:flutter/material.dart';

Widget StarIcon(CupertinoIcons, double sizeNum) {
  return Icon(
    CupertinoIcons,
    size: sizeNum,
    color: kMainColor,
    shadows: [
      BoxShadow(
        color: Colors.grey.withOpacity(1),
        blurRadius: 1.0,
        spreadRadius: 1.0,
        offset: const Offset(0.5, 1),
      )
    ],
  );
}
