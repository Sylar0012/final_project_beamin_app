class MenuListRespDto {
  List<Menus> menuList;

  MenuListRespDto(this.menuList);

  MenuListRespDto.fromJson(Map<String, dynamic> json) : menuList = List<Menus>.from(json["menuList"].map((x) => Menus.fromJson(x)));
}

class Menus {
  int id;
  String name;
  String intro;
  String thumbnail;
  int price;
  String category;

  Menus({
    required this.id,
    required this.name,
    required this.intro,
    required this.thumbnail,
    required this.price,
    required this.category,
  });

  Menus.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        intro = json["intro"],
        thumbnail = json["thumbnail"],
        price = json["price"],
        category = json["category"];
}
