import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PLogin/PLoginScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/ULoginScreens/ULoginScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/widgets/onboarding_screen_widgets/onb_slide.dart';
import 'package:greymatter/widgets/shared/buttons/custom_text_w_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/shared/buttons/costom_secondary_text_w_icon_button.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  int _index = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      //print(_index);
      /*if (_index != 3) {*/
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
      /*} else {
        _controller.animateToPage(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
        );
      }*/
    });
  }

  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: kEDF6F9,
        systemOverlayStyle: Platform.isAndroid
            ? SystemUiOverlayStyle(
                statusBarColor: kEDF6F9,
                statusBarIconBrightness: Brightness.dark,
              )
            : SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [
          SizedBox(height: 80.h),
          Expanded(
            //height: 531.h,
            //width: 1.sw,
            child: PageView(
              controller: _controller,
              onPageChanged: (val) {
                //print(_index);
                setState(() {
                  _index = val;
                });
                //print(_index);
              },
              children: const [
                OnbSlide(
                    text:
                        'Book an instant appointment with the right  Counsellors',
                    image: 'assets/images/onb1.png'),
                OnbSlide(
                    text: 'Get 24*7 chat support',
                    image: 'assets/images/onb2.png'),
                OnbSlide(
                    text: 'Schedule meeting as per your requirement',
                    image: 'assets/images/onb3.png'),
                OnbSlide(
                    text:
                        'Get expert guidance from certified counsellors and therapists',
                    image: 'assets/images/onb4.png'),
                OnbSlide(
                    text:
                        'Book an instant appointment with the right  Counsellors',
                    image: 'assets/images/onb1.png'),
                OnbSlide(
                    text: 'Get 24*7 chat support',
                    image: 'assets/images/onb2.png'),
                OnbSlide(
                    text: 'Schedule meeting as per your requirement',
                    image: 'assets/images/onb3.png'),
                OnbSlide(
                    text:
                        'Get expert guidance from certified counsellors and therapists',
                    image: 'assets/images/onb4.png'),
                OnbSlide(
                    text:
                        'Book an instant appointment with the right  Counsellors',
                    image: 'assets/images/onb1.png'),
                OnbSlide(
                    text: 'Get 24*7 chat support',
                    image: 'assets/images/onb2.png'),
                OnbSlide(
                    text: 'Schedule meeting as per your requirement',
                    image: 'assets/images/onb3.png'),
                OnbSlide(
                    text:
                        'Get expert guidance from certified counsellors and therapists',
                    image: 'assets/images/onb4.png'),
                OnbSlide(
                    text:
                        'Book an instant appointment with the right  Counsellors',
                    image: 'assets/images/onb1.png'),
                OnbSlide(
                    text: 'Get 24*7 chat support',
                    image: 'assets/images/onb2.png'),
                OnbSlide(
                    text: 'Schedule meeting as per your requirement',
                    image: 'assets/images/onb3.png'),
                OnbSlide(
                    text:
                        'Get expert guidance from certified counsellors and therapists',
                    image: 'assets/images/onb4.png'),
                OnbSlide(
                    text:
                        'Book an instant appointment with the right  Counsellors',
                    image: 'assets/images/onb1.png'),
                OnbSlide(
                    text: 'Get 24*7 chat support',
                    image: 'assets/images/onb2.png'),
                OnbSlide(
                    text: 'Schedule meeting as per your requirement',
                    image: 'assets/images/onb3.png'),
                OnbSlide(
                    text:
                        'Get expert guidance from certified counsellors and therapists',
                    image: 'assets/images/onb4.png'),
                OnbSlide(
                    text:
                        'Book an instant appointment with the right  Counsellors',
                    image: 'assets/images/onb1.png'),
                OnbSlide(
                    text: 'Get 24*7 chat support',
                    image: 'assets/images/onb2.png'),
                OnbSlide(
                    text: 'Schedule meeting as per your requirement',
                    image: 'assets/images/onb3.png'),
                OnbSlide(
                    text:
                        'Get expert guidance from certified counsellors and therapists',
                    image: 'assets/images/onb4.png'),
                OnbSlide(
                    text:
                        'Book an instant appointment with the right  Counsellors',
                    image: 'assets/images/onb1.png'),
                OnbSlide(
                    text: 'Get 24*7 chat support',
                    image: 'assets/images/onb2.png'),
                OnbSlide(
                    text: 'Schedule meeting as per your requirement',
                    image: 'assets/images/onb3.png'),
                OnbSlide(
                    text:
                        'Get expert guidance from certified counsellors and therapists',
                    image: 'assets/images/onb4.png'),
                OnbSlide(
                    text:
                        'Book an instant appointment with the right  Counsellors',
                    image: 'assets/images/onb1.png'),
                OnbSlide(
                    text: 'Get 24*7 chat support',
                    image: 'assets/images/onb2.png'),
                OnbSlide(
                    text: 'Schedule meeting as per your requirement',
                    image: 'assets/images/onb3.png'),
                OnbSlide(
                    text:
                        'Get expert guidance from certified counsellors and therapists',
                    image: 'assets/images/onb4.png'),
                OnbSlide(
                    text:
                        'Book an instant appointment with the right  Counsellors',
                    image: 'assets/images/onb1.png'),
                OnbSlide(
                    text: 'Get 24*7 chat support',
                    image: 'assets/images/onb2.png'),
                OnbSlide(
                    text: 'Schedule meeting as per your requirement',
                    image: 'assets/images/onb3.png'),
                OnbSlide(
                    text:
                        'Get expert guidance from certified counsellors and therapists',
                    image: 'assets/images/onb4.png'),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            height: 4.h,
            decoration: BoxDecoration(
              color: k5A72ED.withOpacity(0.15),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  width: 24.w,
                  decoration: BoxDecoration(
                    color: _index % 4 == 0 ? k5A72ED : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  duration: const Duration(milliseconds: 200),
                ),
                AnimatedContainer(
                  width: 24.w,
                  decoration: BoxDecoration(
                    color: _index % 4 == 1 ? k5A72ED : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  duration: const Duration(milliseconds: 200),
                ),
                AnimatedContainer(
                  width: 24.w,
                  decoration: BoxDecoration(
                    color: _index % 4 == 2 ? k5A72ED : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  duration: const Duration(milliseconds: 200),
                ),
                AnimatedContainer(
                  width: 24.w,
                  decoration: BoxDecoration(
                    color: _index % 4 == 3 ? k5A72ED : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  duration: const Duration(milliseconds: 200),
                ),
              ],
            ),
          ),
          SizedBox(height: 48.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomTextWIconButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setBool(Keys().isUser, true);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) =>
                        // WelcomeScreen(),
                        ULoginScreen(showBack: true)));
              },
              text: 'I am seeking help',
            ),
          ),
          SizedBox(height: 26.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: 1.sw,
            height: 56.h,
            child: CustomSecondaryButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setBool(Keys().isUser, false);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => PLoginScreen()));
              },
              text: 'I am a counsellor',
            ),
          ),
          SizedBox(height: 38.h),
        ],
      ),
    );
  }
}
