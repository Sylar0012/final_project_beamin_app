class MyOrderInfo {
  String phone;
  String address;

  MyOrderInfo(this.phone, this.address);

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "address": address,
    };
  }
}

List<MyOrderInfo> myOrderInfo = [];

class OrderMenu {
  int storeId;
  int menuId;
  String name;
  int price;
  int count;

  OrderMenu(this.storeId, this.menuId, this.name, this.price, this.count);

  Map<String, dynamic> toJson() {
    return {
      "menuId": menuId,
      "name": name,
      "price": price,
      "count": count,
    };
  }
}

List<OrderMenu> orderMenuList = [];
