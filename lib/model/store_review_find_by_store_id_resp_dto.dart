import 'package:final_project_beamin_app/model/user.dart';
import 'package:final_project_beamin_app/view/pages/main/components/store_list.dart';

class StoreReviewFindByStoreIdRespDto {
  int id;
  User user;
  List<OrderDetail> orderDetail;
  CeoReview? ceoReview;
  double starPoint;
  String? photo;
  String content;

  StoreReviewFindByStoreIdRespDto({
    required this.id,
    required this.user,
    required this.orderDetail,
    required this.starPoint,
    this.ceoReview,
    this.photo,
    required this.content,
  });
}

class CeoReview {
  int id;
  String content;
  Store store;
  Order order;
  CeoReview({
    required this.id,
    required this.content,
    required this.store,
    required this.order,
  });
}

class Store {
  int id;
  Store({
    required this.id,
  });
}

class User {
  int id;
  String nickname;
  String photo;

  User({
    required this.id,
    required this.nickname,
    required this.photo,
  });
}

class OrderDetail {
  int id;
  int count;
  Order order;
  Menu menu;

  OrderDetail({
    required this.id,
    required this.count,
    required this.order,
    required this.menu,
  });
}

class Menu {
  int id;
  String name;
  Menu({
    required this.id,
    required this.name,
  });
}

class Order {
  int id;
  Order({
    required this.id,
  });
}

List<StoreReviewFindByStoreIdRespDto> storeReviewFindByStoreIdRespDtoList = [
  StoreReviewFindByStoreIdRespDto(
      id: 1,
      starPoint: 5.0,
      photo: "assets/images/category/간장치킨.jpg",
      content: "치킨 맛있게 잘 먹었습니다 ! 담에 또 시킬게여!",
      user: User(id: userList[0].id, nickname: "${userList[0].nickname}", photo: "assets/images/review/default_profile.png"),
      orderDetail: [
        OrderDetail(id: 1, menu: Menu(id: 1, name: "후라이드 치킨"), count: 2, order: Order(id: 1)),
        OrderDetail(id: 2, menu: Menu(id: 2, name: "양념치킨"), count: 1, order: Order(id: 1)),
      ],
      ceoReview: CeoReview(id: 1, content: "감사하므니다.", store: Store(id: 1), order: Order(id: 1))),
  StoreReviewFindByStoreIdRespDto(
      id: 2,
      starPoint: 4.0,
      photo: "assets/images/category/양념치킨.jpg",
      content: "치킨 맛있게 잘 먹었습니다. 근데 양이 좀 작네여",
      user: User(id: userList[1].id, nickname: "${userList[1].nickname}", photo: "assets/images/review/default_profile.png"),
      orderDetail: [OrderDetail(id: 3, count: 1, order: Order(id: 2), menu: Menu(id: 2, name: "양념 치킨"))],
      ceoReview: CeoReview(id: 2, content: "담엔 두마리 시키세연", order: Order(id: 2), store: Store(id: 1))),
  StoreReviewFindByStoreIdRespDto(
      id: 3,
      starPoint: 1.0,
      content: "어흥",
      user: User(id: 3, nickname: "맛없으면 우는 호랑이", photo: "assets/images/review/default_profile.png"),
      orderDetail: [OrderDetail(id: 4, count: 1, order: Order(id: 3), menu: Menu(id: 2, name: "양념 치킨"))],
      ceoReview: CeoReview(id: 3, content: "어흥", order: Order(id: 3), store: Store(id: 1))),
];
