import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/controller/user_controller.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInactivePage extends ConsumerStatefulWidget {
  const UserInactivePage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInactivePage> createState() => _UserInactiveState();
}

class _UserInactiveState extends ConsumerState<UserInactivePage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    UserController userCT = ref.read(userController);
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(gap_s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("회원 비활성화시 주의사항", style: textTheme().headline1),
                SizedBox(height: gap_xxs),
                Text("회원 비활성화 전에 꼭 확인하세요", style: textTheme().subtitle1),
                SizedBox(height: gap_xs),
                Text("회원 비활성화시 개인정보는 3년간 보관됩니다."),
                SizedBox(height: gap_xs),
                Text("5년이 지난 개인정보는 가게 매출에 관련한 데이터를 제외한   모든 데이터를 파기합니다."),
                SizedBox(height: gap_xs),
                Text("주문내역과 리뷰는 단순 데이터 수집용도로 사용되며 해당 내용은 외부에 공개되지 않습니다."),
                SizedBox(height: gap_xs),
                Text("회원 비활성화시 한달의 유예기간이 주어지게 됩니다. "),
                SizedBox(height: gap_xs),
                Text("유예기간은 비활성화를 신청한 시점을 기준으로 합니다."),
                SizedBox(height: gap_xs),
                Text("유예기간이 만료되기전 로그인시, 회원 비활성화를 거부하는 것으로 판단하여 회원 비활성화 신청을 취소 합니다."),
                SizedBox(height: gap_xs),
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 10,
            color: Colors.grey[200],
          ),
          SizedBox(height: gap_xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _bulidInactiveCheckBox(),
              Text("상기 내용에 동의하였습니다."),
            ],
          ),
          SizedBox(height: gap_xs),
          _buildUpdateButton(context, userCT),
        ],
      ),
    );
  }

  Padding _buildUpdateButton(BuildContext context, UserController userCT) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_m),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kMainColor),
          color: kMainColor,
        ),
        child: TextButton(
          onPressed: () {
            if (isChecked == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(backgroundColor: Color.fromRGBO(251, 82, 28, 0.8), content: Text("아이디가 비활성화 되었습니다.")),
              );
              userCT.inactive(isActive: true);
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(backgroundColor: Color.fromRGBO(251, 82, 28, 0.8), content: Text("상기 내용에 동의 해주세요.")));
            }
          },
          child: Text(
            '회원 비활성화 하기',
            style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
          ),
        ),
      ),
    );
  }

  Widget _bulidInactiveCheckBox() {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          print("체크박스 현재 상태 : $isChecked");
        });
      },
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    title: Text("회원 비활성화", style: textTheme().headline1),
    centerTitle: true,
    elevation: 1.0,
  );
}
