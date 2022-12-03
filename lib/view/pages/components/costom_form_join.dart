import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/view/pages/components/costom_text_form_field.dart';
import 'package:flutter/widgets.dart';

class CustomFormJoin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  CustomFormJoin({Key? key}) : super(key: key);

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
          CustomTextFormField(text: "닉네임"),
          SizedBox(height: gap_s),
          CustomTextFormField(text: "휴대폰 번호"),
          SizedBox(height: gap_s),
          CustomTextFormField(text: "주소"),
          SizedBox(height: gap_l),
        ],
      ),
    );
  }
}
