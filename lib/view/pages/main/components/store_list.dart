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
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "${storeFindAllList.thumbnail}",
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
                  for (double i = 0; i < storeFindAllList.starPoint; i++) MyStarIcon(CupertinoIcons.star_fill, 16),
                  if (storeFindAllList.starPoint < 5 && 1 < storeFindAllList.starPoint)
                    for (double i = 1; i <= 5 - storeFindAllList.starPoint; i++) MyStarIcon(CupertinoIcons.star, 16),
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
      onTap: () {
        StoreCT.storeDetailPage(storeFindAllList.storeId);
      },
    );
  }
}
