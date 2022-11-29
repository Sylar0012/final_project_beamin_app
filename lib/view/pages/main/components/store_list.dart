import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/my_icons.dart';

class StoreList extends StatelessWidget {
  final String img;
  final String storeName;
  final int starPoint;
  const StoreList({required this.img, required this.storeName, required this.starPoint, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(gap_s),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/category/${img}.jpg",
                width: 115,
                height: 115,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: gap_s),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${storeName}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                        offset: const Offset(0.5, 1),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: gap_xs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < starPoint; i++) StarIcon(CupertinoIcons.star_fill, 16),
                    if (starPoint < 5)
                      for (int i = 0; i < 5 - starPoint; i++) StarIcon(CupertinoIcons.star, 16),
                  ],
                ),
                SizedBox(height: gap_s),
                Text(
                  "배달 예상 시간 : 38 ~ 42분",
                  style: textTheme().bodyText2,
                ),
                SizedBox(height: gap_s),
                Text("${storeName} 주운나 마싯어연 ^^", style: textTheme().bodyText2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
