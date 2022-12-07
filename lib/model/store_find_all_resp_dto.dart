import 'package:final_project_beamin_app/model/user.dart';

class StoreFindAllRespDto {
  int id;
  String name;
  String thumbnail;
  int deliveryCost;
  String intro;
  double starPoint;

  StoreFindAllRespDto({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.deliveryCost,
    required this.intro,
    required this.starPoint,
  });
}

List<StoreFindAllRespDto> storeFindAllRespDtoList = [
  StoreFindAllRespDto(
    id: 1,
    name: "네네치킨 김해 외동점",
    thumbnail: "assets/images/store/치킨.jpg",
    deliveryCost: 3000,
    intro: "굽네치킨 시켜먹어라",
    starPoint: 4.2,
  ),
  StoreFindAllRespDto(
    id: 3,
    name: "도미노 피자 김해 외동점",
    thumbnail: "assets/images/store/피자.jpg",
    deliveryCost: 2000,
    intro: "피자 알볼로 먹어라",
    starPoint: 3.1,
  ),
  StoreFindAllRespDto(
    id: 5,
    name: "롯데리아 김해 외동점",
    thumbnail: "assets/images/store/버거.png",
    deliveryCost: 3000,
    intro: "맥도날드 먹어라",
    starPoint: 2.7,
  ),
  StoreFindAllRespDto(
    id: 7,
    name: "죠스 떡볶이 김해 외동점",
    thumbnail: "assets/images/store/떡볶이.jpg",
    deliveryCost: 3000,
    intro: "신전 떡볶이 먹어라",
    starPoint: 2.2,
  ),
  StoreFindAllRespDto(
    id: 9,
    name: "본 비빔밥 김해 외동점",
    thumbnail: "assets/images/store/비빔밥.jpg",
    deliveryCost: 3000,
    intro: "한솥 도시락 먹어라",
    starPoint: 4.7,
  ),
];
