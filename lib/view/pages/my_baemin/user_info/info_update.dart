import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/user_inactive/user_inactive.dart';
import 'package:flutter/material.dart';

class InfoUpdate extends StatefulWidget {
  const InfoUpdate({Key? key}) : super(key: key);

  @override
  State<InfoUpdate> createState() => _InfoUpdateState();
}

class _InfoUpdateState extends State<InfoUpdate> {
  final _formKeyUserName = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final _formKeyPhonen = GlobalKey<FormState>();
  final _formKeyAddress = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: gap_s),
              Stack(
                children: [
                  SizedBox(
                    width: 85,
                    height: 85,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/category/피자.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    right: 17.5,
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color.fromRGBO(221, 221, 221, 0.7)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "편집",
                          style: textTheme().bodyText1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: gap_s),
              Form(
                key: _formKeyUserName,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 170,
                      height: 30,
                      child: Container(child: _buildTextFormField("이름")),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        if (_formKeyUserName.currentState!.validate()) {}
                      },
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: kMainColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          '변경 하기',
                          style: TextStyle(color: kMainColor, fontSize: 14, height: 1.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: gap_m),
              Divider(
                height: 10,
                thickness: 10,
                color: Colors.grey[200],
              ),
              SizedBox(height: gap_m),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s),
            child: Form(
              key: _formKeyPassword,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("아이디", style: textTheme().bodyText1),
                            SizedBox(height: gap_l),
                            Text("현재 비밀번호", style: textTheme().bodyText1),
                            SizedBox(height: gap_l),
                            Text("변경 비밀번호", style: textTheme().bodyText1),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ssar", style: textTheme().bodyText1),
                            SizedBox(height: gap_m),
                            Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: _buildTextFormField("비밀번호"),
                            ),
                            SizedBox(height: gap_s),
                            Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: _buildTextFormField("비밀번호"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: gap_xs, vertical: gap_xs),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        style: ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          if (_formKeyPassword.currentState!.validate()) {}
                        },
                        child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: kMainColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            '변경 하기',
                            style: TextStyle(color: kMainColor, fontSize: 14, height: 1.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 10,
            thickness: 10,
            color: Colors.grey[200],
          ),
          SizedBox(height: gap_m),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gap_s),
            child: Row(
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: "전화번호 인증 ", style: textTheme().headline2),
                    TextSpan(text: "주문정보의 연락처로 사용됩니다.", style: textTheme().bodyText2),
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(height: gap_xs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s),
            child: Form(
              key: _formKeyPhonen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _buildTextFormPhone()),
                  Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _buildTextFormPhone()),
                  Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _buildTextFormPhone()),
                  TextButton(
                    onPressed: () {
                      if (_formKeyPhonen.currentState!.validate()) {}
                    },
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: kMainColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        '재인증',
                        style: TextStyle(color: kMainColor, fontSize: 14, height: 1.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: gap_s),
          Divider(
            height: 10,
            thickness: 10,
            color: Colors.grey[200],
          ),
          SizedBox(height: gap_m),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gap_s),
            child: Row(
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: "주소 변경 ", style: textTheme().headline2),
                    TextSpan(text: "배달 받으실 주소로 사용됩니다.", style: textTheme().bodyText2),
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(height: gap_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s),
            child: Form(
              key: _formKeyAddress,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _buildTextFormField("주소"),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKeyAddress.currentState!.validate()) {}
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: kMainColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        '변경 하기',
                        style: TextStyle(color: kMainColor, fontSize: 14, height: 1.7),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 10,
            thickness: 10,
            color: Colors.grey[200],
          ),
          SizedBox(height: gap_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_s),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: Text("로그아웃", style: textTheme().bodyText2)),
                SizedBox(width: gap_s),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserInactive()));
                    },
                    child: Text("비활성화", style: TextStyle(color: Colors.red[600], fontSize: 14, height: 1.0))),
              ],
            ),
          ),
          SizedBox(height: gap_s),
        ],
      ),
    );
  }

  Widget _buildTextFormPhone() {
    return TextFormField(
      scrollPadding: EdgeInsets.zero,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
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

  Widget _buildTextFormField(String? hintMsg) {
    return TextFormField(
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.bottom,
      obscureText: hintMsg == "비밀번호" ? true : false,
      decoration: InputDecoration(
        hintText: "${hintMsg}를(을) 입력하세요",
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

AppBar _buildAppBar() {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    title: Text("내 정보", style: textTheme().headline1),
    centerTitle: true,
    elevation: 1.0,
  );
}
