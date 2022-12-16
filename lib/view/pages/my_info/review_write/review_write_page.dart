import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:final_project_beamin_app/constants.dart';
import 'package:final_project_beamin_app/controller/review_controller.dart';
import 'package:final_project_beamin_app/dto/user_review_req_dto.dart';
import 'package:final_project_beamin_app/size.dart';
import 'package:final_project_beamin_app/theme.dart';
import 'package:final_project_beamin_app/view/pages/util/validator_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:final_project_beamin_app/view/pages/components/my_star_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class ReviewWritePage extends ConsumerStatefulWidget {
  const ReviewWritePage({required this.orderId, required this.storeId, Key? key}) : super(key: key);
  final int storeId;
  final int orderId;

  @override
  ConsumerState<ReviewWritePage> createState() => _ReviewWriteState();
}

class _ReviewWriteState extends ConsumerState<ReviewWritePage> {
  double count = 1;
  double selectNum = 1;
  XFile? _pickedFile;
  String base64Image = "";

  changeCount(int selectNum) {
    setState(() {
      count = selectNum + 1;
    });
  }

  _getPhotoLibraryImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
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

  // 카메라로 사진 업로드
  _getCameraImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _review = TextEditingController();
    ReviewController reviewCT = ref.read(reviewController);
    // 갤러리에 있는 사진 업로드

    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(gap_s),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "이 가게를 추천 하시겠어요?",
                    style: textTheme().headline1,
                  ),
                  SizedBox(height: gap_m),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: gap_xxs),
                      if (count <= 5)
                        for (int i = 0; i < count; i++)
                          IconButton(
                              padding: EdgeInsets.zero, // 패딩 설정
                              onPressed: () {
                                changeCount(i);
                              },
                              icon: MyStarIcon(
                                CupertinoIcons.star_fill,
                                40,
                              )),
                      for (int i = 1; i < 6 - count; i++)
                        IconButton(
                            padding: EdgeInsets.zero, // 패딩 설정
                            onPressed: () {
                              changeCount(i);
                            },
                            icon: MyStarIcon(
                              CupertinoIcons.star,
                              40,
                            )),
                    ],
                  ),
                  SizedBox(height: gap_m),
                  Text("사진을 첨부해 주세요!", style: textTheme().headline1),
                  SizedBox(height: gap_m),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kMenuIconColor),
                      image: DecorationImage(
                        image: MemoryImage(userImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _showBottomSheet();
                      },
                      icon: Icon(
                        CupertinoIcons.camera,
                        color: kMenuIconColor,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(height: gap_m),
                  Text("리뷰를 작성 해주세요!", style: textTheme().headline1),
                  SizedBox(height: gap_m),
                  _buildTextFormField(validateReview(), _review),
                  SizedBox(height: gap_m),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            reviewCT.write(
                                content: _review.text, starPoint: count, photo: base64Image, storeId: widget.storeId, orderId: widget.orderId);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kMainColor,
                          minimumSize: Size(150, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text("리뷰쓰기"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
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

  TextFormField _buildTextFormField(funValidator, controller) {
    return TextFormField(
      cursorColor: kMainColor,
      controller: controller,
      maxLines: 10,
      style: TextStyle(fontSize: 16),
      validator: funValidator,
      decoration: InputDecoration(
        hintText: "리뷰를 작성 해주세요! ( 최소 10 글자 )",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMainColor),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMenuIconColor),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    title: Text("리뷰 쓰기", style: textTheme().headline1),
    centerTitle: true,
    elevation: 1.0,
  );
}
