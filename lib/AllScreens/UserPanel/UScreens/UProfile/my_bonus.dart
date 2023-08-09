import 'package:flutter/material.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../../../constants/colors.dart';
import '../../UWidgets/UHomeWidgets/UOfferBanner.dart';

class MyBonusScreen extends StatelessWidget {
  const MyBonusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
          appBarText: "My Bonus",
          imgPath: "assets/images/iconbackappbar2.png",
          hasThreeDots: false),
      body: Column(
        children: [
          OfferBanner(),
        ],
      ),
    );
  }
}
