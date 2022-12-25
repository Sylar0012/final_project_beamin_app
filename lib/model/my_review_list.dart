class MyReivew {
  String nickname;
  List<CustomerReviews> customerReviewList;

  MyReivew(this.nickname, this.customerReviewList);
}

class CustomerReviews {
  int orderId;
  String storeName;
  String content;
  String photo;
  double starPoint;
  String comment;

  CustomerReviews({
    required this.orderId,
    required this.storeName,
    required this.content,
    required this.photo,
    required this.starPoint,
    required this.comment,
  });

  CustomerReviews.fromJson(Map<String, dynamic> json)
      : orderId = json["orderId"],
        storeName = json["storeName"],
        content = json["content"],
        photo = json["photo"],
        starPoint = json["starPoint"],
        comment = json["comment"];
}
