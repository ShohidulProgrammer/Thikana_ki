import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/tag/app_tag.dart';

class ShopCurrentStatus extends StatelessWidget {
  final String currentStatus;

  const ShopCurrentStatus({@required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    if (currentStatus == 'Open') {
      return Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/open_icon.png'),
            height: 60.0,
            width: 60.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: AppTag(
              'Closed At : 11 pm',
              type: TagType.status,
            ),
          ),

        ],
      );
    }


    return Column(
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/closed_icon.png'),
          color: Colors.deepOrangeAccent,
          height: 65.0,
          width: 65.0,
        ),
        AppTag(
          'Open At : 11 pm',
          type: TagType.status,
        ),
      ],
    );
  }
}
