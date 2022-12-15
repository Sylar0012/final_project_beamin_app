import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/dto/menu_req_dto.dart';
import 'package:final_project_beamin_app/dto/response_dto.dart';
import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/service/menu_service.dart';
import 'package:final_project_beamin_app/view/pages/store/menu_detail/model/menu_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuDetailPageViewModel = StateNotifierProvider.family.autoDispose<MenuDetailPageViewModel, MenuDetailPageModel?, MenuDetailReqDto>((ref, MenuDetailReqDto) {
  return MenuDetailPageViewModel(null, MenuDetailReqDto)..notifyViewModel();
});

class MenuDetailPageViewModel extends StateNotifier<MenuDetailPageModel?> {
  final MenuService menuService = MenuService();
  final mContext = navigatorKey.currentContext;
  final MenuDetailReqDto menuDetailReqDto;

  MenuDetailPageViewModel(super.state, this.menuDetailReqDto);
  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await menuService.fetchMenuDetail(menuDetailReqDto.storeId, menuDetailReqDto.menuId);

    if (responseDto.code == 1) {
      state = MenuDetailPageModel(responseDto.data);
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
