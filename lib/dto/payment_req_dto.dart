import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';

class PaymentReqDto {
  String comment;
  String deliveryStateEnum;
  List<OrderDetailList> orderDetailList;

  PaymentReqDto(this.comment, this.deliveryStateEnum, this.orderDetailList);

  Map<String, dynamic> toJson() {
    return {
      "comment": comment,
      "deliveryStateEnum": deliveryStateEnum,
      "orderDetailList": orderDetailList,
    };
  }
}

class OrderDetailList {
  int storeId;
  int menuId;
  String name;
  int price;
  int count;

  OrderDetailList(this.storeId, this.menuId, this.name, this.price, this.count);

  Map<String, dynamic> toJson() {
    return {
      "menuId": menuId,
      "count": count,
    };
  }
}

List<OrderDetailList> list = [];
