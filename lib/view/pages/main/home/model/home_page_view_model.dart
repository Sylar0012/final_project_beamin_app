import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/service/main_service.dart';
import 'package:final_project_beamin_app/view/pages/main/home/model/home_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final homePageViewModel = StateNotifierProvider<HomePageViewModel, HomePageModel?>((ref) {
  return HomePageViewModel(null)..notifyViewModel();
});

//.autoDispose : 화면이 날아가면 데이터도 같이 날림

class HomePageViewModel extends StateNotifier<HomePageModel?> {
  final MainService mainService = MainService();
  final mContext = navigatorKey.currentContext;

  HomePageViewModel(super.state);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await mainService.fetchStoreList();

    if (responseDto.data != null) {
      state = HomePageModel(responseDto.data);
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
