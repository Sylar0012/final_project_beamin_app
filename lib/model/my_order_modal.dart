class MyOrderModal {
  int id;
  String name;
  String thumbnail;
  String intro;
  int price;
  Store store;

  MyOrderModal({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.intro,
    required this.price,
    required this.store,
  });
}

class Store {
  int id;
  String name;
  int deliveryCost;
  String deliveryHour;
  Store({
    required this.id,
    required this.name,
    required this.deliveryCost,
    required this.deliveryHour,
  });
}

List<MyOrderModal> myOrderListModal = [];
