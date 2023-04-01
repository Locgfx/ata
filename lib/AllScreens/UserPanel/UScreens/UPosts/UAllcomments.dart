import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/UPostViewContainer.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/UReplyScreen.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/user_comment_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/model/UModels/user_posts_model/comment_model.dart';
import 'package:greymatter/model/UModels/user_posts_model/user_posts_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/comment_widgets/user_comment_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UCommentPage extends StatefulWidget {
  final UserPostModel model;
  const UCommentPage({Key? key, required this.model}) : super(key: key);

  @override
  State<UCommentPage> createState() => _UCommentPageState();
}

class _UCommentPageState extends State<UCommentPage> {
  final cont = TextEditingController();

  @override
  void initState() {
    log(widget.model.id.toString());
    setPrefs();
    _getData();
    super.initState();
  }

  String userType = '';
  setPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      userType = prefs.getString(Keys().userType) ?? "";
    });
    log(userType);
  }

  int _scroll = 0;
  bool _isLoading = false;
  List<CommentModel> modelList = [];
  _getData() {
    _isLoading = true;
    final resp = UserCommentApi().get(
        postId: widget.model.id.toString(),
        postType: widget.model.postedBy.toString(),
        scroll: '$_scroll');
    resp.then((value) {
      log(value.toString());
      if (value['status'] == true) {
        setState(() {
          for (var v in value['comments']) {
            modelList.add(CommentModel.fromJson(v));
          }
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWhiteAppBar(
        imgPath: 'assets/images/iconbackappbar2.png',
        appBarText: 'All Comments',
        hasThreeDots: false,
      ),
      backgroundColor: kEDF6F9,
      bottomNavigationBar: userType.toLowerCase() == "p"
          ? Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: -10,
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: TextField(
                          controller: cont,
                          style: kManRope_400_14_626A6A,
                          maxLines: 2,
                          minLines: 1,
                          onChanged: (v) {
                            setState(() {});
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 24),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0, color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0, color: Colors.transparent),
                            ),
                            //fillColor: Colors.white,
                            hintText: "Add a comment",
                            // hintStyle: kManRope_400_14_626A6A,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              color: Colors.transparent,
                              child: Image.asset(
                                "assets/images/iconsendlarge (2).png",
                                height: 48,
                                width: 48,
                              ),
                            ),
                            //SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // constraints: BoxConstraints(maxHeight: 1.sh + 310),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UPostViewContainer(
                  isCommentsViewable: false,
                  model: widget.model,
                ),
                SizedBox(height: 24),
                if (modelList.isNotEmpty)
                  Text(
                    "Comments",
                    style: kManRope_400_16_001314,
                    textAlign: TextAlign.start,
                  ),
                SizedBox(height: 24),
                //usercommentWidget1(),
                SizedBox(height: 8),
                /* Expanded(
                  child: Container(
                    color: Colors.transparent,
                    width: 1.sw,
                    constraints: BoxConstraints(maxHeight: 300),
                    child: Row(
                      children: [
                        SizedBox(width: 70),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 327.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    "Loreprinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                    style: kManRope_400_14_626A6A,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UReplyScreen()));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Reply",
                                          style: kManRope_400_12_626A6A,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          "1",
                                          style: kManRope_400_12_626A6A,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 22),
                                  SvgPicture.asset(
                                    'assets/icons/likeIcon.svg',
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                  SizedBox(width: 6),
                                  Text('375', style: kManRope_400_14_Black),
                                ],
                              ),
                              SizedBox(height: 16),
                              usercommentWidget1(),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    width: 250.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      "Loreprinting and typesetting ggyjiure industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                                      style: kManRope_400_14_626A6A,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),*/
                //SizedBox(height: 24),
                _isLoading
                    ? Center(
                        child: SpinKitThreeBounce(
                          color: k006D77,
                          size: 20,
                        ),
                      )
                    : ListView.separated(
                        separatorBuilder: (ctx, ind) => SizedBox(
                          height: 15,
                        ),
                        itemBuilder: (ctx, index) {
                          return usercommentWidget1(
                            modelList: modelList,
                            index: index,
                            postedBy: widget.model.postedBy.toString(),
                          );
                        },
                        itemCount: modelList.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
