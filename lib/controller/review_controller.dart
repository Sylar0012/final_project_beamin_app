import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/dto/user_review_req_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/service/review_service.dart';
import 'package:final_project_beamin_app/view/pages/my_info/review_list/reivew_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewController = Provider<ReviewController>((ref) {
  return ReviewController(ref);
});

class ReviewController {
  final mContext = navigatorKey.currentContext;
  final ReviewService reviewService = ReviewService();
  final Ref _ref;

  ReviewController(this._ref);

  Future<void> write({required String content, required double starPoint, required String photo, required int storeId, required int orderId}) async {
    UserReviewReqDto userReviewReqDto = UserReviewReqDto(content, starPoint, photo);
    ResponseDto responseDto = await reviewService.fetchReviewWrite(userReviewReqDto, storeId, orderId);
    if (responseDto.code == 1) {
      Navigator.push(mContext!, MaterialPageRoute(builder: (mContext) => ReviewList()));
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("리뷰 등록 실패 : ${responseDto.msg}")),
      );
    }
  }
}
