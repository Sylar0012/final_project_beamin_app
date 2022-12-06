import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:final_project_beamin_app/view/pages/components/my_star_icon.dart';

class ReviewWrite extends StatefulWidget {
  const ReviewWrite({Key? key}) : super(key: key);

  @override
  State<ReviewWrite> createState() => _ReviewWriteState();
}

class _ReviewWriteState extends State<ReviewWrite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(gap_s),
            child: Column(
              children: [
                Text(
                  "이 가게를 추천 하시겠어요?",
                  style: textTheme().headline1,
                ),
                SizedBox(height: gap_m),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyStarIcon(CupertinoIcons.star_fill, 40),
                    MyStarIcon(CupertinoIcons.star_fill, 40),
                    MyStarIcon(CupertinoIcons.star_fill, 40),
                    MyStarIcon(CupertinoIcons.star_fill, 40),
                    MyStarIcon(CupertinoIcons.star_fill, 40),
                  ],
                ),
                SizedBox(height: gap_m),
                Text("사진을 첨부해 주세요!", style: textTheme().headline1),
                SizedBox(height: gap_m),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: kMenuIconColor)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.camera,
                      color: kMenuIconColor,
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(height: gap_m),
                Text("리뷰를 작성 해주세요!", style: textTheme().headline1),
                SizedBox(height: gap_m),
                TextFormField(
                  cursorColor: kMainColor,
                  maxLines: 10,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "리뷰를 작성 해주세요!",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kMenuIconColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kMenuIconColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kMainColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kMenuIconColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: gap_m),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: kMainColor,
                        minimumSize: Size(150, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text("리뷰쓰기"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    title: Text("리뷰 쓰기", style: textTheme().headline1),
    centerTitle: true,
    elevation: 1.0,
  );
}
