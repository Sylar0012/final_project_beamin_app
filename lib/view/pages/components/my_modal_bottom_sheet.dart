import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/model/store_detail_resp_dto.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_detail.dart';

import 'package:flutter/material.dart';

class MyModalBottomSheet extends StatelessWidget {
  final String text;
  const MyModalBottomSheet({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero, // 패딩 설정
      constraints: BoxConstraints(),
      onPressed: () {
        showModalBottomSheet<void>(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Color.fromRGBO(248, 248, 252, 1),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoreDetail(
                                      storeDetailRespDto: storeDetailRespDtoList[0],
                                    )));
                      },
                      child: Text("가게보기", style: textTheme().bodyText2),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("${text}삭제", style: TextStyle(fontSize: 16, color: Colors.red)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("닫기", style: textTheme().bodyText2),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      icon: Icon(
        Icons.more_vert_rounded,
        size: 24,
        color: kMenuIconColor,
      ),
    );
  }
}
