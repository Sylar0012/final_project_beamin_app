import 'package:final_project_beamin_app/model/menu_find_by_id_resp_dto.dart';
import 'package:final_project_beamin_app/model/menu_find_by_store_id_resp_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/util/number_formet/my_number_formet.dart';
import 'package:flutter/material.dart';

class StoreMenu extends StatelessWidget {
  const StoreMenu({required this.menuFindByStoreIdRespDto, Key? key}) : super(key: key);
  final MenuFindByStoreIdRespDto menuFindByStoreIdRespDto;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/menuDetail",
          arguments: MenuFindByStoreIdRespDto(
            id: menuFindByStoreIdRespDto.id,
            name: menuFindByStoreIdRespDto.name,
            thumbnail: menuFindByStoreIdRespDto.thumbnail,
            intro: menuFindByStoreIdRespDto.intro,
            price: menuFindByStoreIdRespDto.price,
            store: menuFindByStoreIdRespDto.store,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  menuFindByStoreIdRespDto.thumbnail,
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
