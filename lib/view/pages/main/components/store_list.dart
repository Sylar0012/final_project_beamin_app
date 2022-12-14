import 'package:final_project_beamin_app/controller/store_controller.dart';
import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/model/store_detail.dart';
import 'package:final_project_beamin_app/model/home.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/util/my_number_formet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/my_star_icon.dart';

class StoreList extends StatelessWidget {
  const StoreList({required this.storeFindAllList, Key? key}) : super(key: key);
  final Stores storeFindAllList;
  @override
  Widget build(BuildContext context) {
    StoreController StoreCT = StoreController();
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: gap_xxs),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                storeFindAllList.thumbnail == "" ? "assets/images/category/치킨.jpg" : storeFindAllList.thumbnail,
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
                  "${storeFindAllList.storeName}",
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
                    if (storeFindAllList.starPoint != 0) MyStarIcon(CupertinoIcons.star_fill, 16),
                    if (storeFindAllList.starPoint == 0) MyStarIcon(CupertinoIcons.star, 16),
                    SizedBox(width: gap_xs),
                    Text("${storeFindAllList.starPoint}", style: textTheme().bodyText1),
                    SizedBox(width: gap_xs),
                    Text("(${storeFindAllList.count})", style: textTheme().bodyText1),
                  ],
                ),
                SizedBox(height: gap_s),
                Text(
                  "배달 요금 : " + numberPriceFormat("${storeFindAllList.deliveryCost}"),
                  style: textTheme().bodyText2,
                ),
                SizedBox(height: gap_s),
                Text(storeFindAllList.intro, style: textTheme().bodyText2),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        StoreCT.storeDetailPage(storeFindAllList.storeId);
      },
    );
  }
}
