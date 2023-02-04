import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/constants/colors.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      color: Color.fromARGB(100, 22, 44, 33),
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  // color: Color.fromARGB(100, 22, 44, 33),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SpinKitDancingSquare(
              size: 60,
              color: k006D77,
            ),

          ],
        ),
      ),
    );
  }
}
