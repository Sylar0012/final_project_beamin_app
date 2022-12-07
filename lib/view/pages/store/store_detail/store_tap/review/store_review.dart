import 'package:final_project_beamin_app/model/store_review_find_by_store_id_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/components/my_star_icon.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/review/components/store_review_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreReview extends StatelessWidget {
  const StoreReview({required this.id, Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    final list = [];
    for (int i = 0; i < storeReviewFindByStoreIdRespDtoList.length; i++)
      if (id == storeReviewFindByStoreIdRespDtoList[i].orderDetailList[0].order.storeId) {
        list.add(storeReviewFindByStoreIdRespDtoList[i]);
      }
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return StoreReviewBody(
          storeReviewFindByStoreIdRespDto: list[index],
        );
      },
    );
  }
}
