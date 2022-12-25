import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/user/components/costom_form_login.dart';
import 'package:final_project_beamin_app/view/pages/user/join/join_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(gap_s),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: gap_xl),
                Text(
                  "땡기는 민족",
                  style: TextStyle(
                    color: kMainColor,
                    fontSize: 50,
                    fontFamily: "Nanum",
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                        offset: const Offset(0.5, 1),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: gap_xl),
                CustomFormLogin(),
                SizedBox(height: gap_xl),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => JoinPage()));
              },
              child: Text("아직 회원이 아니신가요?"),
            ),
          ],
        ),
      ),
    );
  }
}
