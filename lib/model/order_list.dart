class OrderHistory {
  String name;
  String intro;
  String thumbnail;
  String deliveryState;
  String createdAt;
  int orderId;
  int storeId;

  OrderHistory(this.name, this.intro, this.thumbnail, this.deliveryState, this.createdAt, this.orderId, this.storeId);

  OrderHistory.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        intro = json['intro'],
        thumbnail = json['thumbnail'],
        deliveryState = json['deliveryState'],
        createdAt = json['createdAt'],
        orderId = json['orderId'],
        storeId = json['storeId'];
}

/*
*                 "name": "그린치킨",
                "intro": "그린 치킨입니다.",
                "thumbnail": "assets/images/category/간장치킨.jpg",
                "deliveryState": "배달",
                "createdAt": "2022-12-15 16:37:37"
* */
