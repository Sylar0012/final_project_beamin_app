import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
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
              // StoreList(img: "치킨", storeName: "네네치킨", starPoint: 4),
              // StoreList(img: "피자", storeName: "도미노피자", starPoint: 5),
              // StoreList(img: "버거", storeName: "롯데리아", starPoint: 3),
              // StoreList(img: "분식", storeName: "신전떡볶이", starPoint: 5),
            ],
          )
        ],
      ),
    );
  }
}
