import 'package:final_project_beamin_app/size.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: gap_m),
        _bulidStoreMenu(context, "치킨", "후라이드 치킨", "후라이드 치킨 ", "17,000원"),
        _bulidStoreMenu(context, "양념치킨", "양념 치킨", "착한 사람 눈엔 양념치킨 사진으로 보입니다. 당신은 착한 사람입니다", "19,000원"),
        _bulidStoreMenu(context, "간장치킨", "간장 치킨", "간장치킨", "18,000원"),
        _bulidStoreMenu(context, "치킨", "후라이드 치킨", "후라이드 치킨 ", "17,000원"),
        _bulidStoreMenu(context, "양념치킨", "양념 치킨", "착한 사람 눈엔 양념치킨 사진으로 보입니다. 당신은 착한 사람입니다", "19,000원"),
        _bulidStoreMenu(context, "간장치킨", "간장 치킨", "간장치킨", "18,000원"),
        _bulidStoreMenu(context, "치킨", "후라이드 치킨", "후라이드 치킨 ", "17,000원"),
        _bulidStoreMenu(context, "양념치킨", "양념 치킨", "착한 사람 눈엔 양념치킨 사진으로 보입니다. 당신은 착한 사람입니다", "19,000원"),
        _bulidStoreMenu(context, "간장치킨", "간장 치킨", "간장치킨", "18,000원"),
      ],
    );
  }
}

Widget _bulidStoreMenu(BuildContext context, String img, String menuName, String menuInfo, String menuPrice) {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/category/${img}.jpg",
                width: 115,
                height: 115,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: gap_m),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${menuName}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 200,
                child: Text(
                  "${menuInfo}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "${menuPrice}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
