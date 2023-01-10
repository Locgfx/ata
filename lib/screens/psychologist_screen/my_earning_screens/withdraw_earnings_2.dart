import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/screens/psychologist_screen/my_earning_screens/add_bank.dart';
import 'package:greymatter/screens/psychologist_screen/my_earning_screens/withdraw_successful_screen.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';

import '../../../constants/fonts.dart';

class WithDrawEarningsScreen2 extends StatefulWidget {
  const WithDrawEarningsScreen2({Key? key}) : super(key: key);

  @override
  State<WithDrawEarningsScreen2> createState() =>
      _WithDrawEarningsScreen2State();
}

class _WithDrawEarningsScreen2State extends State<WithDrawEarningsScreen2> {
  void _selectAccountNumbers() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => const AccountNumberBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CusAppBar(
        appBarText: 'Withdraw',
        imgPath: 'assets/images/Vector 175.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Container(
                  height: 56.h,
                  width: 182.w,
                  child: TextField(
                      decoration: TextfieldDecoration(
                              label: "           Type amount here")
                          .textfieldDecoration()),
                ),
              ),
              // Center(
              //   child: Container(
              //     height: 56.h,
              //     width: 182.w,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(8)),
              //       color: kWhiteBGColor,
              //     ),
              //     child: Center(
              //       child: SizedBox(
              //         width: 136.w,
              //         child: TextField(
              //           decoration: InputDecoration(
              //             border: InputBorder.none,
              //             hintText: 'Type amount here',
              //             hintStyle: kManRope_500_16_626A6A,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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
                            child: Image.asset(
                              "assets/images/downarrow.png",
                              height: 10,
                              width: 10,
                            ),
                            label: "This field will filled automatically")
                        .textfieldDecoration()),
              ),
              SizedBox(
                height: 53.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add more Account',
                    style: kManRope_500_16_006D77,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddBankScreen()));
                    },
                    child: SvgPicture.asset(
                      'assets/icons/plus-square.svg',
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 291.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: SizedBox(
                  height: 56.h,
                  width: 1.sw,
                  child: CustomActiveTextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WithdrawSuccessful()));
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
