import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      color: Colors.white.withOpacity(0.6),
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/images/loader.gif',
                width: 200.w,
                height: 200.h,
                //color: k006D77,
              ),
            )
          ],
        ),
      ),
    );
  }
}
