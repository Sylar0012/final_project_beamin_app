import 'package:final_project_beamin_app/model/store_info_find_by_store_id_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/info/components/store_info_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreInfo extends StatelessWidget {
  const StoreInfo({required this.id, Key? key}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    final list = [];
    for (int i = 0; i < storeInfoFindByStoreIdRespDtoList.length; i++)
      if (id == storeInfoFindByStoreIdRespDtoList[i].store.id) {
        list.add(storeInfoFindByStoreIdRespDtoList[i]);
      }
    return Container(
      child: StoreInfoBody(
        storeInfoFindByStoreIdRespDto: list[0],
      ),
    );
  }
}
