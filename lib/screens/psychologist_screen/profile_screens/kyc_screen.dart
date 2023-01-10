import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/profile_screens/kyc_confirm_name_screen.dart';
import 'package:greymatter/widgets/buttons.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({Key? key}) : super(key: key);

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, left: 24, right: 24),
        child: Row(
          children: [
            Expanded(
              child: MainButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ConfirmName()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      bottom: 20.h,
                    ),
                    child: Text(
                      "Next",
                      style: kManRope_500_16_white,
                    ),
                  ),
                  color: k006D77,
                  shape: CustomDecoration().button16Decoration()),
            ),
          ],
        ),
      ),
      backgroundColor: kWhiteBGColor,
      body: SizedBox(
        height: 1.sh,
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            Expanded(
              child: Container(
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 102.h),
                  child: Column(
                    children: [
                      Text(
                        'Enter your PAN number to Complete KYC',
                        style: kManRope_500_20_001314,
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Text(
                        'As per Privacy Policy is mandatory for investments in stocks & mutual funds',
                        style: kManRope_400_14_626A6A,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 64.h,
                      ),
                      SizedBox(
                        height: 62.h,
                        width: 1.sw,
                        child: TextField(
                          decoration:
                              TextfieldDecoration(label: 'Enter your PAN')
                                  .textfieldDecoration(),
                        ),
                      ),
                      // Container(
                      //   height: 62.h,
                      //   width: 1.sw,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(8)),
                      //     color: kECF0F8,
                      //   ),
                      //   child: Padding(
                      //     padding: EdgeInsets.only(left: 16.w),
                      //     child: Center(
                      //       child: TextField(
                      //         decoration: InputDecoration(
                      //           border: InputBorder.none,
                      //           hintText: 'Enter your PAN',
                      //           hintStyle: kManRope_400_16_626A6A,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          // Checkbox(
                          //   checkColor: Colors.white,
                          //   value: isChecked,
                          //   onChanged: (bool? value) {
                          //     setState(() {
                          //       isChecked = value!;
                          //     });
                          //   },
                          // ),

                          SvgPicture.asset(
                            'assets/icons/check mark-rectangle.svg',
                            height: 21.5.h,
                            width: 21.5.w,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'I authorise Ataraxis to fetch my KYC details for completing KYC.',
                            style: kManRope_400_12_626A6A,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 41.h,
                      ),
                      Container(
                        height: 104.h,
                        width: 1.sw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: kECF0F8),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Your data is protected by \nAtaraxis',
                                  style: kManRope_500_16_001314,
                                ),
                                Image.asset(
                                  'assets/images/security-unlock 1.png',
                                  height: 64.h,
                                  width: 46.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 223.h,
                      // ),
                      // CustomActiveTextButton(
                      //     onPressed: () {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //           builder: (context) => ConfirmName()));
                      //     },
                      //     text: 'Next'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
