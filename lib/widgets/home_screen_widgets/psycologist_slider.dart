import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/fonts.dart';
// import 'package:greymatter/screens/UserPanel/UWidgets/Uwidgets.dart';

class PsychologistSlider extends StatelessWidget {
  PsychologistSlider({
    Key? key,
  }) : super(key: key);

  List<String> images = [
    'assets/images/userP.png',
    'assets/images/userpic2.png',
    'assets/images/userpic3.png',
    'assets/images/userpic4.png',
  ];
  List<String> rating = [
    '4.0',
    '4.0',
    '4.0',
    '4.0',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, top: 21.h),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.red,
                  height: 83.h,
                  // width: 2.w,
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          height: 80.h,
                          width: 81.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/userP.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Raghuram Singh ddhsdgh",
                              style: kManRope_400_16_001314,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "psychologist",
                              style: kManRope_400_14_626A6A,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            StarWidget()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 19.h,
                ),
                Container(
                  height: 83.h,
                  // width: 260.w,
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          height: 80.h,
                          width: 81.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/userpic3.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Animesh Jain",
                              style: kManRope_400_16_001314,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "psychologist",
                              style: kManRope_400_14_626A6A,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            StarWidget()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 17.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 83.h,
                  width: 281.w,
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          height: 80.h,
                          width: 81.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/userpic2.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ekta Sahu",
                              style: kManRope_400_16_001314,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "Cardiologist",
                              style: kManRope_400_14_626A6A,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            StarWidget()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 19.h,
                ),
                Container(
                  height: 83.h,
                  width: 281.w,
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          height: 80.h,
                          width: 81.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/userpic4.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Faisal Khan",
                              style: kManRope_400_16_001314,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "Anaesthetics",
                              style: kManRope_400_14_626A6A,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            StarWidget()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    // return SizedBox(
    // // width: 1.sw,
    // height: 182.h,
    // child:  ListView(
    //   children: [
    //     Container(
    //       height: 83.h,
    //       width: 281.w,
    //       child: Row(
    //         children: [
    //           Container(
    //             height: 80.h,
    //             width: 81.w,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(16),
    //                 image: DecorationImage(
    //                     image: AssetImage("assets/images/userP.png"),fit: BoxFit.cover
    //                 )
    //             ),
    //           ),
    //           SizedBox(width: 9.w,),
    //           Column(
    //             children: [
    //               Text("Raghuram Singh ddhsdgh",style: kManRope_400_16_001314,),
    //               Text("psychologist",style: kManRope_400_14_626A6A,),
    //               Row(
    //                 children: [
    //                   Image.asset("assets/images/Star 1.png",height: 20.h,width: 20.w,),
    //                   SizedBox(width: 4.w),
    //                   Text("4.0",style:kManRope_400_12_001314 ,),
    //                   SizedBox(width: 12.w),
    //                   Text("14 Yrs. Exp",style:kManRope_400_12_001314 ,),
    //
    //
    //
    //
    //                 ],
    //               )
    //
    //             ],
    //           )
    //         ],
    //       ),
    //     ),   Container(
    //       height: 83.h,
    //       width: 281.w,
    //       child: Row(
    //         children: [
    //           Container(
    //             height: 80.h,
    //             width: 81.w,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(16),
    //                 image: DecorationImage(
    //                     image: AssetImage("assets/images/userP.png"),fit: BoxFit.cover
    //                 )
    //             ),
    //           ),
    //           SizedBox(width: 9.w,),
    //           Column(
    //             children: [
    //               Text("Raghuram Singh ddhsdgh",style: kManRope_400_16_001314,),
    //               Text("psychologist",style: kManRope_400_14_626A6A,),
    //               Row(
    //                 children: [
    //                   Image.asset("assets/images/Star 1.png",height: 20.h,width: 20.w,),
    //                   SizedBox(width: 4.w),
    //                   Text("4.0",style:kManRope_400_12_001314 ,),
    //                   SizedBox(width: 12.w),
    //                   Text("14 Yrs. Exp",style:kManRope_400_12_001314 ,),
    //
    //
    //
    //
    //                 ],
    //               )
    //
    //             ],
    //           )
    //         ],
    //       ),
    //     ),   Container(
    //       height: 83.h,
    //       width: 281.w,
    //       child: Row(
    //         children: [
    //           Container(
    //             height: 80.h,
    //             width: 81.w,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(16),
    //                 image: DecorationImage(
    //                     image: AssetImage("assets/images/userP.png"),fit: BoxFit.cover
    //                 )
    //             ),
    //           ),
    //           SizedBox(width: 9.w,),
    //           Column(
    //             children: [
    //               Text("Raghuram Singh ddhsdgh",style: kManRope_400_16_001314,),
    //               Text("psychologist",style: kManRope_400_14_626A6A,),
    //               Row(
    //                 children: [
    //                   Image.asset("assets/images/Star 1.png",height: 20.h,width: 20.w,),
    //                   SizedBox(width: 4.w),
    //                   Text("4.0",style:kManRope_400_12_001314 ,),
    //                   SizedBox(width: 12.w),
    //                   Text("14 Yrs. Exp",style:kManRope_400_12_001314 ,),
    //
    //
    //
    //
    //                 ],
    //               )
    //
    //             ],
    //           )
    //         ],
    //       ),
    //     ),   Container(
    //       height: 83.h,
    //       width: 281.w,
    //       child: Row(
    //         children: [
    //           Container(
    //             height: 80.h,
    //             width: 81.w,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(16),
    //                 image: DecorationImage(
    //                     image: AssetImage("assets/images/userP.png"),fit: BoxFit.cover
    //                 )
    //             ),
    //           ),
    //           SizedBox(width: 9.w,),
    //           Column(
    //             children: [
    //               Text("Raghuram Singh ddhsdgh",style: kManRope_400_16_001314,),
    //               Text("psychologist",style: kManRope_400_14_626A6A,),
    //               Row(
    //                 children: [
    //                   Image.asset("assets/images/Star 1.png",height: 20.h,width: 20.w,),
    //                   SizedBox(width: 4.w),
    //                   Text("4.0",style:kManRope_400_12_001314 ,),
    //                   SizedBox(width: 12.w),
    //                   Text("14 Yrs. Exp",style:kManRope_400_12_001314 ,),
    //
    //
    //
    //
    //                 ],
    //               )
    //
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // )
    //
    //
    //
    //   // scrollDirection: Axis.horizontal,
    //   // itemBuilder: (context, int realIndex) {
    //   //   return Row(
    //   //     children: [
    //   //       Column(
    //   //         children: [
    //   //           Row(
    //   //             children: [
    //   //               Container(
    //   //                 height: 83.h,
    //   //                 width: 281.w,
    //   //                 child: Row(
    //   //                   children: [
    //   //                     Container(
    //   //                       height: 80.h,
    //   //                       width: 81.w,
    //   //                       decoration: BoxDecoration(
    //   //                         borderRadius: BorderRadius.circular(16),
    //   //                         image: DecorationImage(
    //   //                           image: AssetImage("assets/images/userP.png"),fit: BoxFit.cover
    //   //                         )
    //   //                       ),
    //   //                     ),
    //   //                     SizedBox(width: 9.w,),
    //   //                     Column(
    //   //                       children: [
    //   //                         Text("Raghuram Singh ddhsdgh",style: kManRope_400_16_001314,),
    //   //                         Text("psychologist",style: kManRope_400_14_626A6A,),
    //   //                        Row(
    //   //                          children: [
    //   //                            Image.asset("assets/images/Star 1.png",height: 20.h,width: 20.w,),
    //   //                            SizedBox(width: 4.w),
    //   //                            Text("4.0",style:kManRope_400_12_001314 ,),
    //   //                            SizedBox(width: 12.w),
    //   //                            Text("14 Yrs. Exp",style:kManRope_400_12_001314 ,),
    //   //
    //   //
    //   //
    //   //
    //   //                          ],
    //   //                        )
    //   //
    //   //                       ],
    //   //                     )
    //   //                   ],
    //   //                 ),
    //   //               ),
    //   //             ],
    //   //           )
    //   //
    //   //
    //   //         ],
    //   //       ),
    //   //       Column(
    //   //         children: [
    //   //           Row(
    //   //             children: [
    //   //               Container(
    //   //                 height: 83.h,
    //   //                 width: 281.w,
    //   //                 child: Row(
    //   //                   children: [
    //   //                     Container(
    //   //                       height: 80.h,
    //   //                       width: 81.w,
    //   //                       decoration: BoxDecoration(
    //   //                           borderRadius: BorderRadius.circular(16),
    //   //                           image: DecorationImage(
    //   //                               image: AssetImage("assets/images/userP.png"),fit: BoxFit.cover
    //   //                           )
    //   //                       ),
    //   //                     ),
    //   //                     SizedBox(width: 9.w,),
    //   //                     Column(
    //   //                       children: [
    //   //                         Text("Raghuram Singh ddhsdgh",style: kManRope_400_16_001314,),
    //   //                         Text("psychologist",style: kManRope_400_14_626A6A,),
    //   //                         Row(
    //   //                           children: [
    //   //                             Image.asset("assets/images/Star 1.png",height: 20.h,width: 20.w,),
    //   //                             SizedBox(width: 4.w),
    //   //                             Text("4.0",style:kManRope_400_12_001314 ,),
    //   //                             SizedBox(width: 12.w),
    //   //                             Text("14 Yrs. Exp",style:kManRope_400_12_001314 ,),
    //   //
    //   //
    //   //
    //   //
    //   //                           ],
    //   //                         )
    //   //
    //   //                       ],
    //   //                     )
    //   //                   ],
    //   //                 ),
    //   //               ),
    //   //             ],
    //   //           )
    //   //
    //   //
    //   //         ],
    //   //       )
    //   //     ],
    //   //   ) ;
    //   // },
    //
    // );
  }
}
