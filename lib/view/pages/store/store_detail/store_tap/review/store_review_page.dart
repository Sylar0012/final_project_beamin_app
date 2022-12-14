import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/review/components/store_review_body.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/review/model/store_review_model.dart';
import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/review/model/store_review_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreReviewPage extends ConsumerWidget {
  const StoreReviewPage({required this.id, Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StoreReviewModel? model = ref.watch(storeReviewViewModel(id));

    return model == null ? const Center(child: CircularProgressIndicator(color: kMainColor)) : _bulidListView(model);
  }

  Widget _bulidListView(StoreReviewModel model) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: model.customerReview.length,
      itemBuilder: (context, index) {
        return StoreReviewBody(
          model: model.customerReview[index],
        );
      },
    );
  }
}
