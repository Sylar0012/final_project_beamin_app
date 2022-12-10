import 'package:final_project_beamin_app/model/store_info_find_by_store_id_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/util/my_number_formet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreInfoBody extends StatelessWidget {
  const StoreInfoBody({required this.storeInfoFindByStoreIdRespDto, Key? key}) : super(key: key);
  final StoreInfoFindByStoreIdRespDto storeInfoFindByStoreIdRespDto;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: gap_m),
        _buildStoreNotice(CupertinoIcons.doc_text, "공지 사항", "${storeInfoFindByStoreIdRespDto.notice}"),
        SizedBox(height: gap_s),
        Divider(
          height: 1,
          thickness: 1,
          color: Color.fromRGBO(221, 221, 221, 1),
        ),
        SizedBox(height: gap_m),
        _buildStoreInfo(Icons.store, "가게 정보"),
        _buildStioreInfoText("최소 주문 금액 : " + numberPriceFormat("${storeInfoFindByStoreIdRespDto.minAmount}")),
        _buildStioreInfoText("배달 예상 시간 : ${storeInfoFindByStoreIdRespDto.deliveryHour}"),
        _buildStioreInfoText("배달 팁 : " + numberPriceFormat("${storeInfoFindByStoreIdRespDto.deliveryCost}")),
        SizedBox(height: gap_s),
        Divider(
          height: 1,
          thickness: 1,
          color: Color.fromRGBO(221, 221, 221, 1),
        ),
        SizedBox(height: gap_m),
        _buildStoreInfo(CupertinoIcons.doc_text_search, "사업자 정보"),
        _buildStioreInfoText("상호명 : ${storeInfoFindByStoreIdRespDto.name}"),
        _buildStioreInfoText("사업자 명 : ${storeInfoFindByStoreIdRespDto.ceoName}"),
        _buildStioreInfoText("사업자 번호 : ${storeInfoFindByStoreIdRespDto.businessNumber}"),
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
