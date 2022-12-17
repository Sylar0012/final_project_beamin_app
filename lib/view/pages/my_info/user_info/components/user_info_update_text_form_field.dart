import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:flutter/material.dart';

class UserInfoUpdateTextFormField extends StatelessWidget {
  const UserInfoUpdateTextFormField({required this.hintMsg, required this.controller, required this.funValidator, required this.value, Key? key})
      : super(key: key);
  final String hintMsg;
  final TextEditingController controller;
  final funValidator;
  final value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      textAlignVertical: TextAlignVertical.bottom,
      validator: funValidator,
      obscureText: hintMsg == "비밀번호" ? true : false,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: gap_xs),
        hintText: "${value}",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
