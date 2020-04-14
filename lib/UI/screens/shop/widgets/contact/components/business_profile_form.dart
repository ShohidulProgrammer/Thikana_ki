import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoder/geocoder.dart';
import 'package:thikana_ki/cores/utils/location/current_location.dart';

import '../../../../../commonWidget/keyboard_input/normal_text_form_field.dart';
import 'open_close_time_editor.dart';

class BusinessProfileEditForm extends StatefulWidget {
  @override
  _BusinessProfileEditFormState createState() =>
      _BusinessProfileEditFormState();
}

class _BusinessProfileEditFormState extends State<BusinessProfileEditForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            normalTextFormField(labelText: 'Business Name'),
            normalTextFormField(labelText: 'Category'),
            normalTextFormField(
                labelText: 'Address',
                textController: _addressController,
                suffixIcon: Icons.location_searching,
                onPressedSuffixIcon: () => setCurrentAddress()),
            normalTextFormField(labelText: 'Phone'),
            normalTextFormField(labelText: 'Email'),
            normalTextFormField(labelText: 'WebSite'),
            normalTextFormField(labelText: 'Facebook Link'),
            normalTextFormField(labelText: 'linkdin Link'),
            normalTextFormField(labelText: 'twitter Link'),
            // open close time
            ShopOpenCloseTimeEditor(title: 'Choose Open & Close Time' ,),
            // description
            normalTextFormField(labelText: 'Description', keyboardType: TextInputType.multiline,)
          ],
        ),
      ),
    );
  }



  Future<void> setCurrentAddress() async {
    Address address = await LocationUtils.getCurrentLocation();
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      _addressController.text = address.addressLine;
    });
    print('\n\nMy Business Location: ${address.addressLine}');
  }
}
