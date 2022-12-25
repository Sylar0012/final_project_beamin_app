class IamPortLoginReqDto {
  String impKey = "3754115857271372"; // REST API 키
  String impSecret = "0QUNitiStxPVOLsRZ3jofo9QkTUlVNPtquHz0C76KezJXxuAdV9SNGXrZjPGsM4zIR2pImu3FaMR6lSr"; // REST API secret키

  Map<String, dynamic> toJson() {
    return {
      "imp_key": impKey,
      "imp_secret": impSecret,
    };
  }
}
