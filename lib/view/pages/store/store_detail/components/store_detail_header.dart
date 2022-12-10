import 'package:final_project_beamin_app/model/store_detail_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/components/my_star_icon.dart';
import 'package:final_project_beamin_app/view/pages/util/my_number_formet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class StoreDetailHeader extends StatelessWidget {
  const StoreDetailHeader({required this.storeDetailRespDto, Key? key}) : super(key: key);
  final StoreDetailRespDto storeDetailRespDto;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            border: BorderDirectional(bottom: BorderSide(width: 1, color: Color.fromRGBO(221, 221, 221, 1))),
            image: DecorationImage(
              image: AssetImage(storeDetailRespDto.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment(0, 2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color.fromRGBO(221, 221, 221, 1), width: 1),
                    color: Colors.white,
                  ),
                  height: 160,
                  child: Padding(
                    padding: const EdgeInsets.all(gap_s),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(storeDetailRespDto.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFF1E2D2A), shadows: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(1),
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                                offset: const Offset(0.5, 1),
                              )
                            ])),
                        SizedBox(height: gap_xs),
                        Row(
                          children: [
                            for (int i = 0; i < storeDetailRespDto.starPoint; i++) MyStarIcon(CupertinoIcons.star_fill, 16),
                            if (storeDetailRespDto.starPoint < 5)
                              for (int i = 0; i < 5 - storeDetailRespDto.starPoint; i++) MyStarIcon(CupertinoIcons.star, 16),
                          ],
                        ),
                        SizedBox(height: gap_s),
                        Row(
                          children: [
                            Text(
                              "리뷰 : " + numberReviewFormat("${storeDetailRespDto.customerReviewCount}"),
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(
                                  0xFF1E2D2A,
                                ),
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
                            SizedBox(width: gap_xl),
                            Text(
                              "사장님 댓글 : " + numberReviewFormat("${storeDetailRespDto.ceoReviewCount}"),
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF1E2D2A),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildLikeButton(storeDetailRespDto.likeCount),
            _buildStoreInfoIcon(CupertinoIcons.phone_solid),
            _buildStoreInfoIconWithText(CupertinoIcons: CupertinoIcons.map_pin_ellipse, text: " 3.1 Km"),
          ],
        ),
        SizedBox(height: gap_s),
        Divider(
          height: 1,
          thickness: 1,
          color: Color.fromRGBO(221, 221, 221, 1),
        ),
        _buildStioreInfoText("최소 주문 금액 : " + numberPriceFormat("${storeDetailRespDto.minAmount}")),
        _buildStioreInfoText("배달 예상 시간 : " + "${storeDetailRespDto.deliveryHour}"),
        _buildStioreInfoText("배달 팁 : " + numberPriceFormat("${storeDetailRespDto.deliveryCost}")),
        SizedBox(height: gap_s),
      ],
    );
  }
}

LikeButton _buildLikeButton(int count) {
  return LikeButton(
    size: 26,
    circleColor: CircleColor(start: Colors.orangeAccent, end: Colors.orange),
    bubblesColor: BubblesColor(
      dotPrimaryColor: Colors.pink,
      dotSecondaryColor: Colors.orange,
    ),
    likeBuilder: (bool isLiked) {
      return Icon(
        CupertinoIcons.heart_fill,
        color: isLiked ? Colors.redAccent : Colors.grey,
        size: 26,
      );
    },
    likeCount: count,
    countBuilder: (count, isLiked, text) {
      var color = isLiked ? Colors.redAccent : Colors.grey;
      Widget result;
      if (count == 0) {
        result = Text(
          "love",
          style: TextStyle(color: color),
        );
      } else
        result = Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: color,
            shadows: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                blurRadius: 1.0,
                spreadRadius: 1.0,
                offset: const Offset(0.5, 1),
              )
            ],
          ),
        );
      return result;
    },
  );
}

Widget _buildStoreInfoIcon(CupertinoIcons) {
  return Row(
    children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                CupertinoIcons,
                color: Colors.red,
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0.5, 1),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildStioreInfoText(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: gap_s, left: gap_s),
    child: Text(
      "${text}",
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    ),
  );
}

Widget _buildStoreInfoIconWithText({required CupertinoIcons, required String text}) {
  return Row(
    children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                CupertinoIcons,
                color: Colors.red,
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0.5, 1),
                  )
                ],
              ),
              Text(
                "${text}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
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
            ],
          ),
        ),
      ),
    ],
  );
}
