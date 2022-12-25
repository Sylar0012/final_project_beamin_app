class JoinReqDto {
  String username;
  String password;
  String nickname;
  String phone;
  String address;

  JoinReqDto(this.username, this.password, this.nickname, this.phone, this.address);

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "nickname": nickname,
        "phone": phone,
        "address": address,
      };

  JoinReqDto.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        password = json["password"],
        nickname = json["nickname"],
        phone = json["phone"],
        address = json["address"];
}

class LoginReqDto {
  final String username;
  final String password;

  LoginReqDto({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}
