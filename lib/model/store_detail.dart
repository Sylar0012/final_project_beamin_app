import 'package:final_project_beamin_app/view/pages/store/store_detail/store_tap/menu/menu_list_page.dart';

class StoreDetailRespDto {
  String name;
  String thumbnail;
  int minAmount;
  String deliveryHour;
  int deliveryCost;
  String phone;
  double starPoint;
  int reviewCount;
  int commentCount;
  int likeCount;
  List<Menu> menuList;

  StoreDetailRespDto({
    required this.name,
    required this.thumbnail,
    required this.starPoint,
    required this.phone,
    required this.minAmount,
    required this.deliveryHour,
    required this.deliveryCost,
    required this.reviewCount,
    required this.commentCount,
    required this.likeCount,
    required this.menuList,
  });
  StoreDetailRespDto.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        thumbnail = json["thumbnail"],
        starPoint = json["starPoint"],
        phone = json["phone"],
        minAmount = json["minAmount"],
        deliveryHour = json["deliveryHour"],
        deliveryCost = json["deliveryCost"],
        reviewCount = json["reviewCount"],
        commentCount = json["commentCount"],
        likeCount = json["likeCount"],
        menuList = List<Menu>.from(json["menuList"].map((x) => Menu.fromJson(x)));
}

class Menu {
  String name;
  String intro;
  String thumbnail;
  int price;
  String category;

  Menu({
    required this.name,
    required this.intro,
    required this.thumbnail,
    required this.price,
    required this.category,
  });

  Menu.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        intro = json["intro"],
        thumbnail = json["thumbnail"],
        price = json["price"],
        category = json["category"];
}

// {
// "msg": "가게 상세보기 기능 성공",
// "data": {
// "name": "그린치킨",
// "minAmount": "10000",
// "deliveryHour": "30",
// "deliveryCost": "2000",
// "phone": "01011112222",
// "starPoint": 5.0,
// "reviewCount": 1,
// "commentCount": 1,
// "likeCount": 1,
// "menuList": [
// {
// "name": "후라이드",
// "intro": "깨끗한 기름으로 튀겼습니다.",
// "thumbnail": "assets/images/category/간장치킨.jpg",
// "price": "18000",
// "category": "MAIN"
// }
// ]
// }
// }

// List<StoreDetailRespDto> storeDetailRespDtoList = [
//   StoreDetailRespDto(
//     id: 1,
//     name: "네네치킨 김해 외동점",
//     thumbnail: "assets/images/store/치킨.jpg",
//     starPoint: 4.1,
//     phone: "055-000-0000",
//     deliveryHour: "45 ~ 50분",
//     minAmount: 17000,
//     deliveryCost: 3000,
//     ceoReviewCount: 10,
//     customerReviewCount: 150,
//     likeCount: 20,
//   ),
//   StoreDetailRespDto(
//     id: 3,
//     name: "도미노 피자 김해 외동점",
//     thumbnail: "assets/images/store/피자.jpg",
//     deliveryHour: "40 ~ 45분",
//     starPoint: 3.7,
//     phone: "055-000-0000",
//     minAmount: 15000,
//     deliveryCost: 2000,
//     ceoReviewCount: 71,
//     customerReviewCount: 223,
//     likeCount: 151,
//   ),
//   StoreDetailRespDto(
//     id: 5,
//     name: "롯데리아 김해 외동점",
//     thumbnail: "assets/images/store/버거.png",
//     deliveryHour: "20 ~ 25분",
//     starPoint: 2.4,
//     phone: "055-000-0000",
//     minAmount: 13000,
//     deliveryCost: 3000,
//     ceoReviewCount: 441,
//     customerReviewCount: 1223,
//     likeCount: 1251,
//   ),
//   StoreDetailRespDto(
//     id: 7,
//     name: "죠스 떡볶이 김해 외동점",
//     thumbnail: "assets/images/store/떡볶이.jpg",
//     deliveryHour: "25 ~ 30 분",
//     starPoint: 2.9,
//     phone: "055-000-0000",
//     minAmount: 13000,
//     deliveryCost: 3000,
//     ceoReviewCount: 111,
//     customerReviewCount: 421,
//     likeCount: 351,
//   ),
//   StoreDetailRespDto(
//     id: 9,
//     name: "본 비빔밥 김해 외동점",
//     thumbnail: "assets/images/store/비빔밥.jpg",
//     deliveryHour: "40 ~ 45분",
//     starPoint: 4.9,
//     phone: "055-000-0000",
//     minAmount: 8000,
//     deliveryCost: 3000,
//     ceoReviewCount: 97,
//     customerReviewCount: 131,
//     likeCount: 120,
//   ),
// ];
