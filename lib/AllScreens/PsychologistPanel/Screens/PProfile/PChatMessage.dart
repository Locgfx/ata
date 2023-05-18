import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PChatMessages extends StatefulWidget {
  const PChatMessages({Key? key}) : super(key: key);

  @override
  State<PChatMessages> createState() => _PChatMessagesState();
}

class _PChatMessagesState extends State<PChatMessages> {
  final TextEditingController _controller = TextEditingController();
  List<Messages> messages = [];
  final channel = WebSocketChannel.connect(
    Uri.parse('ws://192.168.1.145:3030'),
  );

  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    channel.stream.listen((event) {
      var dataJson = jsonDecode(event);
      messages.add(Messages.fromJson(dataJson));
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        imgPath: 'assets/images/iconbackappbarlarge.png',
        appBarText: 'Chat support',
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 25.h),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            color: kEDF6F9,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: _controller,
                      minLines: 1,
                      maxLines: 5,
                      style: kManRope_400_14_001314,
                      decoration: TextfieldDecoration(
                        label: 'Abc....',
                        child: InkWell(
                          onTap: () {
                            final message = Messages(
                                text: _controller.text,
                                date: DateTime.now(),
                                isSentByme: true,
                                style: kManRope_400_14_Black,
                                isSeen: true);
                            setState(() => messages.add(message));
                            //channel.sink.add(jsonEncode({"msg": "Hello", "name": "MK", "to": "82"}));
                            _controller.clear();
                          },
                          child: Image.asset(
                            "assets/images/send.png",
                          ),
                        ),
                      ).searchFieldDecoration()),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 40.h,
        ),
        child: Container(
          constraints: BoxConstraints(maxHeight: 1.sh),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                  //height: 100.h,
                  child: StreamBuilder(
                stream: channel.stream,
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return LoadingWidget();
                  } else if (snapShot.hasData) {
                    // messages.add(Messages(
                    //     text: snapShot.data!.text,
                    //     date: snapShot.data!.date,
                    //     isSentByme: snapShot.data!.isSentByme,
                    //     style: TextStyle(),
                    //     isSeen: snapShot.data!.isSeen));
                    return GroupedListView<Messages, DateTime>(
                      physics: NeverScrollableScrollPhysics(),
                      // padding: EdgeInsets.zero,
                      reverse: true,
                      order: GroupedListOrder.DESC,
                      // padding: EdgeInsets.all(20),
                      elements: messages,
                      groupBy: (messages) => messages.date,
                      groupHeaderBuilder: (Messages messages) => SizedBox(),
                      itemBuilder: (context, Messages messages) => Align(
                        alignment: messages.isSentByme
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Column(
                            children: [
                              Text(DateFormat("hh:mm a").format(messages.date),
                                  style: kManRope_400_12_001314),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
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
                              SizedBox(
                                height: 4,
                              ),
                              messages.isSeen
                                  ? Text(
                                      "Seen",
                                      style: kManRope_400_12_006D77,
                                    )
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (snapShot.hasError) {
                    return Text("Error");
                  } else {
                    return Text("Default");
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class Messages {
  late String text;
  late TextStyle style;
  late DateTime date;
  late bool isSentByme;
  late bool isSeen;
  Messages(
      {required this.text,
      required this.date,
      required this.isSentByme,
      required this.style,
      required this.isSeen});

  Messages.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    text = json['msg'];
    isSentByme = json['isMe'];
    isSeen = json['isSeen'];
    style = TextStyle();
  }
}
