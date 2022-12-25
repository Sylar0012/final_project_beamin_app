import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/controller/user_controller.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/components/costom_text_form_field.dart';
import 'package:final_project_beamin_app/view/pages/main/main_page.dart';
import 'package:final_project_beamin_app/view/pages/util/validator_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomFormLogin extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  CustomFormLogin({Key? key}) : super(key: key);
  final _username = TextEditingController();
  final _password = TextEditingController();
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
          SizedBox(height: gap_l),
          _buildLoginButton(context, userCT),
        ],
      ),
    );
  }

  Padding _buildLoginButton(BuildContext context, UserController userCT) {
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
              userCT.login(
                username: _username.text.trim(),
                password: _password.text.trim(),
              );
            }
          },
          child: Text(
            '로그인',
            style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
          ),
        ),
      ),
    );
  }
}
