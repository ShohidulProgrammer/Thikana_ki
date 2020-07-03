import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/custom_text_form_field.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';
import 'package:thikana_ki/cores/configs/constants/app_text.dart';
import 'widgets/app_command_button.dart';
import 'widgets/app_logo.dart';

class OtpInputPage extends StatefulWidget {
  @override
  _OtpInputPageState createState() => _OtpInputPageState();
}

class _OtpInputPageState extends State<OtpInputPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppLogo(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
                  child: Form(
                    key: _formKey,
                    onChanged: () async {
                      await Future.delayed(Duration(milliseconds: 300));
                      setState(() {
                        _formKey.currentState.validate();
                      });
                    },
                    child: Column(
//                        mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CustomTextFormField(
                          hintText: Translate.of(context).translate(input_otp),
                          onSaved: (otp) => _otp = otp,
                        ),
                        AppButton(
                          text: Translate.of(context).translate(verify),
                          onPressed: () => _verifyOtp(_otp),
                          disableTouchWhenLoading: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AppCommandButton(
              btnText: Translate.of(context).translate(resend),
              route: signInPageRoute,
            ),
          ],
        ),
      ),
    );
  }

  _verifyOtp(String otp) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Otp: $otp');
    } else {
      print('Invalid form input');
    }
  }
}
