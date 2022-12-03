import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/components/costom_form_login.dart';
import 'package:final_project_beamin_app/view/pages/user/join/join_Page.dart';
import 'package:final_project_beamin_app/view/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(gap_s),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: gap_xl),
                Text("로그인", style: textTheme().headline1),
                SizedBox(height: gap_xl),
                CustomFormLogin(),
                SizedBox(height: gap_xl),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => JoinPage()));
                  },
                  child: Text("아직 회원이 아니신가요?"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
