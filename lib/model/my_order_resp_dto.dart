import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  String phone;
  String address;
  String storeName;
  int minAmount;
  String deliveryHour;
  int deliveryCost;
  List<OrderMenu> menuList;

  MyOrderRespDto(this.storeId, this.phone, this.address, this.storeName, this.minAmount, this.deliveryHour, this.deliveryCost, this.menuList);
}

class OrderMenu {
  String name;
  int price;
  int conut;

  OrderMenu(this.name, this.price, this.conut);
}

List<MyOrderRespDto> MyOrderRespDtoList = [];
