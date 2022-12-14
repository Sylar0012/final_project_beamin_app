class CustomerReviewDto {
  int orderId;
  String nickname;
  String? crPhoto;
  String content;
  double starPoint;
  String comment;
  List<CustomerMenuDtos> customerMenuDtos;
  String uphoto;

  CustomerReviewDto({
    required this.orderId,
    required this.nickname,
    this.crPhoto,
    required this.content,
    required this.starPoint,
    required this.comment,
    required this.customerMenuDtos,
    required this.uphoto,
  });

  CustomerReviewDto.fromJson(Map<String, dynamic> json)
      : orderId = json['orderId'],
        nickname = json['nickname'],
        crPhoto = json['crPhoto'],
        content = json['content'],
        starPoint = json['starPoint'],
        comment = json['comment'],
        customerMenuDtos = List<CustomerMenuDtos>.from(json["customerMenuDtos"].map((x) => CustomerMenuDtos.fromJson(x))),
        uphoto = json['uphoto'];
}

class CustomerMenuDtos {
  int orderId;
  String menuName;

  CustomerMenuDtos({required this.orderId, required this.menuName});

  CustomerMenuDtos.fromJson(Map<String, dynamic> json)
      : orderId = json['orderId'],
        menuName = json['menuName'];
}
