import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/user_info/info_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme.dart';

class MyBaemin extends StatelessWidget {
  const MyBaemin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildUserTitle(context, "/update"),
          Row(
            children: [
              _buildMenu(context, CupertinoIcons.doc_plaintext, "주문 내역", "/orderList"),
              _buildMenu(context, CupertinoIcons.chat_bubble_2, "리뷰 관리", "/myReview"),
              _buildMenu(context, CupertinoIcons.heart, "찜한 가게", "/favoriteStore"),
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

  Widget _buildMenu(BuildContext context, CupertinoIcons, String msg, String page) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, page);
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

  Widget _buildUserTitle(BuildContext context, msg) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 8, left: 16),
          child: Container(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/category/피자.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(alignment: Alignment.center, child: Text("ssar님 반갑습니다!", style: textTheme().headline1)),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, msg);
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
      title: Text("My 배민", style: textTheme().headline1),
      centerTitle: true,
      elevation: 1.0,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/home");
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
