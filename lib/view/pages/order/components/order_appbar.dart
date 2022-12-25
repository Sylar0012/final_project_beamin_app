import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrderAppBar({required this.appBar, required this.title, required this.center, Key? key}) : super(key: key);
  final AppBar appBar;
  final String title;
  final bool center;
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(
        "${title}",
        style: textTheme().headline1,
      ),
      centerTitle: center,
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        icon: Icon(
          Icons.arrow_back,
          size: 24,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
