class IamportResponseDto {
  final int? code;
  final String? message;
  dynamic response; // JsonArray [], JsonObject {}

  IamportResponseDto({
    this.code,
    this.message,
    this.response,
  });

  IamportResponseDto.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        message = json["message"],
        response = json["response"];
}
