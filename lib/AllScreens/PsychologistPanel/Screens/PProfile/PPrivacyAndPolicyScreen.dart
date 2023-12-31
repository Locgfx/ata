import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_privacy_policy_api.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../model/UModels/user_profile_models/user_privacy_policy_model.dart';

class PPrivacyAndPolicyScreen extends StatefulWidget {
  const PPrivacyAndPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PPrivacyAndPolicyScreen> createState() =>
      _PPrivacyAndPolicyScreenState();
}

class _PPrivacyAndPolicyScreenState extends State<PPrivacyAndPolicyScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  bool _isLoading = false;
  UserPrivacyPolicyModel model = UserPrivacyPolicyModel();
  getData() {
    _isLoading = true;
    final resp = UserPrivacyPolicyApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        try {
          model = UserPrivacyPolicyModel.fromJson(value[0]);
          print(model.text);
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
        imgPath: 'assets/images/iconbackappbarlarge.png',
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
                  : Text(
                      model.text.toString(),
                      style: kManRope_400_14_626A6A,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
