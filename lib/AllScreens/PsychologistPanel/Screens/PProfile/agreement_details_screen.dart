import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_agreement_api.dart';
import 'package:greymatter/model/UModels/user_profile_models/user_agreement_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class AgreementDetails extends StatefulWidget {
  const AgreementDetails({Key? key}) : super(key: key);

  @override
  State<AgreementDetails> createState() => _AgreementDetailsState();
}

class _AgreementDetailsState extends State<AgreementDetails> {
  UserAgreementModel model = UserAgreementModel();
  @override
  void initState() {
    getData();
    super.initState();
  }

  bool _isLoading = false;

  getData() {
    _isLoading = true;
    final resp = UserAgreementApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        try {
          model = UserAgreementModel.fromJson(value[0]);
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
      appBar: CuswhiteAppBar(
        hasThreeDots: false,
        imgPath: 'assets/images/iconbackappbarlarge.png',
        appBarText: 'Agreement',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: Column(
          children: [
            _isLoading ? SpinKitThreeBounce(
              color: k006D77,
              size: 20,
            ):
            Text(model.text.toString(),

              style: kManRope_400_14_626A6A,
            ),
          ],
        ),
      ),
    );
  }
}
