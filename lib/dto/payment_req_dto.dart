class PaymentReqDto {
  int orderId;
  String merchantUid;
  int amount;
  String nickname;
  String impUid;
  String menuName;

  PaymentReqDto(this.orderId, this.merchantUid, this.amount, this.nickname, this.impUid, this.menuName);

  Map<String, dynamic> toJson() {
    return {
      "orderId": orderId,
      "impUid": impUid,
      "merchantUid": merchantUid,
      "amount": amount,
      "nickname": nickname,
      "menuName": menuName,
    };
  }
}
