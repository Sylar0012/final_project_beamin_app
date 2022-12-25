class Payment {
  int storeId;
  String phone;
  String address;
  String storeName;
  int minAmount;
  String deliveryHour;
  int deliveryCost;

  List<OrderMenuForPayment> menuList;

  Payment(this.storeId, this.phone, this.address, this.storeName, this.minAmount, this.deliveryHour, this.deliveryCost, this.menuList);
}

class OrderMenuForPayment {
  String name;
  int price;
  int conut;
  OrderMenuForPayment(
    this.name,
    this.price,
    this.conut,
  );
}
