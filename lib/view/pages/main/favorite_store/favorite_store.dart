import 'package:final_project_beamin_app/model/store_find_all_resp_dto.dart';
import 'package:final_project_beamin_app/view/pages/main/components/main_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/store_list.dart';

class FavoriteStore extends StatelessWidget {
  const FavoriteStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBar: AppBar(), title: "찜"),
      body: ListView(
        children: [
          Column(
            children: [
              // ListView.separated(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: 1,
              //   itemBuilder: (context, index) => StoreList(
              //     storeFindAllRespDto: storeFindAllRespDtoList[index],
              //   ),
              //   separatorBuilder: (context, index) => Divider(
              //     indent: 16, // 시작점 ( 앞에 공간 생김 )
              //     endIndent: 16, // 끝점 ( 뒤에 공간 생김 )
              //     color: Colors.grey,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
