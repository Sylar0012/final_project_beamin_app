class StoreFindAllRespDto {
  List<Stores> stores;

  StoreFindAllRespDto({required this.stores});

  StoreFindAllRespDto.fromJson(Map<String, dynamic> json) : stores = json['stores'];
}

class Stores {
  int storeId;
  String storeName;
  String thumbnail;
  int deliveryCost;
  String intro;
  int count;
  double starPoint;

  Stores(
    this.storeId,
    this.storeName,
    this.thumbnail,
    this.deliveryCost,
    this.intro,
    this.count,
    this.starPoint,
  );

  /**
   *   {
      I/flutter ( 4533): โ ๐     "storeId": 2,
      I/flutter ( 4533): โ ๐     "storeName": "๊ทธ๋ฆฐ์นํจ",
      I/flutter ( 4533): โ ๐     "deliveryCost": "2000",
      I/flutter ( 4533): โ ๐     "intro": "๊ทธ๋ฆฐ ์นํจ์๋๋ค.",
      I/flutter ( 4533): โ ๐     "thumbnail": null,
      I/flutter ( 4533): โ ๐     "count": 1,
      I/flutter ( 4533): โ ๐     "starPoint": 4.0
      I/flutter ( 4533): โ ๐   }
   */
  Stores.fromJson(Map<String, dynamic> json)
      : storeId = json["storeId"],
        storeName = json["storeName"],
        deliveryCost = json["deliveryCost"],
        intro = json["intro"],
        thumbnail = json["thumbnail"],
        count = json["count"],
        starPoint = json["starPoint"];
}

// List<StoreFindAllRespDto> storeFindAllRespDtoList = [
//   StoreFindAllRespDto(
//     storeId: 1,
//     storename: "๋ค๋ค์นํจ ๊นํด ์ธ๋์ ",
//     thumbnail: "assets/images/store/์นํจ.jpg",
//     deliveryCost: 3000,
//     intro: "๊ตฝ๋ค์นํจ ์์ผ๋จน์ด๋ผ",
//     starPoint: 4.2,
//   ),
//   StoreFindAllRespDto(
//     storeId: 3,
//     storename: "๋๋ฏธ๋ธ ํผ์ ๊นํด ์ธ๋์ ",
//     thumbnail: "assets/images/store/ํผ์.jpg",
//     deliveryCost: 2000,
//     intro: "ํผ์ ์๋ณผ๋ก ๋จน์ด๋ผ",
//     starPoint: 3.1,
//   ),
//   StoreFindAllRespDto(
//     storeId: 5,
//     storename: "๋กฏ๋ฐ๋ฆฌ์ ๊นํด ์ธ๋์ ",
//     thumbnail: "assets/images/store/๋ฒ๊ฑฐ.png",
//     deliveryCost: 3000,
//     intro: "๋งฅ๋๋ ๋ ๋จน์ด๋ผ",
//     starPoint: 2.7,
//   ),
//   StoreFindAllRespDto(
//     storeId: 7,
//     storename: "์ฃ ์ค ๋ก๋ณถ์ด ๊นํด ์ธ๋์ ",
//     thumbnail: "assets/images/store/๋ก๋ณถ์ด.jpg",
//     deliveryCost: 3000,
//     intro: "์ ์  ๋ก๋ณถ์ด ๋จน์ด๋ผ",
//     starPoint: 2.2,
//   ),
//   StoreFindAllRespDto(
//     storeId: 9,
//     storename: "๋ณธ ๋น๋น๋ฐฅ ๊นํด ์ธ๋์ ",
//     thumbnail: "assets/images/store/๋น๋น๋ฐฅ.jpg",
//     deliveryCost: 3000,
//     intro: "ํ์ฅ ๋์๋ฝ ๋จน์ด๋ผ",
//     starPoint: 4.7,
//   ),
// ];
