/**
 * 장바구니에 필요한 데이터들
 *  store : storeId, storeName, minAmount(최소 주문금액),deliveryHour(배달시간 ),
 * menuList : name, price
 *
 * 필요한 로직 : storeId값이 다르다면 장바구니 비우기 시도 , x버튼 누르면 메뉴 사라지게 해야함. 메뉴는 여러개 담길수 있게 해야함.
 *
 *
 *
 */

class MyOrderRespDto {
  int storeId;
  String storeName;
  int minAmount;
  String deliveryHour;
  int deliveryCost;
  List<OrderMenu> menuList;

  MyOrderRespDto({
    required this.storeId,
    required this.storeName,
    required this.minAmount,
    required this.deliveryHour,
    required this.deliveryCost,
    required this.menuList,
  });
}

class OrderMenu {
  String name;
  int price;
  int conut;
  OrderMenu({
    required this.name,
    required this.price,
    required this.conut,
  });
}
