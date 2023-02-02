import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/comment_widgets/user_comment_widget.dart';

import '../../../../widgets/app_bar/app_bar.dart';

class UReplyScreen extends StatefulWidget {
  const UReplyScreen({Key? key}) : super(key: key);

  @override
  State<UReplyScreen> createState() => _UReplyScreenState();
}

class _UReplyScreenState extends State<UReplyScreen> {
  final cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CuswhiteAppBar(
        hasThreeDots: false,
        imgPath: 'assets/images/iconbackappbar2.png',
        appBarText: '',
      ),
      backgroundColor: kEDF6F9,
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                flex: (cont.text.isEmpty) ? 1 : 6,
                child: Container(
                  color: Colors.transparent,
                  child: TextField(
                    controller: cont,
                    style: kManRope_400_14_626A6A,
                    /*onSubmitted: (text) {
                            final message = Messages(
                                text: text, date: DateTime.now(), isSentByme: true);
                            setState(() => messages.add(message));
                          }*/
                    maxLines: 5,
                    minLines: 1,
                    onChanged: (v) {
                      setState(() {});
                    },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, color: Colors.transparent),
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
                    mainAxisAlignment: (cont.text.isEmpty)
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (cont.text.isEmpty)
                        Container(
                          height: 48,
                          width: 48,
                          color: Colors.transparent,
                          child: Image.asset(
                            "assets/images/iconcameralage.png",
                            height: 48,
                            width: 48,
                          ),
                        ),
                      if (cont.text.isEmpty)
                        Container(
                          height: 48,
                          width: 48,
                          color: Colors.transparent,
                          child: Image.asset(
                            "assets/images/icongallerylarge.png",
                            height: 48,
                            width: 48,
                          ),
                        ),
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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(maxHeight: 1.sh + 310),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Replies to Priya Singh’s comment on this post ",
                style: kManRope_400_16_001314,
              ),
              SizedBox(height: 27),
              usercommentWidget1(),
              SizedBox(height: 8),
              Expanded(
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
              ),
              SizedBox(height: 24),
              usercommentWidget1(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 327.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            "Loreprinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            style: kManRope_400_14_626A6A,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ReplyScreen()));
                            },
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UReplyScreen()));
                                  },
                                  child: Text(
                                    "Reply",
                                    style: kManRope_400_12_626A6A,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
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
                          SizedBox(
                            width: 6,
                          ),
                          Text('375', style: kManRope_400_14_626A6A),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
