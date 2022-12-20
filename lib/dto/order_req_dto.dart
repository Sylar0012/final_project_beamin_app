class OrderReqDto {
  int storeId;
  String phone;
  String address;
  String storeName;
  int minAmount;
  String deliveryHour;
  int deliveryCost;
  List<OrderMenu>? menuList;

  OrderReqDto(this.storeId, this.phone, this.address, this.storeName, this.minAmount, this.deliveryHour, this.deliveryCost, this.menuList);

  Map<String, dynamic> toJson() {
    return {
      "storeId": storeId,
      "phone": phone,
      "address": address,
      "storeName": storeName,
      "minAmount": minAmount,
      "deliveryHour": deliveryHour,
      "deliveryCost": deliveryCost,
      "OrderMenu": menuList,
    };
  }
}

class OrderMenu {
  int menuId;
  String name;
  int price;
  int count;

  OrderMenu(this.menuId, this.name, this.price, this.count);

  Map<String, dynamic> toJson() {
    return {
      "menuId": menuId,
      "name": name,
      "price": price,
      "count": count,
    };
  }
}
