import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/service/menu_service.dart';
import 'package:final_project_beamin_app/service/store_service.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/model/store_detail_model.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/menu/model/menu_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final menuListViewModel = StateNotifierProvider.family<MenuListPageViewModel, MenuListPageModel?, int>((ref, storeId) {
  return MenuListPageViewModel(null, storeId)..notifyViewModel();
});

class MenuListPageViewModel extends StateNotifier<MenuListPageModel?> {
  final MenuService menuService = MenuService();
  final mContext = navigatorKey.currentContext;
  final int storeId;

  MenuListPageViewModel(super.state, this.storeId);
  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await menuService.fetchmenuList(storeId);
    Logger().d("이거 실행되나요 ?1111");
    if (responseDto.code == 1) {
      Logger().d("이거 실행되나요 ?222222 여기는 코드 1이면 실행됩니다");
      state = MenuListPageModel(responseDto.data);
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
