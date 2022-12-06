enum Routes {
  login("/login"),
  join("/join"),
  home("/home"),
  myBaemin("/myBaemin"),
  store("/store"),
  favoriteStore("/favoriteStore"),
  orderDetail("/orderDetail"),
  orderList("/orderList"),
  myReview("/myReview"),
  reviewWrite("/reviewWrite"),
  inactive("/inactive"),
  update("/update"),
  myOrderList("/myOrderList"),
  payment("/payment"),
  paymentDetail("/paymentDetail"),
  menuDetail("/menuDetail"),
  storeDetail("/storeDetail");

  final String path;
  const Routes(this.path);
}
