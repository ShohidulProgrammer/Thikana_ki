import 'package:firebase_auth/firebase_auth.dart';
import 'package:thikana_ki/UI/screens/login/widgets/gorgiusLogin/ui/sign_in.dart';

Future<Null> ensureLoggedIn() async {
  final auth = FirebaseAuth.instance;
  FirebaseUser user = auth.currentUser() as FirebaseUser;
  if (user == null) {
    SignIn();
  }

  // analytics.logLogin();

  // GoogleSignInAccount user = googleSignIn.currentUser;
  // if (user == null) user = await googleSignIn.signInSilently();
  // if (user == null) {
  //   user = await googleSignIn.signIn();

  // if (await auth.currentUser() == null) {
  //   GoogleSignInAuthentication credentials =
  //       await googleSignIn.currentUser.authentication;
  //   await auth.signInWithGoogle(
  //     idToken: credentials.idToken,
  //     accessToken: credentials.accessToken,
  //   );
  // }
}