import 'package:final_project_beamin_app/controller/store_controller.dart';
import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/service/store_service.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/review/model/store_review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final storeReviewViewModel = StateNotifierProvider.family<StoreReviewViewModel, StoreReviewModel?, int>((ref, storeId) {
  return StoreReviewViewModel(null, storeId)..notifyViewModel();
});

class StoreReviewViewModel extends StateNotifier<StoreReviewModel?> {
  final StoreService storeService = StoreService();
  final mContext = navigatorKey.currentContext;
  final int storeId;

  StoreReviewViewModel(super.state, this.storeId);
  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await storeService.fetchStoreReview(storeId);
    Logger().d("이거 실행되나요 ?1111");
    if (responseDto.code == 1) {
      Logger().d("이거 실행되나요 ?222222 여기는 코드 1이면 실행됩니다");
      state = StoreReviewModel(responseDto.data);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("Jwt 토큰이 만료되었습니다. 로그인 페이지로 이동합니다.")),
      );
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamedAndRemoveUntil(mContext!, Routers.login, (route) => false);
      });
    }
  }
}
