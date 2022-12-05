import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/model/store.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/my_icons.dart';

class StoreList extends StatelessWidget {
  final Store store;
  const StoreList({required this.store, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => StoreDetail()));
      },
      child: Padding(
        padding: const EdgeInsets.all(gap_s),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                store.thumbnail,
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
                  store.name,
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
                    for (int i = 0; i < store.starPoint; i++) StarIcon(CupertinoIcons.star_fill, 16),
                    if (store.starPoint < 5)
                      for (int i = 0; i < 5 - store.starPoint; i++) StarIcon(CupertinoIcons.star, 16),
                  ],
                ),
                SizedBox(height: gap_s),
                Text(
                  store.deliveryHour,
                  style: textTheme().bodyText2,
                ),
                SizedBox(height: gap_s),
                Text(store.intro, style: textTheme().bodyText2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
