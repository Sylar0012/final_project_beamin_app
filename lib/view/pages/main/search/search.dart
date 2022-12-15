import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/main/main_page.dart';
import 'package:final_project_beamin_app/view/pages/main/search/model/search_page_model.dart';
import 'package:final_project_beamin_app/view/pages/main/search/model/search_page_view_model.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/my_order_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/store_list.dart';

class Search extends ConsumerStatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  ConsumerState<Search> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  int selectedId = 1;
  String text = '';

  @override
  Widget build(BuildContext context) {
    String enumName = "";
    ModalRoute.of(context)!.settings.arguments == null ? enumName = "" : enumName = ModalRoute.of(context)!.settings.arguments as String;

    SearchPageModel? model = ref.watch(searchPageViewModel(enumName));

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
          model == null
              ? Text("잠시 기다려주세요")
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: model.storesList.length,
                          itemBuilder: (context, index) {
                            return StoreList(
                              storeFindAllList: model.storesList[index],
                            );
                          },
                        ),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderListPage()));
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
