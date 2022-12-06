import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/components/costom_text_form_field.dart';
import 'package:final_project_beamin_app/view/pages/user/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFormJoin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  CustomFormJoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var username;
    var password;
    var nickname;
    var phone;
    var address;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(text: "아이디", controller: username),
          SizedBox(height: gap_s),
          CustomTextFormField(text: "비밀번호", controller: password),
          SizedBox(height: gap_s),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          SizedBox(height: gap_s),
          CustomTextFormField(text: "닉네임", controller: nickname),
          SizedBox(height: gap_s),
          CustomTextFormField(text: "휴대폰 번호", controller: phone),
          SizedBox(height: gap_s),
          CustomTextFormField(text: "주소", controller: address),
          SizedBox(height: gap_s),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          SizedBox(height: gap_s),
          _buildJoinButton(context),
        ],
      ),
    );
  }

  Padding _buildJoinButton(BuildContext context) {
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
            if (_formKey.currentState!.validate()) {
              Navigator.pushNamed(context, "/login");
            }
          },
          child: Text(
            '회원 가입',
            style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
          ),
        ),
      ),
    );
  }
}
