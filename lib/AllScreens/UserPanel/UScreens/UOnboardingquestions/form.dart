import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants/colors.dart';
import '../../../../widgets/shared/buttons/custom_active_text_button.dart';

class Form1 extends StatefulWidget {
  final int index;
  final List<String> questions;
  final List<TextEditingController> questionControllers;
  final List<String> labels;
  final Function onNextTap;
  const Form1({
    Key? key,
    required this.questions,
    required this.onNextTap,
    required this.questionControllers,
    required this.labels,
    required this.index,
  }) : super(key: key);

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  bool showOptions1 = false;
  List identifyList = [
    'Male',
    'Female',
    'Agender',
    'Bigender',
    'Genderfluid',
    'Genderqueer',
    'Gender nonconforming',
    'Gender questioning',
    'Gender variant',
    'Intersex',
    'Intersex man',
    'Intersex woman',
    'Neutrois',
    'Nonbinary man',
    'Nonbinary woman',
    'Pangender',
  ];

  int _radioVal = 0;

  String problem = 'Male';

  bool a = false;
  bool b = false;

  FocusNode missingFocus = FocusNode();
  final missingSomething = TextEditingController();

  saveResponse() async {
    var prefs = await SharedPreferences.getInstance();
    if (widget.labels.isEmpty) {
      if (missingSomething.text.isNotEmpty) {
        prefs.setString(Keys().identity, missingSomething.text);
      } else {
        prefs.setString(Keys().identity, problem);
      }
    } else {
      if (widget.index == 1) {
        prefs.setString(Keys().physicalHealth, widget.labels[_radioVal]);
      } else if (widget.index == 2) {
        prefs.setString(Keys().mentalHealth, widget.labels[_radioVal]);
      } else if (widget.index == 3) {
        prefs.setString(Keys().mentalHealthPeace, widget.labels[_radioVal]);
      } else if (widget.index == 4) {
        prefs.setString(Keys().lowTime, widget.labels[_radioVal]);
      } else if (widget.index == 5) {
        prefs.setString(Keys().emotionDay, widget.labels[_radioVal]);
      } else if (widget.index == 6) {
        prefs.setString(Keys().isHappy, widget.labels[_radioVal]);
      } else if (widget.index == 7) {
        prefs.setString(Keys().mentalDiagnosis, widget.labels[_radioVal]);
      } else if (widget.index == 8) {
        prefs.setString(Keys().lineageProblem, widget.labels[_radioVal]);
      }
      //prefs.setString(key, value);
    }
  }

  @override
  void initState() {
    missingFocus.addListener(() {
      setState(() {
        if (missingFocus.hasFocus) {
          showOptions1 = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: Offset(0, 8),
            blurRadius: 32,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          for (int j = 0; j < widget.questions.length; j++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.questions[j],
                  style: kManRope_400_16_626A6A,
                ),
                SizedBox(height: 16),
                Container(
                  width: 331.w,
                  // height: 1.h,
                  color: Colors.white,
                ),
                widget.labels.isEmpty
                    ? Column(
                        children: [
                          Container(
                            height: 1,
                            width: 1.sw,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showOptions1 = !showOptions1;
                                if (showOptions1) {
                                  missingFocus.unfocus();
                                }
                              });
                            },
                            child: Container(
                              height: 58.h,
                              width: 380.w,
                              decoration: BoxDecoration(
                                /*borderRadius: showOptions1
                                    ? BorderRadius.vertical(
                                        top: Radius.circular(10))
                                    : BorderRadius.circular(10),*/
                                color: Colors.transparent,
                                border: Border(
                                  bottom: BorderSide(
                                    color: showOptions1
                                        ? kB5BABA
                                        : Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    problem,
                                    style: kManRope_500_14_626A6A,
                                  ),
                                  (showOptions1)
                                      ? Padding(
                                          padding: EdgeInsets.only(right: 12.w),
                                          child: SvgPicture.asset(
                                            'assets/icons/circleCancel.svg',
                                            height: 24.h,
                                            width: 24.h,
                                          ),
                                        )
                                      : Image.asset(
                                          "assets/images/icondropdownlargee.png",
                                          height: 48.h,
                                          width: 48.w,
                                        )
                                ],
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.fastOutSlowIn,
                            height: showOptions1 ? 290.h : 0,
                            width: 1.sw,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: Colors.transparent,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int i = 0; i < identifyList.length; i++)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showOptions1 = false;
                                          problem = identifyList[i];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 24.w),
                                          child: Text(
                                            identifyList[i],
                                            style: kManRope_400_12_626A6A,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          TextFormField(
                            focusNode: missingFocus,
                            controller: missingSomething,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              //contentPadding: EdgeInsets.zero,
                              hintText: 'Type if we\'re missing something',
                              hintStyle: kManRope_500_14_626A6A,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                              height: 1, width: 1.sw, color: Colors.white),
                          ListView.builder(
                            itemCount: widget.labels.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: index,
                                        groupValue: _radioVal,
                                        activeColor: k006D77,
                                        onChanged: (value) {
                                          setState(() {
                                            _radioVal = index;
                                          });
                                        },
                                      ),
                                      Text(
                                        widget.labels[index],
                                        style: kManRope_400_16_263238,
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),

                /* TextFormField(
                  controller: widget.questionControllers[j],
                  decoration: DecorationCustomSuffix(
                          label: 'e.g. ${widget.labels[j]}',
                          showSuffix:
                              ((widget.index == 3 || widget.index == 8) &&
                                      j == 1)
                                  ? true
                                  : false,
                          suffixIcon: 'clock')
                      .textFieldDecoration(),
                ),*/
                // for (int i = 0; i < widget.labels.length; i++)
                // SizedBox(height: 16.h),
              ],
            ),
          Spacer(),
          if (!missingFocus.hasFocus)
            SizedBox(
              width: 1.sw,
              height: 56,
              child: CustomActiveTextButton(
                onPressed: () {
                  saveResponse();
                  widget.onNextTap();
                },
                text: 'Next',
              ),
            ),
        ],
      ),
    );
  }
  // Widget animatedContainer(BuildContext context) {
  //   bool selected = false;
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selected = !selected;
  //       });
  //     },
  //     child: AnimatedContainer(
  //       width: selected ? 400.0 : 200.0,
  //       height: selected ? 200.0 : 400.0,
  //       alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
  //       duration: Duration(seconds: 2),
  //       curve: dropDownValue != null ? dropDownValue.curveCubic : Curves.linear,
  //       child: Image.asset('assets/images/sea.jpg'),
  //     ),
  //   );
  // }
}
