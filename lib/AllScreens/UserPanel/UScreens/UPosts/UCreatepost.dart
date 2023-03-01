import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/add_post_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UCreatePost extends StatefulWidget {
  const UCreatePost({
    Key? key,
  }) : super(key: key);

  @override
  State<UCreatePost> createState() => _UCreatePostState();
}

class _UCreatePostState extends State<UCreatePost> {
  File _pickedImage = File("");
  final ImagePicker _imgPicker = ImagePicker();
  List<File> _pickedImages = [];
  final TextEditingController controller = TextEditingController();

  String userName = '';
  _setPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    String a = prefs.getString(Keys().userName)!;
    setState(() {
      userName = a;
    });
  }

  @override
  void initState() {
    _setPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Create post',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset('assets/images/userP.png'),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          userName,
                          style: kManRope_500_16_001314,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            XFile? v = await _imgPicker.pickImage(
                                source: ImageSource.camera);
                            if (v != null) {
                              setState(() {
                                _pickedImage = File(v.path);
                                _pickedImages.add(_pickedImage);
                              });
                            }
                          },
                          child: SizedBox(
                            height: 18,
                            width: 20,
                            // color: Colors.red,
                            child: Image.asset(
                              'assets/images/iconcamera.png',
                              height: 18,
                              width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        InkWell(
                          onTap: () async {
                            List<XFile> images =
                                await _imgPicker.pickMultiImage();
                            setState(() {
                              for (var v in images) {
                                _pickedImages.add(File(v.path));
                              }
                            });
                            if (_pickedImages.isNotEmpty) {
                              log(_pickedImages.toString());
                            }
                          },
                          child: SizedBox(
                            height: 18,
                            width: 20,
                            // color: Colors.red,
                            child: Image.asset(
                              'assets/images/iconpost.png',
                              height: 24.h,
                              width: 24.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                controller: controller,
                maxLines: 10,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'What do you want to share?...',
                  hintStyle: kManRope_400_14_626A6A,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                height: 150,
                //padding: EdgeInsets.only(left: 16),
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _pickedImages[index],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, ind) => SizedBox(
                          width: 10,
                        ),
                    itemCount: _pickedImages.length),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 96.h),
          child: Center(
            child: SizedBox(
              height: 56.h,
              child: MainButton(
                  onPressed: () {
                    final resp = AddPost().get(
                        captions: controller.text, pickedImg: _pickedImages);
                    resp.then((value) {
                      if (value['status'] == true) {
                        setState(() {
                          Fluttertoast.showToast(msg: "Posted successfully.");
                          Navigator.of(context).pop();
                        });
                      } else {
                        Fluttertoast.showToast(msg: "Something went wrong");
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 74.w, right: 74.w),
                    child: Text(
                      "Post",
                      style: kManRope_400_16_white,
                    ),
                  ),
                  color: k006D77,
                  shape: CustomDecoration().smallButton10Decoration()),
            ),
          ),
        ),
      ),
    );
  }
}
