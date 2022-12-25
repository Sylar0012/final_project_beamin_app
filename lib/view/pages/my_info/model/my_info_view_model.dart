import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/dto/menu_req_dto.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/service/menu_service.dart';
import 'package:final_project_beamin_app/service/user_service.dart';
import 'package:final_project_beamin_app/view/pages/my_info/model/my_info_model.dart';
import 'package:final_project_beamin_app/view/pages/store/menu_detail/model/menu_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myInfoViewModel = StateNotifierProvider.autoDispose<MyInfoPageViewModel, MyInfoPageModel?>((ref) {
  return MyInfoPageViewModel(null)..notifyViewModel();
});

class MyInfoPageViewModel extends StateNotifier<MyInfoPageModel?> {
  final UserService userService = UserService();
  final mContext = navigatorKey.currentContext;

  MyInfoPageViewModel(super.state);
  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await userService.fetchUserInfo();

    if (responseDto.code == 1) {
      state = MyInfoPageModel(responseDto.data);
    }
  }
}
