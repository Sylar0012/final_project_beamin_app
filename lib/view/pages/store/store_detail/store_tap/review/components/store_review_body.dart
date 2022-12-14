import 'package:final_project_beamin_app/model/store_review_find_by_store_id_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/components/my_star_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreReviewBody extends StatelessWidget {
  const StoreReviewBody({required this.model, Key? key}) : super(key: key);
  final CustomerReviewDto model;

  @override
  Widget build(BuildContext context) {
    int a = model.customerMenuDtos.length;
    String elseMenu = "";
    if (1 < a) {
      elseMenu = "외 ${a - 1}개";
    }

    return Column(
      children: [
        SizedBox(height: gap_s),
        _bulidUserReview(
          "${model.nickname}",
          "${model.customerMenuDtos[0].menuName}",
          "${elseMenu}",
          model.starPoint,
        ),
        SizedBox(height: gap_s),
        model.uphoto == "" ? Container() : _bulidReviewImg(img: "${model.uphoto}"),
        SizedBox(height: gap_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_s),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${model.content}",
              style: TextStyle(
                fontSize: 16,
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
          ),
        ),
        SizedBox(height: gap_s),
        model.comment == null ? Container() : _bulidOwnerComent("${model.comment}"),
      ],
    );
  }

  Widget _bulidUserReview(String nickName, String orderList, String elseMenu, starPoint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_s),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              height: 48,
              width: 48,
              child: model.uphoto == ""
                  ? Icon(CupertinoIcons.person_alt_circle_fill, size: 48, color: Colors.grey[400])
                  : Image.asset(
                      "${model.uphoto}",
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(width: gap_s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${nickName}",
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
                Text("${orderList} ${elseMenu}", style: textTheme().bodyText2),
              ],
            ),
          ),
          SizedBox(width: gap_l),
          for (int i = 0; i < starPoint; i++) MyStarIcon(CupertinoIcons.star_fill, 24),
          if (starPoint < 5)
            for (int i = 0; i < 5 - starPoint; i++) MyStarIcon(CupertinoIcons.star, 24),
        ],
      ),
    );
  }
}

Widget _bulidOwnerComent(String Comment) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: gap_s),
    child: Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "사장님 댓글",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF1E2D2A),
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0.5, 1),
                  )
                ],
              ),
            ),
            SizedBox(height: gap_s),
            Text("${Comment}", style: TextTheme().bodyText2),
            SizedBox(height: gap_s),
          ],
        ),
      ),
    ),
  );
}

Widget _bulidReviewImg({String? img}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: gap_s),
    height: 200,
    width: double.infinity,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        img!,
        fit: BoxFit.cover,
      ),
    ),
  );
}
