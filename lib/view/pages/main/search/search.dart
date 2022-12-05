import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/store_list.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int selectedId = 1;
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Container(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    SizedBox(width: gap_xs),
                    _bulidFilterButton(1, "리뷰 많은순"),
                    SizedBox(width: gap_xs),
                    _bulidFilterButton(2, "별점 높은순"),
                    SizedBox(width: gap_xs),
                    _bulidFilterButton(3, "배달비 낮은순"),
                    SizedBox(width: gap_xs),
                    _bulidFilterButton(4, "주문 횟수순"),
                    SizedBox(width: gap_xs),
                  ],
                )
              ],
            ),
          ),
          Container(color: Colors.grey[200], height: 2),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // StoreList(img: "치킨", storeName: "네네치킨", starPoint: 4),
                  // StoreList(img: "피자", storeName: "도미노피자", starPoint: 5),
                  // StoreList(img: "버거", storeName: "롯데리아", starPoint: 3),
                  // StoreList(img: "분식", storeName: "신전떡볶이", starPoint: 5),
                  // StoreList(img: "한식", storeName: "본비빔밥", starPoint: 4),
                  // StoreList(img: "중식", storeName: "홍콩반점", starPoint: 3),
                  // StoreList(img: "보쌈", storeName: "원할머니보쌈", starPoint: 3),
                  // StoreList(img: "죽", storeName: "본죽", starPoint: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulidFilterButton(int id, String Filter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_xs, vertical: gap_xs),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
          color: id == selectedId ? kMainColor : null,
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              selectedId = id;
            });
          },
          child: Text(
            Filter,
            style: TextStyle(color: id == selectedId ? Colors.white : Colors.grey, fontSize: 14, height: 1.0),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
      elevation: 1.0,
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        width: double.infinity,
        height: 40,
        child: Center(
          child: SearchTextField(
            fieldValue: (String value) {
              setState(() {
                text = value;
              });
            },
          ),
        ),
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.zero, // 패딩 설정
          constraints: BoxConstraints(),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderList()));
          },
          icon: Icon(
            CupertinoIcons.cart,
            color: Colors.black,
            size: 28,
          ),
        ),
        SizedBox(
          width: 22,
        )
      ],
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.fieldValue,
  });

  final ValueChanged<String> fieldValue;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      onChanged: (String value) {
        fieldValue('The text has changed to: $value');
      },
      onSubmitted: (String value) {
        fieldValue('Submitted text: $value');
      },
    );
  }
}
