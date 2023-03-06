import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UChatSupport.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_faq_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_profile_models/user_faq_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

class UFaqScreen extends StatefulWidget {
  const UFaqScreen({Key? key}) : super(key: key);

  @override
  State<UFaqScreen> createState() => _UFaqScreenState();
}

class _UFaqScreenState extends State<UFaqScreen> {
  // bool dropdown = false;
  //bool dropdownContainer = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  bool isSelected = false;
  bool isLoading = false;

  UserFaqModel model = UserFaqModel();
  List<UserFaqModel> faqList = [];

  getData() {
    isLoading = true;
    final resp = UserFaqApi().get();
    resp.then((value) {
      //print(value);
      if (mounted) {
        setState(() {
          for (var v in value) {
            faqList.add(UserFaqModel.fromJson(v));
            //print(faqList);
          }
          _setBoolVal();
          isLoading = false;
        });
      }
    });
  }

  List<bool> boolList = [];
  _setBoolVal() {
    for (var v in faqList) {
      boolList.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: kEDF6F9,
          appBar: CustomWhiteAppBar(
            hasThreeDots: false,
            appBarText: 'FAQs',
            imgPath: 'assets/images/iconbackappbar2.png',
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Text(
                      'We are here to help you with anything and everything on Ataraxis',
                      style: kManRope_700_20_001314,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'At Ataraxis everything we expert at a day’s start is you, better and happier than yesterday. We have got you covered. Share your concern or check our frequently asked question listed below.',
                    style: kManRope_400_16_626A6A,
                  ),
                  SizedBox(height: 40.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for help',
                      hintStyle: kManRope_400_14_626A6A,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16.0)),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIconConstraints:
                          BoxConstraints(maxHeight: 55.h, maxWidth: 55.w),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: SizedBox(
                            height: 48,
                            width: 48,
                            // color: Colors.red,
                            child: Image.asset(
                              'assets/images/searchiconlarge.png',
                              height: 48.h,
                              width: 48.w,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    // height: 200,
                    child: ListView.builder(
                        itemCount: faqList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              SizedBox(
                                // color: Colors.red,
                                height: 48.h,
                                width: 380.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      faqList[index].ques.toString(),
                                      style: kManRope_500_16_001314,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          boolList[index] = !boolList[index];
                                        });
                                      },
                                      child: SizedBox(
                                        height: 48,
                                        width: 48,
                                        // color: Colors.red,
                                        child: Image.asset(
                                          'assets/images/icondownlarge.png',
                                          height: 48.h,
                                          width: 48.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn,
                                height: boolList[index] ? 100.h : 0,
                                width: 1.sw,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kFFFFFF,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Center(
                                    child: Text(
                                      faqList[index].ans.toString(),
                                      style: kManRope_400_16_626A6A,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                height: 1.h,
                                width: 380.w,
                                color: kD9D9D9,
                              ),
                            ],
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              // clipBehavior: Clip.hardEdge,
              height: 136.h,
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  Text(
                    'Still stuck? Help is a mail away',
                    style: kManRope_500_16_001314,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 56.h,
                    width: 1.sw,
                    child: MaterialButton(
                      elevation: 0,
                      color: k006D77,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: k006D77),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UChatSupport()));
                        // );
                      },
                      child: Text(
                        'Send a message',
                        style: kManRope_400_16_white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isLoading) LoadingWidget()
      ],
    );
  }
}
