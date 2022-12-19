import 'package:card_swiper/card_swiper.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/components/store_list.dart';
import 'package:final_project_beamin_app/view/pages/main/home/components/home_app_bar.dart';
import 'package:final_project_beamin_app/view/pages/main/home/components/store_category.dart';
import 'package:final_project_beamin_app/view/pages/main/home/model/home_page_model.dart';
import 'package:final_project_beamin_app/view/pages/main/home/model/home_page_view_model.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

final scaffoldKey = GlobalKey<ScaffoldState>();
final refreshKey = GlobalKey<RefreshIndicatorState>();

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar("${UserSession.user.nickname}"),
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
                  SizedBox(height: gap_s),
                  Consumer(
                    builder: (context, ref, child) {
                      HomePageModel? model = ref.watch(homePageViewModel);
                      if (model == null) {
                        return Align(alignment: Alignment.center, child: Text("잠시 기다려주세요"));
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: model.storesList.length,
                          itemBuilder: (context, index) {
                            return StoreList(
                              storeFindAllList: model.storesList[index],
                            );
                          },
                        );
                      }
                    },
                  ),
                  SizedBox(height: gap_s),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(String usernickname) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Align(alignment: AlignmentDirectional.bottomCenter, child: Text("$usernickname님 반갑습니다", style: textTheme().headline1)),
      centerTitle: true,
      elevation: 1.0,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderListPage()));
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
