import 'package:final_project_beamin_app/model/store_find_all_resp_dto.dart';

class MenuFindByStoreIdRespDto {
  int id;
  String name;
  String thumbnail;
  String intro;
  int price;
  Store store;

  MenuFindByStoreIdRespDto({
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
  Store({
    required this.id,
    required this.name,
  });
}

List<MenuFindByStoreIdRespDto> menuFindByStoreIdRespDtoList = [
  MenuFindByStoreIdRespDto(
    id: 1,
    name: "후라이드 치킨",
    thumbnail: "assets/images/store/치킨.jpg",
    intro: "네네치킨의 후라이드치킨 입니다 ",
    price: 17000,
    store: Store(id: 1, name: "네네치킨"),
  ),
  MenuFindByStoreIdRespDto(
    id: 2,
    name: "양념 치킨",
    thumbnail: "assets/images/store/치킨.jpg",
    intro: "네네치킨의 양념치킨 입니다 ",
    price: 19000,
    store: Store(id: 1, name: "네네치킨"),
  ),
  MenuFindByStoreIdRespDto(
    id: 3,
    name: "간장 치킨",
    thumbnail: "assets/images/store/치킨.jpg",
    intro: "네네치킨의 간장치킨 입니다 ",
    price: 18000,
    store: Store(id: 1, name: "네네치킨"),
  ),
  MenuFindByStoreIdRespDto(
    id: 4,
    name: "후라이드 치킨",
    thumbnail: "assets/images/store/치킨.jpg",
    intro: "굽네치킨의 후라이드치킨 입니다 ",
    price: 17000,
    store: Store(id: 2, name: "굽네치킨"),
  ),
  MenuFindByStoreIdRespDto(
    id: 5,
    name: "양념 치킨",
    thumbnail: "assets/images/store/치킨.jpg",
    intro: "굽네치킨의 양념치킨 입니다 ",
    price: 19000,
    store: Store(id: 2, name: "굽네치킨"),
  ),
  MenuFindByStoreIdRespDto(
    id: 6,
    name: "간장 치킨",
    thumbnail: "assets/images/store/치킨.jpg",
    intro: "굽네치킨의 간장치킨 입니다 ",
    price: 18000,
    store: Store(id: 2, name: "굽네치킨"),
  ),
];
