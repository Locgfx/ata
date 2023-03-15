import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/PAddBank.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/PWithdrawScreenSuccessful.dart';
import 'package:greymatter/Apis/DoctorApis/earning_apis/withdraw_apis/get_counselor_accounts_api.dart';
import 'package:greymatter/Apis/DoctorApis/earning_apis/withdraw_apis/send_withdraw_request_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/BottomSheets/AccountNoBottomSheet.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import '../../../../constants/fonts.dart';
import '../../../../model/PModels/home_models/earning_models/counselor_bank_details_model.dart';

class PWithDrawEarningsScreen2 extends StatefulWidget {
  final String currentBalance;
  const PWithDrawEarningsScreen2({Key? key, required this.currentBalance})
      : super(key: key);

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
        builder: (context) => AccountNumberBottomSheet(
              modelList: modelList,
              index: _index,
              onPop: (val, ind) {
                setState(() {
                  model = val;
                  _accNumberController.text = val.accountNumber.toString();
                  _index = ind;
                });
              },
            ));
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _accNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  int _index = -1;
  CounselorBankDetailsModel model = CounselorBankDetailsModel();
  List<CounselorBankDetailsModel> modelList = [];
  bool _isLoading = false;
  bool _btnLoading = false;
  _getData() {
    _isLoading = true;
    final resp = GerCounselorBankAccounts().get();
    resp.then((value) {
      setState(() {
        for (var v in value) {
          modelList.add(CounselorBankDetailsModel.fromJson(v));
        }
        _isLoading = false;
      });
    });
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
      body: _isLoading
          ? Center(
              child: LoadingWidget(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
                child: Form(
                  key: _key,
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
                              '₹${widget.currentBalance}',
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
                          // height: 56.h,
                          width: 182.w,
                          child: TextFormField(
                              controller: _amountController,
                              style: kManRope_500_16_626A6A,
                              validator: (val) {
                                if (_amountController.text.isEmpty) {
                                  return "This field is required";
                                } else {
                                  return null;
                                }
                              },
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
                        //height: 48.h,
                        child: TextFormField(
                            controller: _accNumberController,
                            onTap: () {
                              _selectAccountNumbers();
                            },
                            validator: (val) {
                              if (_accNumberController.text.isEmpty) {
                                return "This field is required";
                              } else {
                                return null;
                              }
                            },
                            readOnly: true,
                            decoration: TextfieldDecoration(
                              label: "Select account number",
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
                                    builder: (context) => PAddBankScreen(
                                          currentBalance: widget.currentBalance,
                                        )));
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
                      _btnLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: k006D77,
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(bottom: 120.h),
                              child: SizedBox(
                                height: 56.h,
                                width: 1.sw,
                                child: CustomActiveTextButton(
                                  onPressed: () {
                                    if (_key.currentState!.validate()) {
                                      setState(() {
                                        _btnLoading = true;
                                      });
                                      final resp = SendWithdrawRequest().get(
                                          amount:
                                              _amountController.text.toString(),
                                          bankId: model.bankId.toString());
                                      resp.then((value) {
                                        if (value['status'] == true) {
                                          setState(() {
                                            _btnLoading = false;
                                          });
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PWithdrawSuccessfulScreen(
                                                        currentBalance: value[
                                                            'current_balance'],
                                                      )));
                                        } else {
                                          setState(() {
                                            setState(() {
                                              _btnLoading = false;
                                            });
                                            Fluttertoast.showToast(
                                                msg: value['msg']);
                                          });
                                        }
                                      });
                                    }
                                  },
                                  text: 'Withdraw',
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
