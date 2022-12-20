import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/core/routers.dart';
import 'package:final_project_beamin_app/dto/menu_req_dto.dart';
import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';
import 'package:final_project_beamin_app/model/payment_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/payment_page.dart';
import 'package:final_project_beamin_app/view/pages/store/components/store_detail_appber.dart';
import 'package:final_project_beamin_app/view/pages/store/menu_detail/model/menu_detail_model.dart';
import 'package:final_project_beamin_app/view/pages/store/menu_detail/model/menu_detail_view_model.dart';
import 'package:final_project_beamin_app/view/pages/util/my_number_formet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

List<MyOrderRespDto> globalMyOrderItems = List.of(MyOrderRespDtoList);

class MenuDetailPage extends ConsumerStatefulWidget {
  const MenuDetailPage({required this.menuDetailReqDto, Key? key}) : super(key: key);
  final MenuDetailReqDto menuDetailReqDto;
  @override
  ConsumerState<MenuDetailPage> createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends ConsumerState<MenuDetailPage> {
  int orderCount = 1;

  void increase() {
    setState(() {
      if (orderCount < 10) orderCount++;
    });
  }

  void decrease() {
    setState(() {
      if (orderCount > 1) orderCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    MenuDetailPageModel? model = ref.watch(menuDetailPageViewModel(widget.menuDetailReqDto));
    return model == null ? const Center(child: CircularProgressIndicator(color: kMainColor)) : _buildListView(model);
  }

  Widget _buildListView(MenuDetailPageModel model) {
    return Scaffold(
      appBar: StoreDetailAppBer(appBar: AppBar(), title: "", center: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    border: BorderDirectional(bottom: BorderSide(width: 1, color: Color.fromRGBO(221, 221, 221, 1))),
                    image: DecorationImage(
                      image: AssetImage("${model.menuDetail.thumbnail == "" ? "assets/images/category/치킨.jpg" : model.menuDetail.thumbnail}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment(0, 2),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color.fromRGBO(221, 221, 221, 1), width: 1),
                            color: Colors.white,
                          ),
                          height: 160,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(gap_s),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(model.menuDetail.menuName,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFF1E2D2A), shadows: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(1),
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0,
                                        offset: const Offset(0.5, 1),
                                      )
                                    ])),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(height: gap_l),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        model.menuDetail.intro,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF1E2D2A),
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Color.fromRGBO(221, 221, 221, 1),
                ),
                SizedBox(height: gap_m),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: gap_s),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "수량",
                          style: textTheme().headline1,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                decrease();
                              },
                              padding: EdgeInsets.zero, // 패딩 설정
                              constraints: BoxConstraints(),
                              icon: Icon(
                                CupertinoIcons.minus_circle,
                                size: 28,
                              ),
                            ),
                            SizedBox(width: gap_s),
                            Text(
                              '${orderCount}',
                              style: textTheme().headline2,
                            ),
                            SizedBox(width: gap_s),
                            IconButton(
                              onPressed: () {
                                increase();
                              },
                              padding: EdgeInsets.zero, // 패딩 설정
                              constraints: BoxConstraints(),
                              icon: Icon(
                                CupertinoIcons.plus_circle,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: gap_m),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Color.fromRGBO(221, 221, 221, 1),
                ),
                SizedBox(height: gap_m),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_s),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '총 주문 금액 : ',
                        style: textTheme().headline1,
                      ),
                      Text(
                        numberPriceFormat("${model.menuDetail.price * orderCount}"),
                        style: textTheme().headline1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap_s),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: gap_xs, vertical: gap_xs),
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kMainColor),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(
                            () {
                              globalMyOrderItems.add(
                                MyOrderRespDto(
                                  widget.menuDetailReqDto.storeId,
                                  model.menuDetail.phone,
                                  model.menuDetail.address,
                                  model.menuDetail.storeName,
                                  model.menuDetail.minAmount,
                                  model.menuDetail.deliveryHour,
                                  model.menuDetail.deliveryCost,
                                  <OrderMenu>[OrderMenu(widget.menuDetailReqDto.menuId, model.menuDetail.menuName, model.menuDetail.price, orderCount)],
                                ),
                              );
                              Logger().d("globalMyOrderItems.length : ${globalMyOrderItems.length}");
                            },
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
                              content: Text("장바구니에 담았습니다! "),
                            ),
                          );
                        },
                        child: Text(
                          '장바구니에 담기',
                          style: TextStyle(color: kMainColor, fontSize: 14, height: 1.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: gap_xs, vertical: gap_xs),
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: kMainColor), color: kMainColor),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routers.myOrderList);
                        },
                        child: Text(
                          '주문 하기',
                          style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
