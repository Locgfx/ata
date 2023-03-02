import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/PBankAccountVerifyScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import '../../../../constants/fonts.dart';

final List<String> Banks = [
  'Andhra Bank',
  'Axis Bank',
  'Bank Of America',
  'Bank Of America',
  'Bank of India',
  'Bank Of Maharashtra',
  'Canara Bank',
  'Central Bank of India'
];

class PAddBankScreen extends StatefulWidget {
  const PAddBankScreen({Key? key}) : super(key: key);

  @override
  State<PAddBankScreen> createState() => _PAddBankScreenState();
}

class _PAddBankScreenState extends State<PAddBankScreen> {
  void _banksBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (BuildContext context) => const BanksBottomSheet());
  }

  void _selectAccountType() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => const AccountTypeBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        appBarText: '',
        imgPath: 'assets/images/iconbackappbarlarge.png',
        hasThreeDots: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 38.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fill Your Bank Details',
                style: kManRope_500_24_001314,
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Bank Name*',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 48.h,
                width: 1.sw,
                child: TextField(
                    style: kManRope_500_16_263238,
                    onTap: () {
                      _banksBottomSheet();
                    },
                    readOnly: true,
                    decoration: TextfieldDecoration(
                        label: "Select bank",
                        hintstyle: kManRope_500_16_263238,
                        child: Image.asset(
                          "assets/images/icondownlarge.png",
                          height: 48.h,
                          width: 48.h,
                        )).textfieldDecoration()),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'IFSC Code *',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 48.h,
                width: 1.sw,
                child: TextField(
                    style: kManRope_500_16_263238,
                    decoration: TextfieldDecoration(
                      label: "Type IFSC Code",
                    ).textfieldDecoration()),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Account No*',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 48.h,
                width: 1.sw,
                child: TextField(
                    style: kManRope_500_16_263238,
                    decoration: TextfieldDecoration(label: "Type Account NO")
                        .textfieldDecoration()),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Account Holder Name*',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 48.h,
                width: 1.sw,
                child: TextField(
                    style: kManRope_500_16_263238,
                    decoration: TextfieldDecoration(
                        label: "This field will filled automatically")
                        .textfieldDecoration()),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Branch name*',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 48.h,
                width: 1.sw,
                child: TextField(
                    style: kManRope_500_16_263238,
                    decoration: TextfieldDecoration(
                        label: "This field will filled automatically")
                        .textfieldDecoration()),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Account type*',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 48.h,
                width: 1.sw,
                child: TextField(
                    style: kManRope_500_16_263238,
                    onTap: () {
                      _selectAccountType();
                    },
                    readOnly: true,
                    decoration: TextfieldDecoration(
                      label: "Saving",
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
              Center(
                child: MainButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PAccountBankVerifyScreen()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 63.w, right: 63.w),
                      child: Text(
                        "Save",
                        style: kManRope_500_16_white,
                      ),
                    ),
                    color: k006D77,
                    shape: CustomDecoration().smallButtonDecoration()),
              ),
              SizedBox(
                height: 35.h,
              ),
              // Padding(
              //   padding: EdgeInsets.only(bottom: 35.h),
              //   child: Center(
              //     child: SizedBox(
              //       height: 56.h,
              //       width: 168.w,
              //       child: CustomActiveTextButton1(
              //           onPressed: () {
              //             Navigator.of(context).push(MaterialPageRoute(
              //                 builder: (context) => BankVerifyScreen()));
              //           },
              //           text: 'Save'),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class BanksBottomSheet extends StatefulWidget {
  const BanksBottomSheet({Key? key}) : super(key: key);

  @override
  State<BanksBottomSheet> createState() => _BanksBottomSheetState();
}

class _BanksBottomSheetState extends State<BanksBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // height: 800.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 71.h,
              decoration: const BoxDecoration(
                color: k006D77,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  'Select Bank',
                  style: kManRope_700_20_white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                height: 56.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: k5A72ED.withOpacity(0.24)),
                ),
                child: TextField(
                  style: kManRope_500_16_626A6A,
                  decoration: TextfieldDecoration(
                      label: 'Select Bank',
                      child: Image.asset(
                        "assets/images/searchicon.png",
                        height: 16,
                        width: 16,
                      )).searchFieldOutlineDecoration(),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 500.h,
              child: ListView.builder(
                itemCount: Banks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.h, left: 24.w),
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          color: Colors.transparent,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Text(
                                Banks[index],
                                style: kManRope_400_16_001314,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}

class AccountTypeBottomSheet extends StatefulWidget {
  const AccountTypeBottomSheet({Key? key}) : super(key: key);

  @override
  State<AccountTypeBottomSheet> createState() => _AccountTypeBottomSheetState();
}

class _AccountTypeBottomSheetState extends State<AccountTypeBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Account type',
                style: kManRope_700_16_white,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            // height: 136.h,
            padding: EdgeInsets.only(top: 20.h),
            // margin: EdgeInsets.only(
            //   // bottom: MediaQuery.of(context).viewInsets.bottom,
            // ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 0;
                    Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 101.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 0 ? k006D77 : Colors.white,
                    ),
                    child: Center(
                        child: Text(
                          'Current',
                          style: _gIndex == 0
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 1;
                    Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 101.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                        child: Text(
                          'Saving',
                          style: _gIndex == 1
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}