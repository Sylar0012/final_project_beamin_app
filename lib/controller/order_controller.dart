import 'package:final_project_beamin_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderController = Provider<OrderController>((ref) {
  return OrderController(ref);
});

class OrderController {
  final mContext = navigatorKey.currentContext;
  final Ref _ref;

  OrderController(this._ref);
}
