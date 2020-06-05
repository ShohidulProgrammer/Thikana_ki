import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:thikana_ki/cores/utils/location/current_location.dart';

class ThanaName extends StatefulWidget {
  @override
  _ThanaNameState createState() => _ThanaNameState();
}

class _ThanaNameState extends State<ThanaName> {
  String thana = 'Thana';

  @override
  void initState() {
    getTanaName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Icon(
          Icons.location_on,
          color: Colors.red,
        ),
        title: Align(
          child: Text('$thana'),
          alignment: Alignment(-1.5, 0),
        ),
        trailing: Text('Change location', style: TextStyle(color: Colors.red)),
      ),
      onTap: changeLocation,
    );
  }

  Future<void> getTanaName() async {
    Address address = await LocationUtils.getCurrentLocation();
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      thana = address.subLocality;
    });
    print('\n\nMy Current Location: ${address.addressLine}');
  }

  changeLocation() {
    // Todo: change location
    // add dropdown for:
    // Division name, thana name
    // select thana name from dropdown

    print('change location');
  }
}
