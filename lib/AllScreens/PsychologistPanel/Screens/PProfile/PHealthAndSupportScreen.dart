import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PChatMessage.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UFaq.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../Apis/message_api/chat_token_api.dart';
import '../../../../constants/globals.dart';

class PHelpAndSupportScreen extends StatelessWidget {
  const PHelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 30,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 12.h),
              child: SizedBox(
                height: 48,
                // color: Colors.red,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/images/iconbackappbar2.png",
                        height: 48,
                        width: 32,
                      ),
                    ),
                    Text(
                      "Help and support",
                      style: kManRope_500_16_006D77,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 1.sw,
                    color: Colors.white,
                    child: Image.asset(
                      'assets/images/helpAndSupport.png',
                      height: 330.h,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Tell us how we can help you',
                    style: kManRope_700_20_001314,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Our crew of superhero’s are standing\n             by for service and support',
                    style: kManRope_400_16_626A6A,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            var prefs = await SharedPreferences.getInstance();
                            bool isUser = prefs.getBool(Keys().isUser) ?? true;
                            String type = isUser ? "user" : "psychologist";
                            String chatToken = '';
                            String fromId = '';
                            final resp = GetChatToken().get();
                            resp.then((value) {
                              if (value == false) {
                              } else {
                                if (value['status'] == true) {
                                  chatToken = value['chat_token'];
                                  fromId = value['from_id'];
                                  WebSocketChannel channel =
                                      WebSocketChannel.connect(
                                    Uri.parse(
                                        "ws://192.168.1.145:3030?token=$chatToken&receiver_user_type=$type"),
                                  );
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PChatMessages(
                                            channel: channel,
                                            chatToken: chatToken,
                                            fromId: fromId,
                                          )));
                                }
                              }
                            });
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 68.h,
                              width: 68.w,
                              decoration: const BoxDecoration(
                                  color: k006D77, shape: BoxShape.circle),
                              child: Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/chat.svg',
                                      width: 24.h,
                                      height: 24.h)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const UFaqScreen()));
                          },
                          child: Container(
                            height: 84.h,
                            width: 1.sw,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'FAQs',
                                        style: kManRope_700_20_001314,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        'Find intelligent aswers instantly',
                                        style: kManRope_400_16_626A6A,
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 48,
                                      width: 48,
                                      // color: Colors.red,
                                      child: Image.asset(
                                        'assets/images/iconrightarrowlarge.png',
                                        height: 48.h,
                                        width: 48.w,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          height: 84.h,
                          width: 1.sw,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email',
                                      style: kManRope_700_20_001314,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      'Get solutions beamed to your inbox',
                                      style: kManRope_400_16_626A6A,
                                    ),
                                  ],
                                ),
                                Center(
                                  child: SizedBox(
                                    height: 48,
                                    width: 48,
                                    // color: Colors.red,
                                    child: Image.asset(
                                      'assets/images/iconrightarrowlarge.png',
                                      height: 48.h,
                                      width: 48.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48.h,
            )
          ],
        ),
      ),
    );
  }
}
