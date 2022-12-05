class User {
  int id;
  String? address;
  String username;
  String? password;
  String? nickname;
  String? phone;
  String? photo;
  String? role;
  bool? isActive;

  User({
    required this.id,
    this.address,
    required this.username,
    this.password,
    this.nickname,
    this.phone,
    this.photo,
    this.role,
    this.isActive,
  });
}

List<User> userList = [
  User(
    id: 1,
    address: "경남 김해시 외동 8888-8",
    username: "ssar",
    password: "1234",
    nickname: "쌀먹",
    phone: "01012345678",
    photo: "assets/images/category/버거.jpg",
    role: "일반 회원",
    isActive: true,
  ),
  User(
    id: 2,
    address: "경남 김해시 외동 7777-7",
    username: "cos",
    password: "1234",
    nickname: "아이cos",
    phone: "01012345678",
    photo: "assets/images/category/간장치킨.jpg",
    role: "일반 회원",
    isActive: true,
  ),
  User(
    id: 3,
    address: "경남 김해시 외동 6666-6",
    username: "coco",
    password: "1234",
    nickname: "coco넛",
    phone: "01012345678",
    photo: "assets/images/category/전체보기.jpg",
    role: "일반 회원",
    isActive: true,
  )
];
