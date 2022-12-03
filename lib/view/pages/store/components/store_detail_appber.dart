import 'package:final_project_beamin_app/view/pages/main/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreDetailAppBer extends StatelessWidget implements PreferredSizeWidget {
  const StoreDetailAppBer({required this.appBar, required this.title, required this.center, Key? key}) : super(key: key);
  final AppBar appBar;
  final String title;
  final bool center;
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text("${title}"),
      centerTitle: center,
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        icon: Icon(
          CupertinoIcons.left_chevron,
          size: 28,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.shopping_cart,
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

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
