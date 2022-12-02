import 'package:card_swiper/card_swiper.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/components/store_list.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/order_list.dart';
import 'package:final_project_beamin_app/view/pages/main/search/search.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        children: [
          _buildMainScreen(),
          Container(color: Colors.grey[200], height: 8),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(gap_s),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bulidCategory("전체보기"),
                    _bulidCategory("치킨"),
                    _bulidCategory("피자"),
                    _bulidCategory("버거"),
                    _bulidCategory("분식"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: gap_s, left: gap_s, bottom: gap_s),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bulidCategory("한식"),
                    _bulidCategory("중식"),
                    _bulidCategory("일식"),
                    _bulidCategory("보쌈"),
                    _bulidCategory("죽"),
                  ],
                ),
              ),
              Container(color: Colors.grey[200], height: 8),
              StoreList(img: "치킨", storeName: "네네치킨", starPoint: 4),
              StoreList(img: "피자", storeName: "도미노피자", starPoint: 5),
              StoreList(img: "버거", storeName: "롯데리아", starPoint: 3),
              StoreList(img: "분식", storeName: "신전떡볶이", starPoint: 5),
              StoreList(img: "한식", storeName: "본비빔밥", starPoint: 4),
              StoreList(img: "중식", storeName: "홍콩반점", starPoint: 3),
              StoreList(img: "보쌈", storeName: "원할머니보쌈", starPoint: 3),
              StoreList(img: "죽", storeName: "본죽", starPoint: 1),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bulidCategory(String text) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/category/${text}.jpg", width: 50, height: 50, fit: BoxFit.cover),
          ),
          SizedBox(height: gap_xs),
          Text(
            "${text}",
            style: textTheme().bodyText2,
          ),
        ],
      ),
    );
  }

  Padding _buildMainScreen() {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Container(
        height: 300,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/home_page/메인${index + 1}.png",
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: 3,
          pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(activeColor: Colors.orange)),
          viewportFraction: 1,
          scale: 0.8,
        ),
      ),
    );
  }
}

AppBar _buildAppBar(context) {
  return AppBar(
    title: Align(alignment: AlignmentDirectional.bottomCenter, child: Text("김해시 외동 9999-9번지", style: textTheme().headline1)),
    centerTitle: true,
    elevation: 1.0,
    actions: [
      IconButton(
        padding: EdgeInsets.zero, // 패딩 설정
        constraints: BoxConstraints(),
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.bell,
          size: 28,
          color: Colors.black,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderList()));
        },
        icon: Icon(
          CupertinoIcons.shopping_cart,
          size: 28,
          color: Colors.black,
        ),
      ),
      SizedBox(
        width: gap_xs,
      )
    ],
  );
}
