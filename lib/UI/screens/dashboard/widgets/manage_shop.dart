import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/shop/widgets/contact/components/business_profile_form.dart';

class ManageShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Shop'),),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: BusinessProfileEditForm(),
      ),
    );
  }
}
