import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/terms_and_conditions_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_profile_models/terms_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

class UTermsandConditions extends StatefulWidget {
  const UTermsandConditions({Key? key}) : super(key: key);

  @override
  State<UTermsandConditions> createState() => _UTermsandConditionsState();
}

class _UTermsandConditionsState extends State<UTermsandConditions> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  TermsModel model = TermsModel();
  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = TermsAndConditionsApi().get();
    resp.then((value) {
      if (value == false) {
      } else {
        setState(() {
          model = TermsModel.fromJson(value);
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        imgPath: 'assets/images/iconbackappbar2.png',
        appBarText: 'Terms and Conditions',
      ),
      body: _isLoading
          ? LoadingWidget()
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
                child: Column(
                  children: [
                    HtmlWidget(
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
