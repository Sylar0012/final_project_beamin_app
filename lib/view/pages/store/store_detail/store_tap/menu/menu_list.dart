import 'package:final_project_beamin_app/model/menu_find_by_store_id_resp_dto.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/menu/components/store_menu.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({required this.id, Key? key}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    print("넘겨받은 id : ${id}");
    final list = [];
    for (int i = 0; i < menuFindByStoreIdRespDtoList.length; i++)
      if (id == menuFindByStoreIdRespDtoList[i].store.id) {
        list.add(menuFindByStoreIdRespDtoList[i]);
      }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return StoreMenu(
          menuFindByStoreIdRespDto: list[index],
        );
      },
    );
  }
}
