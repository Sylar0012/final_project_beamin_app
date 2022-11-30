import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/components/my_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/my_icons.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        children: [
          SizedBox(height: gap_s),
          _bulidUserReview("ssar", "양념치킨, 후라이드 치킨", 4),
          SizedBox(height: gap_s),
          _bulidReviewImg(img: "치킨"),
          SizedBox(height: gap_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s),
            child: Text(
              "바삭하게 잘 튀겨주셔서 잘 먹고 갑니다 근데 왜 후라이드가 2마리 온거죠?",
              style: TextTheme().bodyText1,
            ),
          ),
          SizedBox(height: gap_s),
          _bulidOwnerComent("고객님은 나쁜 사람입니다. 착한 사람눈에는 양념치킨으로 보였을 텐데 말이죠...."),
          SizedBox(height: gap_s),
          _bulidUserReview("ssar", "포테이토 피자 1", 5),
          SizedBox(height: gap_s),
          _bulidReviewImg(img: "피자"),
          SizedBox(height: gap_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s),
            child: Text(
              "포테이토 피자 너무 맛있게 잘 먹엇어요!",
              style: TextTheme().bodyText1,
            ),
          ),
          SizedBox(height: gap_s),
          _bulidOwnerComent("감사합니다! 다음에 서비스로 콜라 드리겠습니다 ㅎㅎ"),
          SizedBox(height: gap_s),
          _bulidUserReview("ssar", "쇠고기 죽 1", 1),
          SizedBox(height: gap_s),
          _bulidReviewImg(),
          SizedBox(height: gap_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s),
            child: Text(
              "노맛",
              style: TextTheme().bodyText1,
            ),
          ),
          SizedBox(height: gap_s),
          _bulidOwnerComent("먹지마^^"),
          SizedBox(height: gap_s),
        ],
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    title: Text("내 리뷰 목록", style: textTheme().headline1),
    centerTitle: true,
    elevation: 1.0,
  );
}

Widget _bulidOwnerComent(String Comment) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: gap_s),
    child: Container(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
  if (img != null) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: gap_s),
      height: 200,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "assets/images/category/${img}.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  } else {
    return Container();
  }
}

Widget _bulidUserReview(String nickName, String orderList, starPoint) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: gap_s),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          CupertinoIcons.person_alt_circle_fill,
          size: 48,
          color: Color(0xFF1E2D2A),
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
              Text("${orderList}", style: textTheme().bodyText2),
            ],
          ),
        ),
        SizedBox(width: gap_l),
        for (int i = 0; i < starPoint; i++) StarIcon(CupertinoIcons.star_fill, 16),
        if (starPoint < 5)
          for (int i = 0; i < 5 - starPoint; i++) StarIcon(CupertinoIcons.star, 16),
        SizedBox(width: gap_xs),
        Container(
          height: 48,
          child: Align(alignment: Alignment.topCenter, child: MyAlertDialog(text: "리뷰")),
        ),
      ],
    ),
  );
}
