import 'package:final_project_beamin_app/theme.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                height: 400,
                width: 100,
                color: Colors.green[400],
              )
            ],
          )
        ],
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
