import 'package:final_project_beamin_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentController = Provider<PaymentController>((ref) {
  return PaymentController();
});

class PaymentController {
  final mContext = navigatorKey.currentContext;
}
