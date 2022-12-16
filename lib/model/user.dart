class User {
  int? id;
  String? address;
  String username;
  String? password;
  String? nickname;
  String? phone;
  String? photo;

  User({
    this.id,
    this.address,
    required this.username,
    this.password,
    this.nickname,
    this.phone,
    this.photo,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        password = json["password"];
}

class UserInfo {
  String username;
  String address;
  String nickname;
  String phone;
  String photo;

  UserInfo({
    required this.username,
    required this.address,
    required this.nickname,
    required this.photo,
    required this.phone,
  });

  UserInfo.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        address = json["address"],
        nickname = json["nickname"],
        photo = json["photo"],
        phone = json["phone"];
}
