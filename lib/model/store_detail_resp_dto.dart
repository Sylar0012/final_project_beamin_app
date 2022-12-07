class StoreDetailRespDto {
  int id;
  String name;
  String thumbnail;
  double starPoint;
  String phone;
  int minAmount;
  String deliveryHour;
  int deliveryCost;
  int customerReviewCount;
  int ceoReviewCount;
  int likeCount;

  StoreDetailRespDto({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.starPoint,
    required this.phone,
    required this.minAmount,
    required this.deliveryHour,
    required this.deliveryCost,
    required this.customerReviewCount,
    required this.ceoReviewCount,
    required this.likeCount,
  });
}

List<StoreDetailRespDto> storeDetailRespDtoList = [
  StoreDetailRespDto(
    id: 1,
    name: "네네치킨 김해 외동점",
    thumbnail: "assets/images/store/치킨.jpg",
    starPoint: 4,
    phone: "055-000-0000",
    minAmount: 17000,
    deliveryHour: "25 ~ 30 분",
    deliveryCost: 3000,
    ceoReviewCount: 10,
    customerReviewCount: 150,
    likeCount: 20,
  ),
  StoreDetailRespDto(
    id: 3,
    name: "도미노 피자 김해 외동점",
    thumbnail: "assets/images/store/피자.jpg",
    deliveryHour: "25 ~ 30 분",
    starPoint: 3,
    phone: "055-000-0000",
    minAmount: 15000,
    deliveryCost: 2000,
    ceoReviewCount: 71,
    customerReviewCount: 223,
    likeCount: 151,
  ),
  StoreDetailRespDto(
    id: 5,
    name: "롯데리아 김해 외동점",
    thumbnail: "assets/images/store/버거.png",
    deliveryHour: "25 ~ 30 분",
    starPoint: 2,
    phone: "055-000-0000",
    minAmount: 13000,
    deliveryCost: 3000,
    ceoReviewCount: 441,
    customerReviewCount: 1223,
    likeCount: 1251,
  ),
  StoreDetailRespDto(
    id: 7,
    name: "죠스 떡볶이 김해 외동점",
    thumbnail: "assets/images/store/떡볶이.jpg",
    deliveryHour: "25 ~ 30 분",
    starPoint: 2,
    phone: "055-000-0000",
    minAmount: 13000,
    deliveryCost: 3000,
    ceoReviewCount: 111,
    customerReviewCount: 421,
    likeCount: 351,
  ),
  StoreDetailRespDto(
    id: 9,
    name: "본 비빔밥 김해 외동점",
    thumbnail: "assets/images/store/비빔밥.jpg",
    deliveryHour: "25 ~ 30 분",
    starPoint: 4,
    phone: "055-000-0000",
    minAmount: 8000,
    deliveryCost: 3000,
    ceoReviewCount: 97,
    customerReviewCount: 131,
    likeCount: 120,
  ),
];