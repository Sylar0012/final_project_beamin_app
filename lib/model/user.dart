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
