import 'package:final_project_beamin_app/model/store_list_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_detail.dart';
import 'package:final_project_beamin_app/view/pages/util/number_formet/my_number_formet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/my_star_icon.dart';

class StoreList extends StatelessWidget {
  const StoreList({required this.storeFindAllRespDto, Key? key}) : super(key: key);
  final StoreFindAllRespDto storeFindAllRespDto;

  @override
  Widget build(BuildContext context) {
    int count = storeFindAllRespDto.id - 1;
    print("count : ${count}");
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
                storeFindAllRespDto.thumbnail,
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
                  storeFindAllRespDto.name,
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
                    for (int i = 0; i < storeFindAllRespDto.starPoint; i++) MyStarIcon(CupertinoIcons.star_fill, 16),
                    if (storeFindAllRespDto.starPoint < 5)
                      for (int i = 0; i < 5 - storeFindAllRespDto.starPoint; i++) MyStarIcon(CupertinoIcons.star, 16),
                  ],
                ),
                SizedBox(height: gap_s),
                Text(
                  "배달 요금 : " + numberPriceFormat("${storeFindAllRespDto.deliveryCost}"),
                  style: textTheme().bodyText2,
                ),
                SizedBox(height: gap_s),
                Text(storeFindAllRespDto.intro, style: textTheme().bodyText2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
