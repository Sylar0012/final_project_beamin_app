import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/model/my_review_list.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/components/my_modal_bottom_sheet.dart';
import 'package:final_project_beamin_app/view/pages/components/my_star_icon.dart';
import 'package:final_project_beamin_app/view/pages/my_info/review_list/model/my_review_list_page_model.dart';
import 'package:final_project_beamin_app/view/pages/my_info/review_list/model/my_review_list_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewList extends ConsumerWidget {
  const ReviewList({required this.nickname, Key? key}) : super(key: key);
  final String nickname;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyReviewListPageModel? model = ref.watch(myReviewListPageViewModel);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: model == null
          ? Align(alignment: Alignment.center, child: Text("내 리뷰가 없습니다.", style: textTheme().headline1))
          : ListView.builder(
              itemCount: model.customerReviewList.length,
              itemBuilder: (context, index) {
                return _buildReviewList(
                  customerReviews: model.customerReviewList[index],
                  nickname: nickname,
                );
              },
            ),
    );
  }
}

Widget _buildReviewList({required CustomerReviews customerReviews, required nickname}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: gap_s),
      _bulidUserReview(nickname, customerReviews.storeName, customerReviews.starPoint),
      SizedBox(height: gap_s),
      _bulidReviewImg(img: "${customerReviews.photo}"),
      SizedBox(height: gap_s),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: gap_s),
        child: Text(
          customerReviews.content,
          style: TextTheme().bodyText1,
        ),
      ),
      SizedBox(height: gap_s),
      _bulidOwnerComent(customerReviews.comment),
    ],
  );
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pushNamed(context, Routers.myInfo);
      },
      icon: Icon(
        Icons.arrow_back,
        size: 24,
        color: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    title: Text("내 리뷰 목록", style: textTheme().headline1),
    centerTitle: true,
    elevation: 1.0,
  );
}

Widget _bulidOwnerComent(String comment) {
  return comment == ""
      ? Container()
      : Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_s),
          child: Container(
            width: double.infinity,
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
                  Text(comment, style: TextTheme().bodyText2),
                  SizedBox(height: gap_s),
                ],
              ),
            ),
          ),
        );
}

Widget _bulidReviewImg({String? img}) {
  if (img != "") {
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
        for (int i = 0; i < starPoint; i++) MyStarIcon(CupertinoIcons.star_fill, 16),
        if (starPoint < 5)
          for (int i = 0; i < 5 - starPoint; i++) MyStarIcon(CupertinoIcons.star, 16),
        SizedBox(width: gap_xs),
        Container(
          height: 48,
          child: Align(alignment: Alignment.topCenter, child: MyModalBottomSheet(text: "리뷰")),
        ),
      ],
    ),
  );
}
