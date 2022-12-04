import 'package:card_swiper/card_swiper.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/components/store_list.dart';
import 'package:final_project_beamin_app/view/pages/main/home/components/home_app_bar.dart';
import 'package:final_project_beamin_app/view/pages/main/home/components/store_category.dart';
import 'package:final_project_beamin_app/view/pages/main/search/search.dart';
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
      appBar: HomePageAppBar(appBar: AppBar(), userAddress: "외동 9999-9번지"),
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
                    StoreCatagory(text: "전체보기"),
                    StoreCatagory(text: "치킨"),
                    StoreCatagory(text: "피자"),
                    StoreCatagory(text: "버거"),
                    StoreCatagory(text: "분식"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: gap_s, left: gap_s, bottom: gap_s),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StoreCatagory(text: "한식"),
                    StoreCatagory(text: "중식"),
                    StoreCatagory(text: "일식"),
                    StoreCatagory(text: "보쌈"),
                    StoreCatagory(text: "죽"),
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

  Padding _buildMainScreen() {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Container(
        height: 300,
        child: Swiper(
          autoplay: true,
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
