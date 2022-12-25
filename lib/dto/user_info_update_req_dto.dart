class UserInfoUpdateReqDto {
  int id; // 서비스 로직
  String oldPassword; // 현재 패스워드
  String newPassword; // 바꿀 패스워드
  String address;
  String nickname;
  String phone;
  String photo;

  UserInfoUpdateReqDto({
    required this.id,
    required this.oldPassword,
    required this.newPassword,
    required this.address,
    required this.nickname,
    required this.phone,
    required this.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "address": address,
      "nickname": nickname,
      "phone": phone,
      "photo": photo,
    };
  }
}
