import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:grouped_list/grouped_list.dart';
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
  final _streamController = StreamController<Messages>();

  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  bool _isConnected = false;
  @override
  void initState() {
    super.initState();
    channel.stream.listen((event) {
      if (event == "CONNECTION ESTASHBLISH!") {
        setState(() {
          _isConnected = true;
        });
      } else {
        var dataJson = jsonDecode(event);
        var message = Messages.fromJson(dataJson);
        messages.add(message);
        _streamController.sink.add(message);
      }
    }, onDone: () {
      if (mounted) {
        setState(() {
          _isConnected = false;
        });
      }
    });
    // _streamController.sink.add(channel.stream);
    // channel.stream.asBroadcastStream().listen((event) {
    //
    //   messages.add(Messages.fromJson(dataJson));
    // });
  }

  @override
  void dispose() {
    channel.sink.close();
    _streamController.close();
    _controller.dispose();
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
                        label: 'Type here....',
                        child: InkWell(
                          onTap: () {
                            final message = Messages(
                              text: _controller.text,
                              isSentByme: true,
                              // date: DateTime.now(),
                              // isSentByme: true,
                              // style: kManRope_400_14_Black,
                              // isSeen: true
                            );
                            //setState(() => messages.add(message));
                            channel.sink.add(jsonEncode({
                              "text": _controller.text,
                              "name": "MK",
                              "to": "85"
                            }));
                            setState(() {
                              messages.add(message);
                            });
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
          //top: 40.h,
        ),
        child: Container(
          constraints: BoxConstraints(maxHeight: 1.sh),
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  //height: 100.h,
                  child: StreamBuilder<Messages>(
                stream: _streamController.stream,
                builder: (context, snapShot) {
                  // if (snapShot.connectionState == ConnectionState.waiting) {
                  //   return SpinKitThreeBounce(
                  //     color: k006D77,
                  //     size: 30,
                  //   );
                  // } else
                  if (snapShot.hasData) {
                    // log(snapShot.data.runtimeType.toString());
                    // log(snapShot.data.toString());
                    // var v = jsonDecode(snapShot.data);
                    // messages.add(Messages(
                    //     text: v['text'],
                    //     date: DateTime.now(),
                    //     isSentByme: false,
                    //     // style: TextStyle(),
                    //     isSeen: true));
                    // return Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(bottom: 32.0),
                    //     child: Column(
                    //       children: [
                    //         // Text(DateFormat("hh:mm a").format(snapShot.data!.date), style: kManRope_400_12_001314),
                    //         SizedBox(
                    //           height: 8,
                    //         ),
                    //         Container(
                    //           decoration: BoxDecoration(
                    //               color: false ? kFFFFFF : kFFFFFF,
                    //               borderRadius: BorderRadius.circular(10)),
                    //           child: Padding(
                    //             padding: EdgeInsets.all(12),
                    //             child: Text(snapShot.data!.text
                    //                 //messages.text,
                    //                 // style: FontConstant.k16w4008471Text
                    //                 //     .copyWith(color: Color(0xff5E5C70),
                    //                 ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 4,
                    //         ),
                    //         // messages.isSeen
                    //         //     ? Text(
                    //         //   "Seen",
                    //         //   style: kManRope_400_12_006D77,
                    //         // )
                    //         //     : SizedBox.shrink(),
                    //       ],
                    //     ),
                    //   ),
                    // );
                    return GroupedListView<Messages, DateTime>(
                      // physics: NeverScrollableScrollPhysics(),
                      // padding: EdgeInsets.zero,
                      reverse: true,
                      order: GroupedListOrder.DESC,
                      // padding: EdgeInsets.all(20),
                      elements: messages,
                      groupBy: (messages) => DateTime.now(),
                      groupHeaderBuilder: (Messages messages) => SizedBox(),
                      itemBuilder: (context, Messages messages) => Align(
                        alignment: messages.isSentByme
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Column(
                            children: [
                              // Text(DateFormat("hh:mm a").format(messages.date), style: kManRope_400_12_001314),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: kFFFFFF,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text(
                                    messages.text,
                                    style: kManRope_400_14_001314,
                                    // style: FontConstant.k16w4008471Text
                                    // .copyWith(color: Color(0xff5E5C70),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              // messages.isSeen
                              //     ? Text(
                              //         "Seen",
                              //         style: kManRope_400_12_006D77,
                              //       )
                              //     : SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (snapShot.hasError) {
                    return Text("Error");
                  } else {
                    return Align(
                      child: Text(_isConnected
                          ? "Chat Connected!"
                          : "Chat Disconnected!"),
                      alignment: Alignment.bottomCenter,
                    );
                    // return SpinKitThreeBounce(
                    //   color: k006D77,
                    //   size: 30,
                    // );
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
  // late TextStyle style;
  late DateTime date;
  late bool isSentByme;
  // late bool isSeen;
  Messages({
    required this.text,
    //required this.date,
    required this.isSentByme,
    // required this.style,
    //required this.isSeen
  });

  Messages.fromJson(Map<String, dynamic> json) {
    //date = json['date'];
    text = json['text'];
    isSentByme = json['isMe'];
    //isSeen = json['isSeen'];
    // style = TextStyle();
  }
}
