import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/search/search_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

enum Category {
  All("전체보기"),
  CHICKEN("치킨"),
  PIZZA("피자"),
  BURGER("버거"),
  SCHOOLFOOD("분식"),
  KRFOOD("한식"),
  CNFOOD("중식"),
  JPFOOD("일식"),
  BOSSAM("보쌈"),
  PORRIDGE("죽");

  const Category(this.displayName);

  final String displayName;
}

class StoreCatagory extends StatelessWidget {
  const StoreCatagory({required this.text, Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    String enumName = "";
    for (int i = 0; i < Category.values.length; i++) {
      if (Category.values[i].displayName == text) {
        enumName = Category.values[i].toString().substring(9);
      }
    }
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Search(), settings: RouteSettings(arguments: enumName)));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/category/${text}.jpg", width: 50, height: 50, fit: BoxFit.cover),
          ),
          SizedBox(height: gap_xs),
          Text("${text}", style: textTheme().bodyText2),
        ],
      ),
    );
  }
}
