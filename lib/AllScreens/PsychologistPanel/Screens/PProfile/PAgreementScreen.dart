import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PAgreementScreen extends StatelessWidget {
  const PAgreementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Agreement',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: Column(
          children: [
            // GestureDetector(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const PAgreementDetails()));
            //   },
            //   child: Container(
            //     width: 380.w,
            //     height: 48.h,
            //     color: Colors.transparent,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           'Agreement',
            //           style: kManRope_500_16_001314,
            //         ),
            //         SizedBox(
            //           height: 48,
            //           width: 48,
            //           // color: Colors.red,
            //           child: Image.asset(
            //             'assets/images/iconrightarrowlarge.png',
            //             height: 48,
            //             width: 48,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 8.h,
            // ),
            GestureDetector(
              onTap: () async {
                const url = 'https://theataraxis.com/privacy-policy.php';
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                } else {
                  throw 'Could not launch $url';
                }
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const PPrivacyAndPolicyScreen()));
              },
              child: Container(
                width: 380.w,
                height: 48.h,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy and Policy',
                      style: kManRope_500_16_001314,
                    ),
                    SizedBox(
                      height: 48,
                      width: 48,
                      // color: Colors.red,
                      child: Image.asset(
                        'assets/images/iconrightarrowlarge.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () async {
                const url = 'https://theataraxis.com/terms-and-conditions.php';
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                } else {
                  throw 'Could not launch $url';
                }
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const PTermsAndConditionsScreen()));
              },
              child: Container(
                width: 380.w,
                height: 48.h,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Terms and Conditions',
                      style: kManRope_500_16_001314,
                    ),
                    SizedBox(
                      height: 48,
                      width: 48,
                      // color: Colors.red,
                      child: Image.asset(
                        'assets/images/iconrightarrowlarge.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
