import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:grouped_list/grouped_list.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({Key? key}) : super(key: key);

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  List<Messages> messages = [
    // Messages(
    //     style: kManRope_400_14_Black,
    //     text: 'Hi.',
    //     date: DateTime.now().subtract(Duration(minutes: 1)),
    //     isSentByme: true),
    // Messages(
    //     style: kManRope_400_14_Black,
    //     text: 'Hi Priyanka my name is harish how can I help you?',
    //     date: DateTime.now().subtract(Duration(minutes: 1)),
    //     isSentByme: false),
    // Messages(
    //     style: kManRope_400_14_Black,
    //     text: 'Hi Harish, I have issues with my friend. can you help me?',
    //     date: DateTime.now().subtract(Duration(minutes: 1)),
    //     isSentByme: true),
    // Messages(
    //     style: kManRope_400_14_Black,
    //     text: 'Can you tell me more about your problem?',
    //     date: DateTime.now().subtract(Duration(minutes: 1)),
    //     isSentByme: false),
  ];

  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  // final bottom = MediaQuery.of(context).viewInsets.bottom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(
        imgPath: 'assets/images/Vector 175.png',
        appBarText: 'Chat support',
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 25.h),
        child: Container(
          color: kWhiteBGColor,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                    onSubmitted: (text) {
                      final message = Messages(
                          text: text,
                          date: DateTime.now(),
                          isSentByme: true,
                          style: kManRope_400_14_Black);
                      setState(() => messages.add(message));
                    },
                    decoration: TextfieldDecoration(
                      label: 'Abc....',
                      child: Image.asset(
                        "assets/images/sendicon.png",
                      ),
                    ).searchFieldDecoration()),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            top: 40.h,
          ),
          child: Column(
            children: [
              Text(
                "Today 17/June/2022",
                style: kManRope_400_12_001314,
              ),
              SizedBox(
                height: 60.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("11:45 Pm", style: kManRope_400_12_001314),
                    SizedBox(height: 8.h),
                    Container(
                      width: 61.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Hi",
                          style: kManRope_400_14_001314,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Seen",
                      style: kManRope_400_12_006D77,
                    )
                  ],
                ),
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Harish 11:47 Pm",
                      //
                      style: kManRope_400_12_001314),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        SizedBox(height: 8.h),
                        Container(
                          width: 281.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Hi Priyanka my name is harish how can I help you?",
                              style: kManRope_400_14_001314,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Text(
                  //   "Seen",
                  //   style: kManRope_400_12_006D77,
                  // )
                ],
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("11:47 Pm", style: kManRope_400_12_001314),
                    SizedBox(height: 8.h),
                    Container(
                      width: 281.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Hi Harish, I have issues with my friend. can you help me?",
                          style: kManRope_400_14_001314,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Seen",
                      style: kManRope_400_12_006D77,
                    )
                  ],
                ),
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Harish 11:47 Pm",
                      //
                      style: kManRope_400_12_001314),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        SizedBox(height: 8.h),
                        Container(
                          width: 281.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Can you tell me more about your problem?",
                              style: kManRope_400_14_001314,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 400.h,
                child: GroupedListView<Messages, DateTime>(
                  physics: NeverScrollableScrollPhysics(),
                  // padding: EdgeInsets.zero,
                  reverse: true,
                  order: GroupedListOrder.DESC,
                  // padding: EdgeInsets.all(20),
                  elements: messages,
                  groupBy: (messages) => DateTime(messages.date.year,
                      messages.date.month, messages.date.day),
                  groupHeaderBuilder: (Messages messages) => SizedBox(),
                  itemBuilder: (context, Messages messages) => Align(
                    alignment: messages.isSentByme
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Align(
                      alignment: messages.isSentByme
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: Column(
                          children: [
                            // Align(
                            //     alignment: messages.isSentByme
                            //         ? Alignment.centerRight
                            //         : Alignment.centerLeft,
                            //
                            //     child: Text("hiii")),

                            Container(
                              width: 281.w,
                              decoration: BoxDecoration(
                                  color:
                                      messages.isSentByme ? kFFFFFF : kFFFFFF,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  messages.text,
                                  // style: FontConstant.k16w4008471Text
                                  //     .copyWith(color: Color(0xff5E5C70),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: !_isVisible ? 32.h : 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Messages {
  final String text;
  final TextStyle style;
  final DateTime date;
  final bool isSentByme;
  const Messages({
    required this.text,
    required this.date,
    required this.isSentByme,
    required this.style,
  });
}
