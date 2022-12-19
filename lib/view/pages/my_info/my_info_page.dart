import 'dart:convert';

import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/model/user_info_update.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/main/favorite_store/favorite_store.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/order_list_page.dart';
import 'package:final_project_beamin_app/view/pages/my_info/model/my_info_model.dart';
import 'package:final_project_beamin_app/view/pages/my_info/model/my_info_view_model.dart';
import 'package:final_project_beamin_app/view/pages/my_info/review_list/reivew_list.dart';
import 'package:final_project_beamin_app/view/pages/my_info/user_info/info_update_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme.dart';

class MyInfoPage extends ConsumerWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyInfoPageModel? model = ref.watch(myInfoViewModel);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: model == null
          ? const Center(child: CircularProgressIndicator(color: kMainColor))
          : Column(
              children: [
                _buildUserTitle(context, "/update", model),
                Row(
                  children: [
                    _buildMenu(context, CupertinoIcons.doc_plaintext, "주문 내역", OrderListPage()),
                    _buildMenu(context, CupertinoIcons.chat_bubble_2, "리뷰 관리", ReviewList(nickname: model.userInfo.nickname)),
                    _buildMenu(context, CupertinoIcons.heart, "찜한 가게", FavoriteStore()),
                  ],
                ),
                Divider(
                  height: 10,
                  thickness: 10,
                  color: Colors.grey[200],
                ),
              ],
            ),
    );
  }

  Widget _buildMenu(BuildContext context, CupertinoIcons, String msg, settings) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => settings));
        },
        child: Container(
          height: 75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons,
                size: 24,
                color: Colors.grey[600],
              ),
              SizedBox(height: gap_xs),
              Text(
                "${msg}",
                style: textTheme().bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserTitle(BuildContext context, msg, MyInfoPageModel model) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 8, left: 16),
          child: Container(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                model.userInfo.photo == ""
                    ? Icon(CupertinoIcons.person_alt_circle_fill, size: 48, color: Colors.grey[400])
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.memory(base64Decode(model.userInfo.photo), fit: BoxFit.cover, height: 48, width: 48),
                      ),
                Align(alignment: Alignment.center, child: Text("${model.userInfo.nickname}님 반갑습니다!", style: textTheme().headline1)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoUpdatePage(
                            userInfoUpdate: UserInfoUpdate(
                              username: model.userInfo.username,
                              address: model.userInfo.address,
                              nickname: model.userInfo.nickname,
                              photo: model.userInfo.photo,
                              phone: model.userInfo.phone,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.right_chevron,
                      size: 28,
                    )),
              ],
            ),
          ),
        ),
        Divider(
          height: 10,
          thickness: 10,
          color: Colors.grey[200],
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text("내 정보", style: textTheme().headline1),
      centerTitle: true,
      elevation: 1.0,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/main");
          },
          icon: Icon(
            CupertinoIcons.home,
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
}
