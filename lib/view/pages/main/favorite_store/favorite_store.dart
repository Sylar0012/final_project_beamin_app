import 'package:final_project_beamin_app/model/home.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/main/components/main_app_bar.dart';
import 'package:final_project_beamin_app/view/pages/main/favorite_store/model/favorite_store_page_model.dart';
import 'package:final_project_beamin_app/view/pages/main/favorite_store/model/favorite_store_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/store_list.dart';

class FavoriteStore extends ConsumerWidget {
  const FavoriteStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FavoriteStorePageModel? model = ref.watch(favoriteStorePageViewModel);
    return Scaffold(
      appBar: MainAppBar(appBar: AppBar(), title: "찜"),
      body: Column(
        children: [
          model == null
              ? Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "찜한 가게가 없어요 !",
                      style: textTheme().headline1,
                    ),
                  ),
                )
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
}
