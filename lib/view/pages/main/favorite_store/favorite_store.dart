import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/store_list.dart';

class FavoriteStore extends StatelessWidget {
  const FavoriteStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text("찜", style: textTheme().headline1),
        centerTitle: true,
        elevation: 1.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.shopping_cart,
              size: 28,
              color: Colors.black,
            ),
          ),
          SizedBox(width: gap_xs),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              StoreList(img: "치킨", storeName: "네네치킨", starPoint: 4),
              StoreList(img: "피자", storeName: "도미노피자", starPoint: 5),
              StoreList(img: "버거", storeName: "롯데리아", starPoint: 3),
              StoreList(img: "분식", storeName: "신전떡볶이", starPoint: 5),
            ],
          )
        ],
      ),
    );
  }
}
