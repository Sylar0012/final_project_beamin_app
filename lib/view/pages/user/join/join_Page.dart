import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/user/components/costom_form_join.dart';
import 'package:final_project_beamin_app/view/pages/user/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(gap_s),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: gap_xl),
                Text("회원가입", style: textTheme().headline1),
                SizedBox(height: gap_xl),
                CustomFormJoin(),
                SizedBox(height: gap_xl),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
