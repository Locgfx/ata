import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class AppleSigninButton extends StatefulWidget {
  const AppleSigninButton({Key? key}) : super(key: key);

  @override
  State<AppleSigninButton> createState() => _AppleSigninButtonState();
}

class _AppleSigninButtonState extends State<AppleSigninButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );
        print(credential);
        print(credential.identityToken);
        print(credential.authorizationCode);
        print(credential.userIdentifier);
        print(credential.email);
        print(credential.familyName);
        print(credential.givenName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
            border: Border.all(color: kB5BABA),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/icons8-apple-logo-50 1.png',
                width: 18.w, height: 18.h),
            SizedBox(width: 8.w),
            Text(
              'Continue with Apple',
              style: kManRope_500_16_626A6A,
            )
          ],
        ),
      ),
    );
  }
}
