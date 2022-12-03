import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreReview extends StatelessWidget {
  const StoreReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: gap_s),
        _bulidUserReview("김민철", "양념치킨, 후라이드 치킨", 4),
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
        _bulidOwnerComent("졸면서 만들었는데요 ㅋㅋ;"),
        SizedBox(height: gap_s),
        _bulidUserReview("이성진", "양념치킨 2", 5),
        SizedBox(height: gap_s),
        _bulidReviewImg(img: "치킨"),
        SizedBox(height: gap_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_s),
          child: Text(
            "양념치킨 너무 맛있어요!",
            style: TextTheme().bodyText1,
          ),
        ),
        SizedBox(height: gap_s),
        _bulidOwnerComent("감사합니다! 다음에 서비스로 콜라 드리겠습니다 ㅎㅎ"),
        SizedBox(height: gap_s),
        _bulidUserReview("맛없으면 짖는 개", "양념치킨 1", 1),
        SizedBox(height: gap_s),
        _bulidReviewImg(),
        SizedBox(height: gap_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_s),
          child: Text(
            "왈왈 으르르 컹컹어ㅓ커엉ㅋ!",
            style: TextTheme().bodyText1,
          ),
        ),
        SizedBox(height: gap_s),
        _bulidOwnerComent("신고하겠습니다 ^^"),
      ],
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
          "assets/images/review/${img}.jpg",
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
        for (int i = 0; i < starPoint; i++) _bulidStarIcon(CupertinoIcons.star_fill),
        if (starPoint < 5)
          for (int i = 0; i < 5 - starPoint; i++) _bulidStarIcon(CupertinoIcons.star),
      ],
    ),
  );
}

Widget _bulidStarIcon(CupertinoIcons) {
  return Icon(
    CupertinoIcons,
    size: 24,
    color: Color(0xFFFF521C),
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
