import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/widgets/BottomSheets.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';

class PsychologistSavedScreen extends StatefulWidget {
  const PsychologistSavedScreen({Key? key}) : super(key: key);

  @override
  State<PsychologistSavedScreen> createState() => _PsychologistSavedScreenState();
}

class _PsychologistSavedScreenState extends State<PsychologistSavedScreen> {
  void _postbottomsheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => const PostBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9D,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 24.w, top: 40.h, right: 24.h, bottom: 20.h),
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 50.h,
                          width: 1.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 45.w,
                                        height: 45.h,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                            BorderRadius.circular(24)),
                                        child:
                                        Image.asset('assets/images/userP.png'),
                                      ),
                                      SizedBox(width: 8.w),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text('Priya singh',
                                              style: kManRope_400_16_Black),
                                          SizedBox(height: 1.h),
                                          Text('2 hours ago',
                                              style: kManRope_400_12_626A6A),
                                          SizedBox(height: 8.h),
                                        ],
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    _postbottomsheet();
                                  },
                                  child: Image.asset("assets/images/Frame 8565.png",height: 48.h,width: 48.w,))
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
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/likeiconlarge.png',
                                        height: 48.h,
                                        width: 48.w,
                                      ),
                                      Text('375', style: kManRope_400_14_Black),
                                    ],
                                  ),
                                  SizedBox(width: 16.w,),

                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/iconcommentlarge48.png',
                                        height: 48.h,
                                        width: 48.w,
                                      ),
                                      // SizedBox(
                                      //   width: 15.w,
                                      // ),
                                      Text('375', style: kManRope_400_14_Black),
                                    ],
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/iconbookmark48large.png',
                                    height: 48.h,
                                    width: 48.w,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Image.asset(
                                    'assets/images/iconsharelarge48.png',
                                    height: 48.h,
                                    width: 48.w,
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
                  );
                },
                separatorBuilder: (ctx, index) {
                  return SizedBox(height: 41.h);
                },
                itemCount: 10),
          ),
          // Positioned(
          //   bottom: 100.h,
          //   child: GestureDetector(
          //     onTap: () {
          //       // Navigator.of(context).push(MaterialPageRoute(
          //       //     builder: (context) => PsychologistCreatePostScreen()));
          //     },
          //     child: SvgPicture.asset(
          //       'assets/icons/addPost_1.svg',
          //       height: 72.h,
          //       width: 72.w,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
