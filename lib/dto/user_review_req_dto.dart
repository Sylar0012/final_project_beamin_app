class UserReviewReqDto {
  String content;
  double starPoint;
  String photo;

  UserReviewReqDto(this.content, this.starPoint, this.photo);

  Map<String, dynamic> toJson() {
    return {"content": content, "starPoint": starPoint, "photo": photo};
  }

  UserReviewReqDto.fromJson(Map<String, dynamic> json)
      : content = json["content"],
        starPoint = json["starPoint"],
        photo = json["photo"];
}
