import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/controller/user_controller.dart';
import 'package:final_project_beamin_app/model/user_info_update.dart';
import 'package:final_project_beamin_app/model/user_session.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/user_inactive/user_inactive_page.dart';
import 'package:final_project_beamin_app/view/pages/my_baemin/user_info/components/user_info_update_text_form_field.dart';
import 'package:final_project_beamin_app/view/pages/util/validator_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class InfoUpdatePage extends ConsumerStatefulWidget {
  const InfoUpdatePage({required this.userInfoUpdate, Key? key}) : super(key: key);
  final UserInfoUpdate userInfoUpdate;
  @override
  ConsumerState<InfoUpdatePage> createState() => _InfoUpdatePageState();
}

class _InfoUpdatePageState extends ConsumerState<InfoUpdatePage> {
  final _username = TextEditingController();
  final _oldPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  XFile? _pickedFile;
  String base64Image = "";
  // 갤러리에 있는 사진 업로드
  _getPhotoLibraryImage() async {
    Logger().d("이거 실행됨?");

    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    Logger().d("이거 실행됨??");

    if (pickedFile != null) {
      setState(() {
        Logger().d("이거 실행됨? setstate");

        _pickedFile = pickedFile;
        postRequest(_pickedFile);
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }

  // 카메라로 사진 업로드
  _getCameraImage() async {
    Logger().d("이거 실행됨?");
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    Logger().d("이거 실행됨???");

    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
        postRequest(_pickedFile);
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }

  Uint8List userImage = new Uint8List(0);

  // 이미지 base64로 전환
  postRequest(_pickedFile) {
    File imageFile = File(_pickedFile.path);
    List<int> imageBytes = imageFile.readAsBytesSync();
    base64Image = base64Encode(imageBytes);
    decodeImage(base64Image);
  }

  decodeImage(base64Image) {
    setState(() {
      userImage = base64Decode(base64Image);
      widget.userInfoUpdate.photo = base64Image;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserController userCT = ref.read(userController);
    base64Image = widget.userInfoUpdate.photo;
    return Scaffold(
      appBar: _buildAppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            _buildPhotoUpdate(),
            _buildPasswordUpdate(),
            _buildDivider(),
            SizedBox(height: gap_m),
            _buildPhoneUpdate(),
            SizedBox(height: gap_s),
            _buildDivider(),
            SizedBox(height: gap_m),
            _buildAddressUpdate(),
            _buildDivider(),
            SizedBox(height: gap_s),
            _buildUpdateButton(context, userCT),
            SizedBox(height: gap_s),
            _buildDivider(),
            _bulidLogOutAndDisableUser(context, userCT),
            SizedBox(height: gap_s),
          ],
        ),
      ),
    );
  }

  _showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                _getCameraImage();
              },
              child: const Text('사진찍기'),
            ),
            TextButton(
              onPressed: () {
                _getPhotoLibraryImage();
              },
              child: const Text('라이브러리에서 불러오기'),
            ),
          ],
        );
      },
    );
  }

  Padding _buildUpdateButton(BuildContext context, UserController userCT) {
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
              userCT.updatePost(
                  id: UserSession.user.id,
                  oldPassword: _oldPassword.text.trim(),
                  newPassword: _newPassword.text.trim(),
                  address: _address.text,
                  nickname: _username.text.trim(),
                  phone: _phone.text.trim(),
                  photo: base64Image);
            }
          },
          child: Text(
            '회원 정보 수정',
            style: TextStyle(color: Colors.white, fontSize: 14, height: 1.0),
          ),
        ),
      ),
    );
  }

  Padding _bulidLogOutAndDisableUser(BuildContext context, UserController userCT) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_s),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                userCT.logout();
              },
              child: Text("로그아웃", style: textTheme().bodyText2)),
          SizedBox(width: gap_s),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserInactivePage()));
            },
            child: Text(
              "비활성화",
              style: TextStyle(color: Colors.red[600], fontSize: 14, height: 1.0),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildAddressUpdate() {
    return Column(
      children: [
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: UserInfoUpdateTextFormField(
                    hintMsg: "주소",
                    controller: _address,
                    funValidator: validateAddress(),
                    value: widget.userInfoUpdate.address,
                  )),
              SizedBox(height: gap_s),
            ],
          ),
        ),
      ],
    );
  }

  Column _buildPhoneUpdate() {
    return Column(
      children: [
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
        SizedBox(height: gap_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_s),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: UserInfoUpdateTextFormField(
                hintMsg: "휴대폰 번호",
                controller: _phone,
                funValidator: validatePhoneNumber(),
                value: widget.userInfoUpdate.phone,
              )),
        ),
      ],
    );
  }

  Divider _buildDivider() {
    return Divider(
      height: 10,
      thickness: 10,
      color: Colors.grey[200],
    );
  }

  Padding _buildPasswordUpdate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_s),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("현재 아이디", style: textTheme().bodyText1),
              SizedBox(width: gap_xl),
              Text(widget.userInfoUpdate.username, style: textTheme().bodyText1),
            ],
          ),
          SizedBox(height: gap_l),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("현재 비밀번호", style: textTheme().bodyText1),
              SizedBox(width: gap_m),
              Expanded(
                  child: UserInfoUpdateTextFormField(
                hintMsg: "비밀번호",
                controller: _oldPassword,
                funValidator: validatePassword(),
                value: "",
              )),
            ],
          ),
          SizedBox(height: gap_l),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("변경 비밀번호", style: textTheme().bodyText1),
              SizedBox(width: gap_m),
              Expanded(
                  child: UserInfoUpdateTextFormField(
                hintMsg: "비밀번호",
                controller: _newPassword,
                funValidator: validatePassword(),
                value: "",
              )),
            ],
          ),
          SizedBox(height: gap_s),
        ],
      ),
    );
  }

  Column _buildPhotoUpdate() {
    return Column(
      children: [
        SizedBox(height: gap_s),
        Stack(
          children: [
            SizedBox(
              width: 85,
              height: 85,
              child: widget.userInfoUpdate.photo == ""
                  ? Icon(CupertinoIcons.person_alt_circle_fill, size: 85, color: Colors.grey[400])
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.memory(base64Decode(base64Image), fit: BoxFit.cover),
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
                  onPressed: () {
                    _showBottomSheet();
                  },
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 170,
              child: Container(
                  child: UserInfoUpdateTextFormField(
                hintMsg: "이름",
                controller: _username,
                funValidator: validateUsername(),
                value: widget.userInfoUpdate.nickname,
              )),
            ),
          ],
        ),
        SizedBox(height: gap_m),
        _buildDivider(),
        SizedBox(height: gap_m),
      ],
    );
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
}
