import 'package:final_project_beamin_app/main.dart';
import 'package:final_project_beamin_app/service/main_service.dart';
import 'package:final_project_beamin_app/view/pages/main/home/model/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainController = Provider<MainController>((ref) {
  return MainController(ref);
});

class MainController {
  final mContext = navigatorKey.currentContext;
  final Ref _ref;
  MainController(this._ref);

  MainService mainService = MainService();

  Future<void> refreshHomePage() async {
    _ref.read(homePageViewModel.notifier).notifyViewModel();
  }
}
