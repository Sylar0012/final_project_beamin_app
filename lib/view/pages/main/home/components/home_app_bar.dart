import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({required this.userAddress, required this.appBar, Key? key}) : super(key: key);

  final String userAddress;
  final AppBar appBar;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Align(alignment: AlignmentDirectional.bottomCenter, child: Text("${userAddress}", style: textTheme().headline1)),
      centerTitle: true,
      elevation: 1.0,
      actions: [
        IconButton(
          padding: EdgeInsets.zero, // 패딩 설정
          constraints: BoxConstraints(),
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.bell,
            size: 28,
            color: Colors.black,
          ),
        ),
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
        SizedBox(
          width: gap_xs,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
