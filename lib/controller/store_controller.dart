import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/service/store_service.dart';
import 'package:final_project_beamin_app/view/pages/main/home/model/home_page_view_model.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storeController = Provider<StoreController>((ref) {
  return StoreController();
});

class StoreController {
  final mContext = navigatorKey.currentContext;

  StoreService storeService = StoreService();

  Future<void> storeDetailPage(int storeId) async {
    Navigator.push(
      mContext!,
      MaterialPageRoute(
        builder: (context) => StoreDetailPage(storeId: storeId),
      ),
    );
  }
}
