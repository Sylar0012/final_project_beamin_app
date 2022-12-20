import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/controller/order_controller.dart';
import 'package:final_project_beamin_app/dto/payment_req_dto.dart';
import 'package:final_project_beamin_app/model/my_order_resp_dto.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/order/order_list/components/my_order_list_body.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/iamport_dto/iamport_req_dto/iamport_data.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/iamport_payment/payment_model/pg.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/model/payment_page_model.dart';
import 'package:final_project_beamin_app/view/pages/order/payment/model/payment_page_view_model.dart';
import 'package:final_project_beamin_app/view/pages/store/menu_detail/menu_detail_page.dart';
import 'package:final_project_beamin_app/view/pages/util/my_number_formet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

enum Comment { defaultMsg, costomMsg }

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({required this.orderType, required this.myOrderInfo, required this.orderMenu, Key? key}) : super(key: key);
  final OrderType orderType;
  final List<OrderMenu> orderMenu;
  final List<MyOrderInfo> myOrderInfo;

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  Comment? _comment = Comment.defaultMsg;
  int selectedId = 1;

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;

    final _orderComment = TextEditingController();
    OrderController odCT = ref.read(orderController);
    for (int i = 0; i < widget.orderMenu.length; i++) {
      totalPrice += widget.orderMenu[i].price * widget.orderMenu[i].count;
    }
    PaymentPageModel? model = ref.watch(paymentPageViewModel(widget.orderMenu[0].storeId));
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("주문자 정보", style: textTheme().headline1),
                SizedBox(height: gap_s),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_s),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("연락 받을 번호 : ${widget.myOrderInfo[0].phone}", style: textTheme().bodyText2),
                      SizedBox(height: gap_s),
                      Text(widget.myOrderInfo[0].address, style: textTheme().bodyText2),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("주문 요청 사항", style: textTheme().headline1),
                SizedBox(height: gap_s),
                _bulidOrderType(Comment.defaultMsg, "문 앞에 놔둬 주세요"),
                SizedBox(height: gap_s),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bulidOrderType(Comment.costomMsg, ""),
                    _buildTextFormField("주문시 요청 사항", 300, _orderComment),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("결제 수단", style: textTheme().headline1),
                SizedBox(height: gap_s),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: gap_m),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _bulidPaymentButton(1, "카드 결제"),
                      _bulidPaymentButton(2, "만나서 결제"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("주문 내역", style: textTheme().headline1),
                SizedBox(height: gap_s),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.orderMenu.length,
                  itemBuilder: (context, index) {
                    return _buildOrder(widget.orderMenu[index]);
                  },
                ),
                widget.orderType == OrderType.delivery
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: gap_s),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("배달 비용", style: textTheme().bodyText2),
                            Text(numberPriceFormat("${model?.storeDetail.deliveryCost}"), style: textTheme().bodyText2),
                          ],
                        ),
                      )
                    : Container(),
                SizedBox(height: gap_s),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_s),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("결제 금액", style: textTheme().bodyText1),
                      widget.orderType == OrderType.delivery
                          ? Text(numberPriceFormat("${model!.storeDetail.deliveryCost + totalPrice}"), style: textTheme().bodyText1)
                          : Text(numberPriceFormat("${totalPrice}"), style: textTheme().bodyText1)
                    ],
                  ),
                ),
                SizedBox(height: gap_m),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_m),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: kMainColor),
                      color: kMainColor,
                    ),
                    child: TextButton(
                      onPressed: () {
                        odCT.saveOrder(PaymentReqDto(_comment == Comment.defaultMsg ? "문 앞에 나둬 주세요" : _orderComment.text.trim(), widget.orderType == OrderType.pickup ? "TAKEOUT" : "DELIVERY",
                            widget.orderMenu.map((e) => OrderDetailList(e.storeId, e.menuId, e.name, e.price, e.count)).toList()));
                        Navigator.pushNamed(
                          context,
                          "/iaportTest",
                          arguments: PaymentData(
                            pg: Pg.pg, // 뭘로 결제?
                            payMethod: 'card', // 카드
                            cardQuota: 0,
                            name: widget.orderMenu.length == 1 ? "${widget.orderMenu[0].name}" : "${widget.orderMenu[0].name} 외 ${widget.orderMenu.length - 1}", // 상품이름
                            amount: 100, // 가격 totalPrice
                            merchantUid: "mid_${DateTime.now().millisecondsSinceEpoch}", // 거래 고유번호
                            buyerName: UserSession.user.nickname, // 결제자 이름
                            buyerTel: "${widget.myOrderInfo[0].phone}", // 결제자 번호
                            appScheme: 'flutterexample', // 모바일 웹뷰에서 외부앱 ( 결제창 ) 을 띄우기 위한 코드
                            niceMobileV2: true,
                          ),
                        );
                        setState(() {
                          widget.orderMenu.clear();
                        });
                      },
                      child: Text(
                        '주문 하기',
                        style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrder(orderMenu) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_s),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${orderMenu.name}", style: textTheme().bodyText2),
              Text(numberPriceFormat("${orderMenu.price}"), style: textTheme().bodyText2),
            ],
          ),
          SizedBox(height: gap_s),
        ],
      ),
    );
  }

  Widget _bulidPaymentButton(int id, String paymentWay) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: id == selectedId ? kMainColor : null,
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedId = id;
          });
        },
        child: Text(
          paymentWay,
          style: TextStyle(color: id == selectedId ? Colors.white : Colors.grey, fontSize: 14, height: 1.0),
        ),
      ),
    );
  }

  Widget _bulidOrderType(Comment CT, String? msg) {
    return Row(
      // 가로로 진행 (버튼 + 이름)
      children: <Widget>[
        SizedBox(
          height: 20,
          width: 40,
          child: Radio<Comment>(
            value: CT,
            groupValue: _comment,
            onChanged: (value) {
              setState(() {
                _comment = value;
                print('라디오 테스트 : $value');
              });
            },
          ),
        ),
        Text("${msg}", style: textTheme().bodyText2),
      ],
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    title: Text(
      "주문 하기",
      style: textTheme().headline1,
    ),
    centerTitle: true,
    elevation: 1.0,
  );
}

Widget _buildTextFormField(String? hintMsg, double setWidth, controller) {
  return Container(
    height: 30,
    width: setWidth,
    child: TextFormField(
      scrollPadding: EdgeInsets.zero,
      textAlign: TextAlign.center,
      controller: controller,
      textAlignVertical: TextAlignVertical.bottom,
      validator: (value) => value!.isEmpty ? "값을 넣어 주세요" : null,
      obscureText: hintMsg == "비밀번호" ? true : false,
      decoration: InputDecoration(
        hintText: "${hintMsg}를(을) 입력하세요",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
