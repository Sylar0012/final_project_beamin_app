import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/dto/menu_req_dto.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/service/menu_service.dart';
import 'package:final_project_beamin_app/service/review_service.dart';
import 'package:final_project_beamin_app/service/user_service.dart';
import 'package:final_project_beamin_app/view/pages/my_info/model/my_info_model.dart';
import 'package:final_project_beamin_app/view/pages/my_info/review_list/model/my_review_list_page_model.dart';
import 'package:final_project_beamin_app/view/pages/store/menu_detail/model/menu_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myReviewListPageViewModel = StateNotifierProvider.autoDispose<MyReviewListPageViewModel, MyReviewListPageModel?>((ref) {
  return MyReviewListPageViewModel(null)..notifyViewModel();
});

class MyReviewListPageViewModel extends StateNotifier<MyReviewListPageModel?> {
  final ReviewService reviewService = ReviewService();
  final mContext = navigatorKey.currentContext;

  MyReviewListPageViewModel(super.state);
  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await reviewService.fetchReviewList();

    if (responseDto.code == 1) {
      state = MyReviewListPageModel(responseDto.data);
    }
  }
}
