import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/components/costom_text_form_field.dart';
import 'package:final_project_beamin_app/view/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFormLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  CustomFormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(text: "아이디"),
          SizedBox(height: gap_s),
          CustomTextFormField(text: "비밀번호"),
          SizedBox(height: gap_l),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  Padding _buildLoginButton(BuildContext context) {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
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
