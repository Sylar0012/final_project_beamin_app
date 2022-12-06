import 'package:final_project_beamin_app/model/store_detail_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/components/my_star_icon.dart';
import 'package:final_project_beamin_app/view/pages/store/components/store_detail_appber.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/components/store_detail_header.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/store_tap.dart';
import 'package:final_project_beamin_app/view/pages/util/number_formet/my_number_formet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class StoreDetail extends StatelessWidget {
  const StoreDetail({required this.storeDetailRespDto, Key? key}) : super(key: key);
  final StoreDetailRespDto storeDetailRespDto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreDetailAppBer(appBar: AppBar(), title: "", center: false),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  StoreDetailHeader(storeDetailRespDto: storeDetailRespDto),
                ],
              ),
            ),
          ];
        },
        body: StoreTap(),
      ),
    );
  }
}
