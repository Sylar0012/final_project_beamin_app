import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/service/store_service.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/model/store_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storeDetailPageViewModel = StateNotifierProvider.family<StoreDetailPageViewModel, StoreDetailPageModel?, int>((ref, storeId) {
  return StoreDetailPageViewModel(null, storeId)..notifyViewModel();
});

class StoreDetailPageViewModel extends StateNotifier<StoreDetailPageModel?> {
  final StoreService storeService = StoreService();
  final mContext = navigatorKey.currentContext;
  final int storeId;
  StoreDetailPageViewModel(super.state, this.storeId);
  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await storeService.fetchStoreDetail(storeId);

    if (responseDto.data != null) {
      state = StoreDetailPageModel(responseDto.data);
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
