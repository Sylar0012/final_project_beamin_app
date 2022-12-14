import 'package:final_project_beamin_app/view/pages/main/favorite_store/favorite_store_page.dart';
import 'package:final_project_beamin_app/view/pages/main/home/home_page.dart';
import 'package:final_project_beamin_app/view/pages/main/order_list/order_list_page.dart';
import 'package:final_project_beamin_app/view/pages/main/search/search_page.dart';
import 'package:final_project_beamin_app/view/pages/my_info/my_info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(
            () {
              _selectedIndex = index;
              if (_selectedIndex == null) {
                _selectedIndex = 0;
              }
              if (_selectedIndex == 4) {
                _selectedIndex = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyInfoPage()),
                );
              }
            },
          );
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(label: "홈", icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(label: "검색", icon: Icon(CupertinoIcons.search)),
          BottomNavigationBarItem(label: "찜한가게", icon: Icon(CupertinoIcons.heart)),
          BottomNavigationBarItem(label: "주문내역", icon: Icon(CupertinoIcons.doc_plaintext)),
          BottomNavigationBarItem(
            label: "내 정보",
            icon: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfoPage()));
              },
              icon: Icon(
                CupertinoIcons.person_circle,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          Search(),
          FavoriteStore(),
          OrderListPage(),
          HomePage(),
        ],
      ),
    );
  }
}
