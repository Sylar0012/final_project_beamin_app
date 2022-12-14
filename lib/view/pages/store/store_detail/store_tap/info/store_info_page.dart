import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/info/components/store_info_body.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/info/model/store_info_model.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/info/model/store_info_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreInfo extends ConsumerWidget {
  const StoreInfo({required this.id, Key? key}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StoreInfoModel? model = ref.watch(storeInfoViewModel(id));
    return model == null ? const Center(child: CircularProgressIndicator(color: kMainColor)) : _bulidContainer(model);
  }

  Widget _bulidContainer(StoreInfoModel model) {
    return Container(
      child: StoreInfoBody(
        storeInfoFindByStoreIdRespDto: model.storeInfo,
      ),
    );
  }
}
