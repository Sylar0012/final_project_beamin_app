import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/home/home_page.dart';
import 'package:final_project_beamin_app/view/pages/main/main_page.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({required this.appBar, required this.title, Key? key}) : super(key: key);
  final AppBar appBar;
  final String title;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/home");
        },
        icon: Icon(
          Icons.arrow_back,
          size: 24,
          color: Colors.black,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text("${title}", style: textTheme().headline1),
      centerTitle: true,
      elevation: 1.0,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyOrderList(
                          id: 0,
                        )));
          },
          icon: Icon(
            CupertinoIcons.shopping_cart,
            size: 28,
            color: Colors.black,
          ),
        ),
        SizedBox(width: gap_xs),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
