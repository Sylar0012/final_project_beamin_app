import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/home/home_page.dart';
import 'package:final_project_beamin_app/view/pages/main/main_page.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list_page.dart';
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
      title: Align(alignment: Alignment.bottomCenter, child: Text("${title}", style: textTheme().headline1)),
      centerTitle: center,
      elevation: 1.0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context, MaterialPageRoute(builder: (context) => MainPage()));
        },
        icon: Icon(
          Icons.arrow_back,
          size: 24,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/myOrderList");
          },
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
