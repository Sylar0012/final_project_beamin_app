class MenuDetail {
  String name;
  String intro;
  int price;
  String thumbnail;

  MenuDetail({
    required this.name,
    required this.thumbnail,
    required this.intro,
    required this.price,
  });

  MenuDetail.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        thumbnail = json["thumbnail"],
        intro = json["intro"],
        price = json["price"];
}

// List<MenuFindByIdRespDto> menuFindByIdRespDtoList = [
//   MenuFindByIdRespDto(
//     id: 1,
//     name: "후라이드 치킨",
//     thumbnail: "assets/images/store/치킨.jpg",
//     intro: "네네치킨의 후라이드치킨 입니다 ",
//     price: 17000,
//     store: Store(
//       id: storeDetailRespDtoList[0].id,
//       name: storeDetailRespDtoList[0].name,
//       deliveryCost: storeDetailRespDtoList[0].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[0].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 2,
//     name: "양념 치킨",
//     thumbnail: "assets/images/store/치킨.jpg",
//     intro: "네네치킨의 양념치킨 입니다 ",
//     price: 19000,
//     store: Store(
//       id: storeDetailRespDtoList[0].id,
//       name: storeDetailRespDtoList[0].name,
//       deliveryCost: storeDetailRespDtoList[0].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[0].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 3,
//     name: "간장 치킨",
//     thumbnail: "assets/images/store/치킨.jpg",
//     intro: "네네치킨의 간장치킨 입니다 ",
//     price: 18000,
//     store: Store(
//       id: storeDetailRespDtoList[0].id,
//       name: storeDetailRespDtoList[0].name,
//       deliveryCost: storeDetailRespDtoList[0].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[0].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 4,
//     name: "포테이토 피자",
//     thumbnail: "assets/images/store/피자.jpg",
//     intro: "도미노 피자의 포테이토 피자 입니다 ",
//     price: 17000,
//     store: Store(
//       id: storeDetailRespDtoList[1].id,
//       name: storeDetailRespDtoList[1].name,
//       deliveryCost: storeDetailRespDtoList[1].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[1].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 5,
//     name: "불고기 피자",
//     thumbnail: "assets/images/store/피자.jpg",
//     intro: "도미노 피자의 불고기 피자 입니다 ",
//     price: 17000,
//     store: Store(
//       id: storeDetailRespDtoList[1].id,
//       name: storeDetailRespDtoList[1].name,
//       deliveryCost: storeDetailRespDtoList[1].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[0].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 6,
//     name: "콤비네이션 피자",
//     thumbnail: "assets/images/store/피자.jpg",
//     intro: "도미노 피자의 콤비네이션 피자 입니다 ",
//     price: 17000,
//     store: Store(
//       id: storeDetailRespDtoList[1].id,
//       name: storeDetailRespDtoList[1].name,
//       deliveryCost: storeDetailRespDtoList[1].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[1].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 7,
//     name: "불고기 버거 세트",
//     thumbnail: "assets/images/store/버거.png",
//     intro: "롯데리아의 불고기 버거 세트 입니다 ",
//     price: 5800,
//     store: Store(
//       id: storeDetailRespDtoList[2].id,
//       name: storeDetailRespDtoList[2].name,
//       deliveryCost: storeDetailRespDtoList[2].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[2].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 8,
//     name: "데리 버거 세트",
//     thumbnail: "assets/images/store/버거.png",
//     intro: "롯데리아의 데리 버거 세트 입니다 ",
//     price: 4800,
//     store: Store(
//       id: storeDetailRespDtoList[2].id,
//       name: storeDetailRespDtoList[2].name,
//       deliveryCost: storeDetailRespDtoList[2].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[2].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 9,
//     name: "치즈 버거 세트",
//     thumbnail: "assets/images/store/버거.png",
//     intro: "롯데리아의 치즈 버거 세트 입니다 ",
//     price: 5300,
//     store: Store(
//       id: storeDetailRespDtoList[2].id,
//       name: storeDetailRespDtoList[2].name,
//       deliveryCost: storeDetailRespDtoList[2].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[2].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 10,
//     name: "치즈 떡볶이",
//     thumbnail: "assets/images/store/떡볶이.jpg",
//     intro: "죠스 떡볶이의 치즈 떡볶이 입니다 ",
//     price: 13000,
//     store: Store(
//       id: storeDetailRespDtoList[3].id,
//       name: storeDetailRespDtoList[3].name,
//       deliveryCost: storeDetailRespDtoList[3].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[3].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 11,
//     name: "버섯 크림 떡볶이",
//     thumbnail: "assets/images/store/떡볶이.jpg",
//     intro: "죠스 떡볶이의 버섯 크림 떡볶이 입니다 ",
//     price: 14000,
//     store: Store(
//       id: storeDetailRespDtoList[3].id,
//       name: storeDetailRespDtoList[3].name,
//       deliveryCost: storeDetailRespDtoList[3].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[3].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 12,
//     name: "로제 크림 떡볶이",
//     thumbnail: "assets/images/store/떡볶이.jpg",
//     intro: "죠스 떡볶이의 로제 크림 떡볶이 입니다 ",
//     price: 15000,
//     store: Store(
//       id: storeDetailRespDtoList[3].id,
//       name: storeDetailRespDtoList[3].name,
//       deliveryCost: storeDetailRespDtoList[3].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[3].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 13,
//     name: "제육 비빔밥",
//     thumbnail: "assets/images/store/비빔밥.jpg",
//     intro: "본 비빔밥의 제육 비빔밥 입니다 ",
//     price: 9000,
//     store: Store(
//       id: storeDetailRespDtoList[4].id,
//       name: storeDetailRespDtoList[4].name,
//       deliveryCost: storeDetailRespDtoList[4].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[4].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 14,
//     name: "산채 비빔밥",
//     thumbnail: "assets/images/store/비빔밥.jpg",
//     intro: "본 비빔밥의 산채 비빔밥 입니다 ",
//     price: 8000,
//     store: Store(
//       id: storeDetailRespDtoList[4].id,
//       name: storeDetailRespDtoList[4].name,
//       deliveryCost: storeDetailRespDtoList[4].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[4].deliveryHour,
//     ),
//   ),
//   MenuFindByIdRespDto(
//     id: 15,
//     name: "불고기 비빔밥",
//     thumbnail: "assets/images/store/비빔밥.jpg",
//     intro: "본 비빔밥의 불고기 비빔밥 입니다 ",
//     price: 9000,
//     store: Store(
//       id: storeDetailRespDtoList[4].id,
//       name: storeDetailRespDtoList[4].name,
//       deliveryCost: storeDetailRespDtoList[4].deliveryCost,
//       deliveryHour: storeDetailRespDtoList[4].deliveryHour,
//     ),
//   ),
// ];
