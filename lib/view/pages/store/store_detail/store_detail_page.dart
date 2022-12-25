import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/controller/store_controller.dart';
import 'package:final_project_beamin_app/model/store_detail.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/components/my_star_icon.dart';
import 'package:final_project_beamin_app/view/pages/store/components/store_detail_appber.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/components/store_detail_header.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/model/store_detail_model.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/model/store_detail_view_model.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/store_tap.dart';
import 'package:final_project_beamin_app/view/pages/util/my_number_formet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';

class StoreDetailPage extends ConsumerWidget {
  const StoreDetailPage({required this.storeId, Key? key}) : super(key: key);
  final int storeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StoreDetailPageModel? model = ref.watch(storeDetailPageViewModel(storeId));
    return Scaffold(
      appBar: StoreDetailAppBer(appBar: AppBar(), title: "${model?.storeDetail.name}", center: false),
      body: model == null ? const Center(child: CircularProgressIndicator(color: kMainColor)) : _buildNestedScrollView(model),
    );
  }

  NestedScrollView _buildNestedScrollView(StoreDetailPageModel model) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                StoreDetailHeader(storeDetailRespDto: model.storeDetail),
              ],
            ),
          ),
        ];
      },
      body: StoreTap(id: storeId),
    );
  }
}
