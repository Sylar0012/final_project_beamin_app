import 'package:final_project_beamin_app/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme.dart';
import '../components/store_list.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(children: [
        _buildfilterList(),
        Container(color: Colors.grey[200], height: 2),
      ]),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 1.0,
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        width: double.infinity,
        height: 40,
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Row(
            children: [
              SizedBox(width: gap_xs),
              Icon(
                size: 24,
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              Text("검색", style: textTheme().bodyText2),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.zero, // 패딩 설정
          constraints: BoxConstraints(),
          onPressed: () {},
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

Widget _buildfilterList() {
  return Container(
    height: 48,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Row(
          children: [
            SizedBox(width: gap_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap_xs, vertical: gap_xs),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '리뷰 많은순',
                    style: textTheme().bodyText1,
                  ),
                ),
              ),
            ),
            SizedBox(width: gap_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap_xs, vertical: gap_xs),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '별점 높은순',
                    style: textTheme().bodyText1,
                  ),
                ),
              ),
            ),
            SizedBox(width: gap_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap_xxs, vertical: gap_xs),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '배달비 낮은순',
                    style: textTheme().bodyText1,
                  ),
                ),
              ),
            ),
            SizedBox(width: gap_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap_xs, vertical: gap_xs),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '주문 횟수순',
                    style: textTheme().bodyText1,
                  ),
                ),
              ),
            ),
            SizedBox(width: gap_xs),
          ],
        )
      ],
    ),
  );
}
