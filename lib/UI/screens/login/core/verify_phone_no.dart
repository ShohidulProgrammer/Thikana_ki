// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// /// method to verify phone number and handle phone auth
//   verifyPhoneNumber(BuildContext context) async {
//     String phoneNumber = "+1" + phoneNumController.text.toString();
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     await _auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         timeout: Duration(seconds: 5),
//         verificationCompleted: (authCredential) => _verificationComplete(authCredential, context),
//         verificationFailed: (authException) => _verificationFailed(authException, context),
//         codeAutoRetrievalTimeout: (verificationId) => _codeAutoRetrievalTimeout(verificationId),
//         // called when the SMS code is sent
//         codeSent: (verificationId, [code]) => _smsCodeSent(verificationId, [code]));
//   }

//   /// will get an AuthCredential object that will help with logging into Firebase.
//   _verificationComplete(AuthCredential authCredential, BuildContext context) {
//     FirebaseAuth.instance.signInWithCredential(authCredential).then((authResult) {
//       final snackBar = SnackBar(content: Text("Success!!! UUID is: " + authResult.user.uid));
//       Scaffold.of(context).showSnackBar(snackBar);
//     });
//   }

//   _smsCodeSent(String verificationId, List<int> code) {
//     // set the verification code so that we can use it to log the user in
//     _smsVerificationCode = verificationId;
//   }

//   _verificationFailed(AuthException authException, BuildContext context) {
//     final snackBar = SnackBar(content: Text("Exception!! message:" + authException.message.toString()));
//     Scaffold.of(context).showSnackBar(snackBar);
//   }

//   _codeAutoRetrievalTimeout(String verificationId) {
//     // set the verification code so that we can use it to log the user in
//     _smsVerificationCode = verificationId;
//   }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/admin/admin_panel.dart';

class FirebasePhoneAuth {
  String _smsSent, _verificationId;

  Future<void> verifyPhone(BuildContext context, String phoneNo) async {
    final PhoneCodeAutoRetrievalTimeout _autoRetrieve = (String verId) {
      this._verificationId = verId;
    };
    final PhoneCodeSent _smsCodeSent = (String verId, [int forceCodeResend]) {
      this._verificationId = verId;
      smsCodeDialoge(context).then((value) {
        print("Code Sent");
      });
    };
    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth) {};
    final PhoneVerificationFailed verifyFailed = (AuthException e) {
      print('${e.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: _smsCodeSent,
      codeAutoRetrievalTimeout: _autoRetrieve,
    );
  }

  Future<bool> smsCodeDialoge(BuildContext context) {
    return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text('Provide OTP'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              this._smsSent = value;
            },
          ),
          contentPadding: EdgeInsets.all(10.0),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminPanel()),
                      );
                    } else {
                      Navigator.of(context).pop();
                      signIn(_smsSent);
                    }
                  });
                },
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        );
      },
    );
  }

  Future<void> signIn(String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      print('sign in coplete');

      // Navigator.of(context).pushReplacementNamed('/loginpage');
    }).catchError((e) {
      print(e);
    });
  }

  otpSubmit(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((user) {
      if (user != null) {
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminPanel()),
        );
      } else {
        Navigator.of(context).pop();
        signIn(_smsSent);
      }
    });
  }
}

FirebasePhoneAuth firebasePhoneAuth = new FirebasePhoneAuth();
