import 'package:intl/intl.dart';

String numberPriceFormat(String price) {
  final formatter = NumberFormat("##,### 원");
  return formatter.format(int.parse(price));
}

String numberReviewFormat(String reviewCount) {
  if (reviewCount.length > 9999) {
    final formatter = NumberFormat("999+");
    return formatter.format(int.parse(reviewCount));
  } else {
    final formatter = NumberFormat("###");
    return formatter.format(int.parse(reviewCount));
  }
}
