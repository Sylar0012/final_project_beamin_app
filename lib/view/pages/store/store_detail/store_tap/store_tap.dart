import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/info/store_info.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/menu/menu_list.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/review/store_review.dart';
import 'package:flutter/material.dart';

class StoreTap extends StatefulWidget {
  const StoreTap({required this.id, Key? key}) : super(key: key);
  final int id;
  @override
  State<StoreTap> createState() => _StoreTapState();
}

class _StoreTapState extends State<StoreTap> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          padding: EdgeInsets.symmetric(horizontal: gap_s),
          indicatorColor: kMainColor,
          controller: _tabController,
          tabs: [
            Tab(child: _bulidStoreCategory("메뉴")),
            Tab(child: _bulidStoreCategory("정보")),
            Tab(child: _bulidStoreCategory("리뷰")),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              MenuList(id: widget.id),
              StoreInfo(id: widget.id),
              StoreReview(id: widget.id),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bulidStoreCategory(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_s),
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            shadows: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                blurRadius: 1.0,
                spreadRadius: 1.0,
                offset: const Offset(0.5, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
