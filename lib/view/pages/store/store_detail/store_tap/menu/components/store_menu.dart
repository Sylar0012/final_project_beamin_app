import 'package:final_project_beamin_app/model/menu_list.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/util/my_number_formet.dart';
import 'package:flutter/material.dart';

class StoreMenu extends StatelessWidget {
  const StoreMenu({required this.menuFindByStoreIdRespDto, Key? key}) : super(key: key);
  final Menus menuFindByStoreIdRespDto;
  @override
  Widget build(BuildContext context) {
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
                  menuFindByStoreIdRespDto.thumbnail == "" ? "assets/images/category/간장치킨.jpg" : menuFindByStoreIdRespDto.thumbnail,
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
                  menuFindByStoreIdRespDto.name,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: gap_s),
                Container(
                  width: 200,
                  child: Text(
                    menuFindByStoreIdRespDto.intro,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: gap_m),
                Text(
                  numberPriceFormat("${menuFindByStoreIdRespDto.price}"),
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
}
