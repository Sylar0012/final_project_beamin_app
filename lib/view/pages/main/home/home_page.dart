import 'package:card_swiper/card_swiper.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
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
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          _buildMainScreen(),
          Padding(
            padding: const EdgeInsets.all(gap_s),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bulidCategory("전체보기"),
                    _bulidCategory("치킨"),
                    _bulidCategory("피자"),
                    _bulidCategory("버거"),
                    _bulidCategory("분식"),
                  ],
                ),
                SizedBox(height: gap_s),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bulidCategory("한식"),
                    _bulidCategory("중식"),
                    _bulidCategory("일식"),
                    _bulidCategory("보쌈"),
                    _bulidCategory("죽"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulidCategory(String text) {
    return InkWell(
      onTap: () {},
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

AppBar _buildAppBar() {
  return AppBar(
    title: Text("김해시 외동 9999-9번지", style: textTheme().headline1),
    centerTitle: true,
    elevation: 1.0,
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        CupertinoIcons.left_chevron,
        size: 28,
        color: Colors.black,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.shopping_cart,
          size: 28,
          color: Colors.black,
        ),
      ),
      SizedBox(
        width: 16,
      )
    ],
  );
}
