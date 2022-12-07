import 'package:final_project_beamin_app/model/store_detail_resp_dto.dart';
import 'package:final_project_beamin_app/model/store_find_all_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/components/store_detail_header.dart';
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
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: storeFindAllRespDtoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  storeFindAllRespDtoList[index].thumbnail,
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
                    storeFindAllRespDtoList[index].name,
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
                      for (double i = 0; i < storeFindAllRespDtoList[index].starPoint; i++) MyStarIcon(CupertinoIcons.star_fill, 16),
                      if (storeFindAllRespDtoList[index].starPoint < 5)
                        for (double i = 0; i < 5 - storeFindAllRespDtoList[index].starPoint; i++) MyStarIcon(CupertinoIcons.star, 16),
                    ],
                  ),
                  SizedBox(height: gap_s),
                  Text(
                    "배달 요금 : " + numberPriceFormat("${storeFindAllRespDtoList[index].deliveryCost}"),
                    style: textTheme().bodyText2,
                  ),
                  SizedBox(height: gap_s),
                  Text(storeFindAllRespDtoList[index].intro, style: textTheme().bodyText2),
                ],
              ),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              StoreDetail.storeDetail,
              arguments: StoreDetailRespDto(
                id: storeFindAllRespDtoList[index].id,
                name: "",
                likeCount: 0,
                thumbnail: "",
                starPoint: storeFindAllRespDtoList[index].starPoint,
                customerReviewCount: 0,
                ceoReviewCount: 0,
                deliveryCost: 0,
                phone: "",
                deliveryHour: "",
                minAmount: 0,
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => Divider(
        indent: 16, // 시작점 ( 앞에 공간 생김 )
        endIndent: 16, // 끝점 ( 뒤에 공간 생김 )
        color: Colors.grey,
      ),
    );
  }
}
