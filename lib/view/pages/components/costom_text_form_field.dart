import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({required this.text, required this.controller, Key? key}) : super(key: key);
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: gap_xs),
            Text(text),
          ],
        ),
        SizedBox(height: gap_xxs),
        TextFormField(
          controller: controller,
          validator: (value) => value!.isEmpty ? "${text}를 입력해주세요" : null,
          obscureText: text == "비밀번호" ? true : false,
          decoration: InputDecoration(
            hintText: "${text}를 입력하세요",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kMenuIconColor),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kMenuIconColor),
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kMenuIconColor),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
