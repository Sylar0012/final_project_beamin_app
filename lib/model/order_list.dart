class OrderHistory {
  String name;
  String intro;
  String thumbnail;
  String deliveryState;
  String createdAt;

  OrderHistory({
    required this.name,
    required this.intro,
    required this.thumbnail,
    required this.deliveryState,
    required this.createdAt,
  });

  OrderHistory.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        intro = json['intro'],
        thumbnail = json['thumbnail'],
        deliveryState = json['deliveryState'],
        createdAt = json['createdAt'];
}

/*
*                 "name": "그린치킨",
                "intro": "그린 치킨입니다.",
                "thumbnail": "assets/images/category/간장치킨.jpg",
                "deliveryState": "배달",
                "createdAt": "2022-12-15 16:37:37"
* */
