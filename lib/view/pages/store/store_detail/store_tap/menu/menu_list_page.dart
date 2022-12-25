import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/dto/menu_req_dto.dart';
import 'package:final_project_beamin_app/model/menu_find_by_store_id_resp_dto.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/menu/components/store_menu.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/menu/model/menu_list_model.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/menu/model/menu_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuList extends ConsumerWidget {
  const MenuList({required this.id, Key? key}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MenuListPageModel? model = ref.watch(menuListViewModel(id));
    print("메뉴 리스트 페이지가 넘겨받은 id : ${id}");

    return model == null ? const Center(child: CircularProgressIndicator(color: kMainColor)) : _bulidListView(model);
  }

  Widget _bulidListView(MenuListPageModel model) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: model.menuList.length,
      itemBuilder: (context, index) {
        return StoreMenu(
          menuFindByStoreIdRespDto: model.menuList[index],
          menuDetailReqDto: MenuDetailReqDto(storeId: id, menuId: model.menuList[index].id),
        );
      },
    );
  }
}
