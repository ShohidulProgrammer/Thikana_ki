import 'package:flutter/material.dart';

class ThanaName extends StatelessWidget {
  final String thana;

  const ThanaName({this.thana = 'Dhanmondi'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide( //                   <--- left side
              color: Colors.grey[400],
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(

                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.location_on,color: Colors.red,),
                    ),
                    Text(thana),
                  ],
                ),
              ),
              Text('Change location', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );

//      ListTile(
//      leading: Icon(Icons.location_on),
//      title: Text(thana),
//      trailing: Text('Change location'),
//    );
  }
}
