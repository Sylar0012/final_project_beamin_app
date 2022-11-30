import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/theme.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAlertDialog extends StatelessWidget {
  final String text;
  const MyAlertDialog({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero, // 패딩 설정
      constraints: BoxConstraints(),
      onPressed: () {
        showDialog(
            context: context,
            barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
            builder: (BuildContext context) {
              return AlertDialog(
                alignment: Alignment.bottomCenter,
                insetPadding: EdgeInsets.zero, // 패딩 설정
                actions: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        child: Expanded(
                          child: const Text(
                            "가게보기",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: Text(
                          '${text} 삭제',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: const Text(
                          '닫기',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              );
            });
      },
      icon: Icon(
        Icons.more_vert_rounded,
        size: 24,
        color: kMenuIconColor,
      ),
    );
  }
}
