class StoreInfoFindByStoreIdRespDto {
  int id;
  String notice;
  int minAmount;
  String deliveryHour;
  int deliveryCost;
  String name;
  String ceoName;
  String businessNumber;
  Store store;

  StoreInfoFindByStoreIdRespDto({
    required this.id,
    required this.notice,
    required this.minAmount,
    required this.deliveryHour,
    required this.deliveryCost,
    required this.name,
    required this.ceoName,
    required this.businessNumber,
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

List<StoreInfoFindByStoreIdRespDto> storeInfoFindByStoreIdRespDtoList = [
  StoreInfoFindByStoreIdRespDto(
    id: 1,
    notice: "네네치킨 김해 외동점 입니다. 주문시 리뷰 써주신다고 하시면 콜라 한캔 서비스로 드립니다.",
    minAmount: 17000,
    deliveryHour: "45 ~ 50분",
    deliveryCost: 3000,
    name: "네네치킨 김해 외동점",
    ceoName: "김치킨",
    businessNumber: "1234567890",
    store: Store(id: 1, name: "네네치킨"),
  ),
  StoreInfoFindByStoreIdRespDto(
    id: 2,
    notice: "도미노 피자 김해 외동점 입니다. 주문시 리뷰 써주신다고 하시면 콜라 한캔 서비스로 드립니다.",
    minAmount: 15000,
    deliveryHour: "40 ~ 45분",
    deliveryCost: 2000,
    name: "도미노 피자 김해 외동점",
    ceoName: "김피자",
    businessNumber: "0987654321",
    store: Store(id: 3, name: "도미노 피자"),
  ),
  StoreInfoFindByStoreIdRespDto(
    id: 3,
    notice: "롯데리아 김해 외동점 입니다. 주문시 리뷰 써주신다고 하시면 사이다 한캔 서비스로 드립니다.",
    minAmount: 13000,
    deliveryHour: "20 ~ 25분",
    deliveryCost: 3000,
    name: "롯데리아 김해 외동점",
    ceoName: "김버거",
    businessNumber: "7894561230",
    store: Store(id: 5, name: "롯데리아"),
  ),
  StoreInfoFindByStoreIdRespDto(
    id: 4,
    notice: "죠스 떡볶이 김해 외동점 입니다. 주문시 리뷰 써주신다고 하시면 쥬시쿨 한캔 서비스로 드립니다.",
    minAmount: 8000,
    deliveryHour: "25 ~ 30분",
    deliveryCost: 3000,
    name: "죠스 떡볶이 김해 외동점",
    ceoName: "김분식",
    businessNumber: "4567891230",
    store: Store(id: 7, name: "죠스 떡볶이"),
  ),
  StoreInfoFindByStoreIdRespDto(
    id: 5,
    notice: "본 비빔밥 김해 외동점 입니다. 주문시 리뷰 써주신다고 하시면 밥을 비빔분의 비빔박자로 비벼서 드립니다",
    minAmount: 8000,
    deliveryHour: "40 ~ 45분",
    deliveryCost: 3000,
    name: "본 비빔밥 김해 외동점",
    ceoName: "유비빔",
    businessNumber: "1234560789",
    store: Store(id: 9, name: "본 비빔밥"),
  ),
];
