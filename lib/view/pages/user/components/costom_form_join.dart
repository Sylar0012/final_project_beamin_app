import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/controller/user_controller.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/components/costom_text_form_field.dart';
import 'package:final_project_beamin_app/view/pages/user/login/login_page.dart';
import 'package:final_project_beamin_app/view/pages/util/validator_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomFormJoin extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _nickname = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  CustomFormJoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserController userCT = ref.read(userController);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            text: "아이디",
            controller: _username,
            funValidator: validateUsername(),
          ),
          SizedBox(height: gap_s),
          CustomTextFormField(
            text: "비밀번호",
            controller: _password,
            funValidator: validatePassword(),
          ),
          SizedBox(height: gap_s),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          SizedBox(height: gap_s),
          CustomTextFormField(
            text: "닉네임",
            controller: _nickname,
            funValidator: validateNickName(),
          ),
          SizedBox(height: gap_s),
          CustomTextFormField(
            text: "휴대폰 번호",
            controller: _phone,
            funValidator: validatePhoneNumber(),
          ),
          SizedBox(height: gap_s),
          CustomTextFormField(
            text: "주소",
            controller: _address,
            funValidator: validateAddress(),
          ),
          SizedBox(height: gap_s),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          SizedBox(height: gap_s),
          _buildJoinButton(context, userCT),
        ],
      ),
    );
  }

  Padding _buildJoinButton(BuildContext context, UserController userCT) {
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
              userCT.join(
                username: _username.text.trim(),
                password: _password.text.trim(),
                nickname: _nickname.text.trim(),
                phone: _phone.text.trim(),
                address: _address.text.trim(),
              );
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
