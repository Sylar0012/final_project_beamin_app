import 'package:final_project_beamin_app/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreInfo extends StatelessWidget {
  const StoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: gap_m),
        _buildStoreNotice(CupertinoIcons.doc_text, "공지 사항",
            "이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 혹 미신이라 하실지 모르지만 사실입니다. 영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤에 복권이 당첨되어 20억을 받았습니다. 어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다. 미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다. 결국 9일 후 그는 암살당했습니다. 기억해 주세요. 이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다. 그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들것입니다. 힘들겠지만 좋은게 좋다고 생각하세요. 7년의 행운을 빌면서..."),
        SizedBox(height: gap_s),
        Divider(
          height: 1,
          thickness: 1,
          color: Color.fromRGBO(221, 221, 221, 1),
        ),
        SizedBox(height: gap_m),
        _buildStoreInfo(Icons.store, "가게 정보"),
        _buildStioreInfoText("최소 주문 금액 : 17,000원"),
        _buildStioreInfoText("결제방법 : 바로결제, 카드결제"),
        _buildStioreInfoText("배달 예상 시간 : 25 ~ 30 분"),
        _buildStioreInfoText("배달 팁 : 3,000원"),
        SizedBox(height: gap_s),
        Divider(
          height: 1,
          thickness: 1,
          color: Color.fromRGBO(221, 221, 221, 1),
        ),
        SizedBox(height: gap_m),
        _buildStoreInfo(CupertinoIcons.doc_text_search, "사업자 정보"),
        _buildStioreInfoText("상호명 : 네네치킨 내외점"),
        _buildStioreInfoText("결제방법 : EOM BOK-DONG"),
        _buildStioreInfoText("사업자 번호 : 123-45-67890"),
        SizedBox(height: gap_s),
      ],
    );
  }
}

Widget _buildStoreNotice(CupertinoIcons, String notice, String noticeContent) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_s),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Icon(
                  CupertinoIcons,
                  size: 28,
                ),
                SizedBox(width: gap_xs),
                Text(
                  notice,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                        offset: const Offset(0.5, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  noticeContent,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildStoreInfo(CupertinoIcons, String notice) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_s),
      child: Column(
        children: [
          Container(
            height: 30,
            child: Row(
              children: [
                Icon(
                  CupertinoIcons,
                  size: 28,
                ),
                SizedBox(width: gap_xs),
                Text(
                  notice,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                        offset: const Offset(0.5, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildStioreInfoText(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: gap_s, left: gap_s),
    child: Text(
      "${text}",
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    ),
  );
}
