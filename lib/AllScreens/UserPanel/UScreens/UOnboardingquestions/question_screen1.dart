import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UWelcome/welcome_screen.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/model/question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:greymatter/screens/UserPanel/UScreens/UWelcome/welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/colors.dart';
import '../../../../model/question_model.dart';
import 'form.dart';
// import '../UserPanel/UWelcome/welcome_screen.dart';

class Questions extends StatefulWidget {
  const Questions({
    Key? key,
  }) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final _pageController = PageController();
  int currentIndex = 0;

  List<Question> questionList = [
    Question(
      question: ['How do you identify Yourself?'],
      questionController: [TextEditingController()],
      label: [],
    ),
    Question(
      question: [
        'Being Honest How Would You Rate Your Physical Health?',
      ],
      questionController: [TextEditingController(), TextEditingController()],
      label: [
        'Excellent',
        'Average',
        'Poor',
        'Not Sure',
      ],
    ),
    Question(
      question: [
        'Being Honest How Would You Rate Your Mental Health?',
      ],
      questionController: [TextEditingController(), TextEditingController()],
      label: ['Excellent', 'Average', 'Poor', 'Not Sure'],
    ),
    Question(
      question: [
        'In recent time would you say face any issues with your mental health peace?'
      ],
      questionController: [TextEditingController(), TextEditingController()],
      label: ['Yes', 'No', 'Not Sure'],
    ),
    Question(
      question: [
        'Have you felt particularly low or down for more than 2 weeks in a Row?'
      ],
      questionController: [TextEditingController()],
      label: ['Very Often', 'Somewhat Often', 'Not So Often', 'Not At All'],
    ),
    Question(
      question: ['What Emotion Defines Major Part Of Your Day?'],
      questionController: [TextEditingController()],
      label: ['Calm And Peaceful', 'Energetic', 'Gloomy', 'Angry'],
    ),
    Question(
      question: ['If Asked Would You Say That You Are Happy? '],
      questionController: [TextEditingController()],
      label: ['Yes', 'No', 'Unsure'],
    ),
    Question(
      question: [
        'Have You Ever Been Diagnosed With Something That’s Related to Mental Health? '
      ],
      questionController: [TextEditingController()],
      label: ['Yes', 'No', 'Can’t Recall'],
    ),
    Question(
      question: [
        'Does Any Member Of Your Family Lineage Ever Suffered From Any Mental Health Problems?'
      ],
      questionController: [TextEditingController()],
      label: ['Yes', 'No', 'Can’t Recall'],
    )
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: kEDF6F9,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: kEDF6F9,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: kEDF6F9,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 9,
                        effect: WormEffect(
                          radius: 2,
                          dotWidth: 19.w,
                          dotHeight: 4.h,
                          dotColor: k006D77.withOpacity(0.36),
                          activeDotColor: k006D77,
                        ),
                      ),
                      SizedBox(
                        width: 80.w,
                      ),
                      InkWell(
                        onTap: () async {
                          var prefs = await SharedPreferences.getInstance();
                          prefs.setBool(Keys().questionsDone, false);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => WelcomeScreen()));
                        },
                        child: Text(
                          "Skip all",
                          style: kManRope_500_16_006D77,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  //height: 300.h,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (v) {
                      setState(() {
                        currentIndex = v;
                      });
                    },
                    children: List.generate(questionList.length, (i) {
                      return Form1(
                        index: i,
                        questions: questionList[i].question,
                        questionControllers: questionList[i].questionController,
                        labels: questionList[i].label,
                        onNextTap: () async {
                          if (i != 8) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                            );
                          } else {
                            // SharedPrefs.setQuestionsLog(true);
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setBool(Keys().questionsDone, true);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => WelcomeScreen()));
                            /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DashBoard(),),);*/
                          }
                        },
                      );
                    }),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (currentIndex == 8) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => WelcomeScreen()));
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                      );
                    }
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setBool(Keys().questionsDone, false);
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(10),
                    child: Text('Skip For Now', style: kManRope_500_16_006D77),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
