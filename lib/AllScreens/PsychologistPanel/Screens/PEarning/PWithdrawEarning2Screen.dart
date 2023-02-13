import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/PAddBank.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/PWithdrawScreenSuccessful.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/BottomSheets/AccountNoBottomSheet.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import '../../../../constants/fonts.dart';

class PWithDrawEarningsScreen2 extends StatefulWidget {
  const PWithDrawEarningsScreen2({Key? key}) : super(key: key);

  @override
  State<PWithDrawEarningsScreen2> createState() =>
      _PWithDrawEarningsScreen2State();
}

class _PWithDrawEarningsScreen2State extends State<PWithDrawEarningsScreen2> {
  void _selectAccountNumbers() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => const AccountNumberBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        appBarText: 'Withdraw',
        imgPath: 'assets/images/iconbackappbarlarge.png',
        hasThreeDots: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // height: 40.h,
                width: 380.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Current Balance',
                      style: kManRope_500_16_001314,
                    ),
                    Text(
                      '\$4391',
                      style: kManRope_400_36_001314,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: SizedBox(
                  height: 56.h,
                  width: 182.w,
                  child: TextField(
                      style: kManRope_500_16_626A6A,
                      decoration: TextfieldDecoration(
                          label: "Type amount here",
                          hintstyle: kManRope_500_16_626A6A)
                          .textfieldDecoration()),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Credit to',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 48.h,
                child: TextField(
                    onTap: () {
                      _selectAccountNumbers();
                    },
                    readOnly: true,
                    decoration: TextfieldDecoration(
                      label: "This field will filled automatically",
                      child: Image.asset(
                        "assets/images/icondownlarge.png",
                        height: 48.h,
                        width: 48.h,
                      ),
                    ).textfieldDecoration()),
              ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                height: 48.h,
                width: 379.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add more Account',
                      style: kManRope_500_16_006D77,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PAddBankScreen()));
                      },
                      child: Image.asset(
                        'assets/images/iconaddaccount48.png',
                        height: 48.h,
                        width: 48.w,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 291.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 120.h),
                child: SizedBox(
                  height: 56.h,
                  width: 1.sw,
                  child: CustomActiveTextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PWithdrawSuccessfulScreen()));
                    },
                    text: 'Withdraw',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
