import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/search/search.dart';
import 'package:flutter/material.dart';

class StoreCatagory extends StatelessWidget {
  const StoreCatagory({required this.text, Key? key}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
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
