import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/custom_text_input_field.dart';
import '../../../cores/utils/import_utility_path.dart';


class ContactUs extends StatefulWidget {
  @override
  ContactUsState createState() => ContactUsState();
}

class ContactUsState extends State<ContactUs> {
  final _initPosition = CameraPosition(
    target: LatLng(23.7548937, 90.3758296),
    zoom: 14.4746,
  );

  final _textNameController = TextEditingController();
  final _textEmailController = TextEditingController();
  final _textInfoController = TextEditingController();
  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusInfo = FocusNode();

  String _validName;
  String _validEmail;
  String _validInfo;

  @override
  void initState() {
    _textNameController.text = 'Shohidul Islam';
    _textEmailController.text = 'bksoftit@gmail.com';
    super.initState();
  }

  ///On send
  Future<void> _send() async {
    InputFocusChanger.hiddenKeyboard(context);
    setState(() {
      _validName = UtilValidator.validate(
        data: _textNameController.text,
      );
      _validEmail = UtilValidator.validate(
        data: _textEmailController.text,
        type: ValidationType.email,
      );
      _validInfo = UtilValidator.validate(
        data: _textInfoController.text,
      );
    });
    if (_validName == null && _validEmail == null && _validInfo == null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Translate.of(context).translate('contact_us')),
        actions: <Widget>[
          FlatButton(
            child: Text(
              Translate.of(context).translate('send'),
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.white),
            ),
            onPressed: _send,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 250,
                        child: GoogleMap(
                          initialCameraPosition: _initPosition,
                          myLocationEnabled: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          Translate.of(context).translate('name'),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      CustomTextInputField(
                        hintText: Translate.of(context).translate('input_name'),
                        errorText: _validName != null
                            ? Translate.of(context).translate(_validName)
                            : null,
                        focusNode: _focusName,
                        textInputAction: TextInputAction.next,
                        onTapIcon: () async {
                          await Future.delayed(Duration(milliseconds: 100));
                          _textNameController.clear();
                        },
                        onSubmitted: (text) {
                          InputFocusChanger.fieldFocusChange(
                              context, _focusName, _focusEmail);
                        },
                        onChanged: (text) {
                          setState(() {
                            _validName = UtilValidator.validate(
                              data: _textNameController.text,
                            );
                          });
                        },
                        suffixIcon: Icon(Icons.clear),
                        controller: _textNameController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          Translate.of(context).translate('email'),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      CustomTextInputField(
                        hintText: Translate.of(context).translate(
                          'input_email',
                        ),
                        errorText: _validEmail != null
                            ? Translate.of(context).translate(_validEmail)
                            : null,
                        focusNode: _focusEmail,
                        textInputAction: TextInputAction.next,
                        onTapIcon: () async {
                          await Future.delayed(Duration(milliseconds: 100));
                          _textEmailController.clear();
                        },
                        onSubmitted: (text) {
                          InputFocusChanger.fieldFocusChange(
                              context, _focusEmail, _focusInfo);
                        },
                        onChanged: (text) {
                          setState(() {
                            _validEmail = UtilValidator.validate(
                              data: _textEmailController.text,
                              type: ValidationType.email,
                            );
                          });
                        },
                        suffixIcon: Icon(Icons.clear),
                        controller: _textEmailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          Translate.of(context).translate('information'),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      CustomTextInputField(
                        hintText: Translate.of(context).translate(
                          'input_information',
                        ),
                        errorText: _validInfo != null
                            ? Translate.of(context).translate(_validInfo)
                            : null,
                        focusNode: _focusInfo,
                        maxLines: 5,
                        onTapIcon: () async {
                          await Future.delayed(Duration(milliseconds: 100));
                          _textInfoController.clear();
                        },
                        onSubmitted: (text) {
                          _send();
                        },
                        onChanged: (text) {
                          setState(() {
                            _validInfo = UtilValidator.validate(
                              data: _textInfoController.text,
                              type: ValidationType.email,
                            );
                          });
                        },
                        suffixIcon: Icon(Icons.clear),
                        controller: _textInfoController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
