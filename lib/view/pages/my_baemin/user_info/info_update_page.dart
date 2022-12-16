import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/model/user_info_update.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/user_inactive/user_inactive.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/user_info/components/user_info_update_text_form_field.dart';
import 'package:final_project_beamin_app/view/pages/util/validator_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoUpdatePage extends StatefulWidget {
  const InfoUpdatePage({required this.userInfoUpdate, Key? key}) : super(key: key);
  final UserInfoUpdate userInfoUpdate;
  @override
  State<InfoUpdatePage> createState() => _InfoUpdatePageState();
}

class _InfoUpdatePageState extends State<InfoUpdatePage> {
  final _username = TextEditingController();
  final _oldPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            _buildPhotoUpdate(),
            _buildPasswordUpdate(),
            _buildDivider(),
            SizedBox(height: gap_m),
            _buildPhoneUpdate(),
            SizedBox(height: gap_s),
            _buildDivider(),
            SizedBox(height: gap_m),
            _buildAddressUpdate(),
            _buildDivider(),
            SizedBox(height: gap_s),
            _buildUpdateButton(context),
            SizedBox(height: gap_s),
            _buildDivider(),
            _bulidLogOutAndDisableUser(context),
            SizedBox(height: gap_s),
          ],
        ),
      ),
    );
  }

  Padding _buildUpdateButton(BuildContext context) {
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
            if (_formKey.currentState!.validate()) {}
          },
          child: Text(
            '회원 정보 수정',
            style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
          ),
        ),
      ),
    );
  }

  Padding _bulidLogOutAndDisableUser(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_s),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(onPressed: () {}, child: Text("로그아웃", style: textTheme().bodyText2)),
          SizedBox(width: gap_s),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserInactive()));
              },
              child: Text("비활성화", style: TextStyle(color: Colors.red[600], fontSize: 14, height: 1.0))),
        ],
      ),
    );
  }

  Column _buildAddressUpdate() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: gap_s),
          child: Row(
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: "주소 변경 ", style: textTheme().headline2),
                  TextSpan(text: "배달 받으실 주소로 사용됩니다.", style: textTheme().bodyText2),
                ]),
              ),
            ],
          ),
        ),
        SizedBox(height: gap_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: UserInfoUpdateTextFormField(
                    hintMsg: "주소",
                    controller: _address,
                    funValidator: validateAddress(),
                    value: widget.userInfoUpdate.address,
                  )),
              SizedBox(height: gap_s),
            ],
          ),
        ),
      ],
    );
  }

  Column _buildPhoneUpdate() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: gap_s),
          child: Row(
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: "전화번호 인증 ", style: textTheme().headline2),
                  TextSpan(text: "주문정보의 연락처로 사용됩니다.", style: textTheme().bodyText2),
                ]),
              ),
            ],
          ),
        ),
        SizedBox(height: gap_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_s),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: UserInfoUpdateTextFormField(
                hintMsg: "휴대폰 번호",
                controller: _phone,
                funValidator: validatePhoneNumber(),
                value: widget.userInfoUpdate.phone,
              )),
        ),
      ],
    );
  }

  Divider _buildDivider() {
    return Divider(
      height: 10,
      thickness: 10,
      color: Colors.grey[200],
    );
  }

  Padding _buildPasswordUpdate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_s),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("현재 아이디", style: textTheme().bodyText1),
              SizedBox(width: gap_xl),
              Text("ssar", style: textTheme().bodyText1),
            ],
          ),
          SizedBox(height: gap_l),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("현재 비밀번호", style: textTheme().bodyText1),
              SizedBox(width: gap_m),
              Expanded(
                  child: UserInfoUpdateTextFormField(
                hintMsg: "비밀번호",
                controller: _oldPassword,
                funValidator: validatePassword(),
                value: "",
              )),
            ],
          ),
          SizedBox(height: gap_l),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("변경 비밀번호", style: textTheme().bodyText1),
              SizedBox(width: gap_m),
              Expanded(
                  child: UserInfoUpdateTextFormField(
                hintMsg: "비밀번호",
                controller: _newPassword,
                funValidator: validatePassword(),
                value: "",
              )),
            ],
          ),
          SizedBox(height: gap_s),
        ],
      ),
    );
  }

  Column _buildPhotoUpdate() {
    return Column(
      children: [
        SizedBox(height: gap_s),
        Stack(
          children: [
            SizedBox(
              width: 85,
              height: 85,
              child: widget.userInfoUpdate.photo == ""
                  ? Icon(CupertinoIcons.person_alt_circle_fill, size: 85, color: Colors.grey[400])
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        widget.userInfoUpdate.photo,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            Positioned(
              bottom: 3,
              right: 17.5,
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color.fromRGBO(221, 221, 221, 0.7)),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "편집",
                    style: textTheme().bodyText1,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: gap_s),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 170,
              child: Container(
                  child: UserInfoUpdateTextFormField(
                hintMsg: "이름",
                controller: _username,
                funValidator: validateUsername(),
                value: widget.userInfoUpdate.nickname,
              )),
            ),
          ],
        ),
        SizedBox(height: gap_m),
        _buildDivider(),
        SizedBox(height: gap_m),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text("내 정보", style: textTheme().headline1),
      centerTitle: true,
      elevation: 1.0,
    );
  }
}
