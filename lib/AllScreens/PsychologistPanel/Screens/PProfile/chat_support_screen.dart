import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class ChatSupportScreen extends StatelessWidget {
  const ChatSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 40.w,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text(
          'Chat support',
          style: kManRope_500_16_006D77,
        ),
        titleSpacing: 18.w,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Today 17/June/2022',
                  style: kManRope_400_12_001314,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '11:45 Pm',
                    style: kManRope_400_12_001314,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 45.h,
                    width: 60.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        'Hi',
                        style: kManRope_400_14_001314,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Seen',
                    style: kManRope_400_12_006D77,
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Priyanka',
                            style: kManRope_400_12_001314,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '11:45 Pm',
                            style: kManRope_400_12_001314,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        height: 66.h,
                        width: 280.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 24, right: 32),
                            child: Text(
                              'Hi Priyanka my name is harish how can I help you?',
                              style: kManRope_400_14_001314,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '11:45 Pm',
                    style: kManRope_400_12_001314,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 66.h,
                        width: 281.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 24, right: 32),
                            child: Text(
                              'Hi Harish, I have issues with my friend. can you help me?',
                              style: kManRope_400_14_001314,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Seen',
                    style: kManRope_400_12_006D77,
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Priyanka',
                            style: kManRope_400_12_001314,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '11:45 Pm',
                            style: kManRope_400_12_001314,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        height: 66.h,
                        width: 280.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 24, right: 32),
                            child: Text(
                              'Can you tell me more about your problem?',
                              style: kManRope_400_14_626A6A,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '11:45 Pm',
                    style: kManRope_400_12_001314,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 45.h,
                    width: 60.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        'ok',
                        style: kManRope_400_14_001314,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Seen',
                    style: kManRope_400_12_626A6A,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: TextField(
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
                    //fillColor: Colors.white,
                    hintText: "Add a comment",
                    // hintStyle: kManRope_400_14_626A6A,
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            /*Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ImageIcon(
                                AssetImage("assets/images/photoimage.png"),
                                size: 24,
                                // color: ThemeColor.primarycolor,
                              ),
                            ),*/
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ImageIcon(
                                AssetImage("assets/images/imageph.png"),
                                size: 24,
                                // color: ThemeColor.primarycolor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ImageIcon(
                                AssetImage("assets/images/sendimage.png"),
                                size: 24,
                                color: k006D77,
                              ),
                            ),
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
    );
  }
}
