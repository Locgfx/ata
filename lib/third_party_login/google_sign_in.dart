import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInClass {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // GoogleSignInAccount? _user;

  Future logOut() => _googleSignIn.disconnect();

  Future<GoogleSignInAuthentication> login() async {
    GoogleSignInAuthentication auth;
    GoogleSignInAccount? account = await _googleSignIn.signIn();
    if (account == null) {
      throw Exception();
    } else {
      auth = await account.authentication;
    }
    return auth;
  }

  //GoogleSignInAccount get user => _user!;

  // Future<UserCredential> googleLogin() async {
  //   final googleUSer = await _googleSignIn.signIn();
  //   if (googleUSer == null) {
  //     throw Exception();
  //   }
  //   _user = googleUSer;
  //
  //   final googleAuth = await googleUSer.authentication;
  //
  //   final cred = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //
  //   final retVal = await FirebaseAuth.instance.signInWithCredential(cred);
  //   return retVal;
  // }
}
