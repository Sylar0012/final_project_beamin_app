import 'package:card_swiper/card_swiper.dart';
import 'package:final_project_beamin_app/model/store.dart';
import 'package:final_project_beamin_app/model/store_list_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/components/store_list.dart';
import 'package:final_project_beamin_app/view/pages/main/home/components/home_app_bar.dart';
import 'package:final_project_beamin_app/view/pages/main/home/components/store_category.dart';
import 'package:final_project_beamin_app/view/pages/main/search/search.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_detail.dart';
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
          Column(
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
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: storeFindAllRespDtoList.length,
                    itemBuilder: (context, index) => StoreList(
                      storeFindAllRespDto: storeFindAllRespDtoList[index],
                    ),
                    separatorBuilder: (context, index) => Divider(
                      indent: 16, // 시작점 ( 앞에 공간 생김 )
                      endIndent: 16, // 끝점 ( 뒤에 공간 생김 )
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
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
