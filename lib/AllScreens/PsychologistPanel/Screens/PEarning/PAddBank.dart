import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/PBankAccountVerifyScreen.dart';
import 'package:greymatter/Apis/DoctorApis/earning_apis/withdraw_apis/get_banks_api.dart';
import 'package:greymatter/Apis/DoctorApis/earning_apis/withdraw_apis/save_bank_details.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/model/PModels/home_models/earning_models/withdraw_models/banks_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
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
  final String currentBalance;
  const PAddBankScreen({Key? key, required this.currentBalance})
      : super(key: key);

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
        builder: (BuildContext context) => BanksBottomSheet(
              bankList: bankList,
              onPop: (bank) {
                _bankController.text = bank.name.toString();
                bankModel = bank;
              },
            ));
  }

  void _selectAccountType() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => AccountTypeBottomSheet(
              index: _index,
              onPop: (val) {
                setState(() {
                  _index = val;
                  if (val == 0) {
                    _accountTypeController.text = "Current";
                  } else {
                    _accountTypeController.text = "Savings";
                  }
                });
              },
            ));
  }

  @override
  void initState() {
    _accountTypeController.text = "Current";
    _getData();
    super.initState();
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _bankController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _holderNameController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _accountTypeController = TextEditingController();

  BanksModel bankModel = BanksModel();
  List<BanksModel> bankList = [];
  bool _banksLoading = false;
  bool _btnLoading = false;
  int _index = 0;

  _getData() {
    _banksLoading = true;
    final resp = GetBanksApi().get();
    resp.then((value) {
      setState(() {
        for (var v in value) {
          bankList.add(BanksModel.fromJson(v));
          _banksLoading = false;
        }
      });
    });
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
      body: _banksLoading
          ? Center(
              child: LoadingWidget(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 38.h),
                child: Form(
                  key: _key,
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
                        // height: 48.h,
                        width: 1.sw,
                        child: TextFormField(
                            controller: _bankController,
                            style: kManRope_500_16_263238,
                            onTap: () {
                              _banksBottomSheet();
                            },
                            readOnly: true,
                            validator: (val) {
                              if (_bankController.text.isEmpty) {
                                return "This field is required.";
                              } else {
                                return null;
                              }
                            },
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
                        // height: 48.h,
                        width: 1.sw,
                        child: TextFormField(
                            controller: _ifscController,
                            style: kManRope_500_16_263238,
                            validator: (val) {
                              if (_ifscController.text.isEmpty) {
                                return "This field is required.";
                              } else {
                                return null;
                              }
                            },
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
                        // height: 48.h,
                        width: 1.sw,
                        child: TextFormField(
                            controller: _accountNumberController,
                            style: kManRope_500_16_263238,
                            validator: (val) {
                              if (_accountNumberController.text.isEmpty) {
                                return "This field is required.";
                              } else {
                                return null;
                              }
                            },
                            decoration:
                                TextfieldDecoration(label: "Type Account NO")
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
                        // height: 48.h,
                        width: 1.sw,
                        child: TextFormField(
                            controller: _holderNameController,
                            style: kManRope_500_16_263238,
                            validator: (val) {
                              if (_holderNameController.text.isEmpty) {
                                return "This field is required.";
                              } else {
                                return null;
                              }
                            },
                            decoration: TextfieldDecoration(
                                    label: "Add account holder name")
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
                        //height: 48.h,
                        width: 1.sw,
                        child: TextFormField(
                            controller: _branchController,
                            style: kManRope_500_16_263238,
                            validator: (val) {
                              if (_branchController.text.isEmpty) {
                                return "This field is required.";
                              } else {
                                return null;
                              }
                            },
                            decoration: TextfieldDecoration(
                                    label: "Add your branch name")
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
                        // height: 48.h,
                        width: 1.sw,
                        child: TextFormField(
                            controller: _accountTypeController,
                            style: kManRope_500_16_263238,
                            validator: (val) {
                              if (_accountTypeController.text.isEmpty) {
                                return "This field is required.";
                              } else {
                                return null;
                              }
                            },
                            onTap: () {
                              _selectAccountType();
                            },
                            readOnly: true,
                            decoration: TextfieldDecoration(
                              label: "Select account type",
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
                        child: _btnLoading
                            ? CircularProgressIndicator(
                                color: k006D77,
                              )
                            : MainButton(
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    setState(() {
                                      _btnLoading = true;
                                    });
                                    final resp = SaveBankDetails().get(
                                        bankId: bankModel.id.toString(),
                                        ifsc: _ifscController.text.trim(),
                                        accNumber: _accountNumberController.text
                                            .trim(),
                                        holderName:
                                            _holderNameController.text.trim(),
                                        accType:
                                            _accountTypeController.text.trim(),
                                        branchName:
                                            _branchController.text.trim());
                                    resp.then((value) {
                                      if (value['status'] == 1) {
                                        setState(() {
                                          _btnLoading = false;
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PAccountBankVerifyScreen(
                                                    currentBalance:
                                                        widget.currentBalance,
                                                  )),
                                        );
                                      } else {
                                        setState(() {
                                          _btnLoading = false;
                                        });
                                        Fluttertoast.showToast(
                                            msg: value['msg']);
                                      }
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 15,
                                      bottom: 15,
                                      left: 63.w,
                                      right: 63.w),
                                  child: Text(
                                    "Save",
                                    style: kManRope_500_16_white,
                                  ),
                                ),
                                color: k006D77,
                                shape:
                                    CustomDecoration().smallButtonDecoration()),
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
            ),
    );
  }
}

class BanksBottomSheet extends StatefulWidget {
  final List<BanksModel> bankList;
  final Function(BanksModel) onPop;
  const BanksBottomSheet(
      {Key? key, required this.bankList, required this.onPop})
      : super(key: key);

  @override
  State<BanksBottomSheet> createState() => _BanksBottomSheetState();
}

class _BanksBottomSheetState extends State<BanksBottomSheet> {
  List<BanksModel> bankList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    bankList = widget.bankList;
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
                  controller: _searchController,
                  onChanged: (val) {
                    final suggestions = widget.bankList
                        .where((element) => element.name
                            .toString()
                            .toLowerCase()
                            .contains(val.toLowerCase()))
                        .toList();
                    setState(() {
                      bankList = suggestions;
                    });
                  },
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
                itemCount: bankList.length,
                itemBuilder: (context, index) {
                  final bank = bankList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      widget.onPop(bank);
                    },
                    child: Container(
                      color: Colors.transparent,
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
                                  bank.name.toString(),
                                  style: kManRope_400_16_001314,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
  final Function(int) onPop;
  final int index;
  const AccountTypeBottomSheet(
      {Key? key, required this.onPop, required this.index})
      : super(key: key);

  @override
  State<AccountTypeBottomSheet> createState() => _AccountTypeBottomSheetState();
}

class _AccountTypeBottomSheetState extends State<AccountTypeBottomSheet> {
  int _gIndex = 0;

  @override
  void initState() {
    _gIndex = widget.index;
    super.initState();
  }

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
                    widget.onPop(_gIndex);
                  }),
                  child: Container(
                    height: 44.h,
                    width: 101.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 0 ? k006D77 : Colors.transparent,
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
                    widget.onPop(_gIndex);
                  }),
                  child: Container(
                    height: 44.h,
                    width: 101.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 1 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      'Savings',
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
