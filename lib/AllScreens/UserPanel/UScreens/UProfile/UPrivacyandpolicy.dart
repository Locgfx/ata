import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_privacy_policy_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_profile_models/user_privacy_policy_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class UPrivacyandPolicy extends StatefulWidget {
  const UPrivacyandPolicy({Key? key}) : super(key: key);

  @override
  State<UPrivacyandPolicy> createState() => _UPrivacyandPolicyState();
}

class _UPrivacyandPolicyState extends State<UPrivacyandPolicy> {
  UserPrivacyPolicyModel model = UserPrivacyPolicyModel();
  @override
  void initState() {
    getData();
    super.initState();
  }

  bool _isLoading = false;

  getData() {
    _isLoading = true;
    final resp = UserPrivacyPolicyApi().get();
    resp.then((value) {
      //print(value);
      setState(() {
        try {
          model = UserPrivacyPolicyModel.fromJson(value[0]);
          //print(model.text);
          _isLoading = false;
        } catch (e) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        imgPath: 'assets/images/iconbackappbar2.png',
        appBarText: 'Privacy and Policy',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            children: [
              _isLoading
                  ? SpinKitThreeBounce(
                      color: k006D77,
                      size: 20,
                    )
                  : HtmlWidget(
                      model.text.toString(),
                      textStyle: kManRope_400_14_626A6A,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
