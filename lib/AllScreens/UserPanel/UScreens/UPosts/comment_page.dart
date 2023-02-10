import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/reply_screen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/comment_widgets/user_comment_widget.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  void _postbottomsheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => const PostBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CuswhiteAppBar(
          hasThreeDots: false,
          imgPath: 'assets/images/iconbackappbar2.png',
          appBarText: 'All Comments',
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
                  child: TextField(
                    style: kManRope_400_14_626A6A,
                    /*onSubmitted: (text) {
                      final message = Messages(
                          text: text, date: DateTime.now(), isSentByme: true);
                      setState(() => messages.add(message));
                    }*/
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffDBE8FA)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffDBE8FA)),
                      ),
                      hintText: "Add a comment",
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                  height: 48,
                                  width: 48,
                                  // color: Colors.red,
                                  child: Image.asset(
                                    "assets/images/iconcameralage.png",
                                    height: 48,
                                    width: 48,
                                  )),
                              SizedBox(
                                  height: 48,
                                  width: 48,
                                  // color: Colors.red,
                                  child: Image.asset(
                                    "assets/images/icongallerylarge.png",
                                    height: 48,
                                    width: 48,
                                  )),
                              SizedBox(
                                  height: 48,
                                  width: 48,
                                  // color: Colors.red,
                                  child: Image.asset(
                                    "assets/images/iconsendlarge (2).png",
                                    height: 48,
                                    width: 48,
                                  )),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(
                left: 24.w, top: 40.h, right: 24.h, bottom: 20.h),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 1.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 45.h,
                          width: 135.w,
                          child: Row(
                            children: [
                              Container(
                                height: 45.h,
                                width: 45.w,
                                decoration: const BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                                clipBehavior: Clip.hardEdge,
                                child: Image.asset('assets/images/userP.png'),
                              ),
                              SizedBox(width: 8.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Priya singh',
                                      style: kManRope_500_16_Black),
                                  // SizedBox(height: 1.h),
                                  Text('2 hours ago',
                                      style: kManRope_400_12_626A6A),
                                  // SizedBox(height: 8.h),
                                ],
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              _postbottomsheet();
                            },
                            child: Image.asset(
                              "assets/images/Frame 8565.png",
                              height: 48.h,
                              width: 48.w,
                            ))
                        // PopupMenuButton<int>(
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(8)),
                        //   ),
                        //   icon: SvgPicture.asset(
                        //     'assets/icons/kebabMenu.svg',
                        //     height: 24.h,
                        //     width: 24.w,
                        //   ),
                        //   itemBuilder: (context) => [
                        //     // PopupMenuItem 1
                        //     PopupMenuItem(
                        //       value: 1,
                        //       // row with 2 children
                        //       child: Text(
                        //         "Share",
                        //         style: kManRope_400_16_Black,
                        //       ),
                        //     ),
                        //     // PopupMenuItem 2
                        //     PopupMenuItem(
                        //       value: 2,
                        //       // row with two children
                        //       child: Text("Save",
                        //           style: kManRope_400_16_Black),
                        //     ),
                        //     PopupMenuItem(
                        //       value: 3,
                        //       // row with two children
                        //       child: Text("Hide",
                        //           style: kManRope_400_16_Black),
                        //     ),
                        //     PopupMenuItem(
                        //       value: 4,
                        //       // row with two children
                        //       child: Text("Report",
                        //           style: kManRope_400_16_Black),
                        //     ),
                        //   ],
                        //   offset: Offset(0, 100),
                        //   color: Colors.white,
                        //   elevation: 2,
                        //   // on selected we show the dialog box
                        //   onSelected: (value) {},
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 17.h),
                  Container(
                    height: 285.h,
                    width: 380.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey,
                    ),
                    child: Image.asset(
                      'assets/images/post.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 48.h,
                    width: 1.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 48.h,
                              width: 73.w,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/iconlike24.png',
                                      height: 24.h,
                                      width: 24.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 12.w),
                                      child: Text('375',
                                          style: kManRope_400_14_626A6A),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            GestureDetector(
                              child: SizedBox(
                                height: 48.h,
                                width: 75.w,
                                // color: Colors.red,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CommentPage(),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: SizedBox(
                                          height: 24.h,
                                          width: 24.w,
                                          // color: Colors.red,

                                          child: Image.asset(
                                            'assets/images/iconcomment24.png',
                                            height: 24.h,
                                            width: 24.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Text('20', style: kManRope_400_14_626A6A),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 48,
                              width: 48,
                              // color: Colors.red,
                              child: Image.asset(
                                'assets/images/iconbookmark48.png',
                                height: 48,
                                width: 48,
                              ),
                            ),
                            // SizedBox(
                            //   width: 8.w,
                            // ),
                            SizedBox(
                              height: 48,
                              width: 48,
                              // color: Colors.red,
                              child: Image.asset(
                                'assets/images/iconshare48.png',
                                height: 44,
                                width: 44,
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
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          style: kManRope_400_14_626A6A,
                          text:
                              '“There is only one way to happiness and that is to cease worrying about things which are beyond the power of our will.” ...',
                        ),
                        WidgetSpan(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            color: Colors.transparent,
                            child: Text(
                              'Read more',
                              style: kManRope_600_14_006D77,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 24),
            child: Column(
              children: [
                Text(
                  "Comments",
                  style: kManRope_400_16_001314,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          usercommentWidget1(),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    //  height: 121.h,
                    width: 327.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      child: Text(
                        "Loreprinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        style: kManRope_400_14_626A6A,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 11,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReplyScreen()));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Reply",
                          style: kManRope_400_12_626A6A,
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
                  SizedBox(
                    width: 22,
                  ),
                  SvgPicture.asset(
                    'assets/icons/likeIcon.svg',
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text('375', style: kManRope_400_14_Black),
                ],
              ),
              SizedBox(
                height: 18,
              ),
            ]),
          ),
          usercommWidget(),
          SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      // height: 100.h,
                      width: 250.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        child: Text(
                          "Loreprinting and typesetting ggyjiure industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                          style: kManRope_400_14_626A6A,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          usercommentWidget1(),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    //height: 121.h,
                    width: 327.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      child: Text(
                        "Loreprinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        style: kManRope_400_14_626A6A,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReplyScreen()));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Reply",
                          style: kManRope_400_12_626A6A,
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
                  SizedBox(
                    width: 22,
                  ),
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
              SizedBox(
                height: 24,
              ),
            ]),
          ),
        ])));
  }
}

class Messages {
  final String text;
  final DateTime date;
  final bool isSentByme;
  const Messages(
      {required this.text, required this.date, required this.isSentByme});
}
