import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/dialog_utils.dart';
import 'package:thikana_ki/UI/commonWidget/tag/app_tag.dart';
import 'package:thikana_ki/UI/screens/shop/widgets/contact/components/open_close_time_editor.dart';

import 'edit_shop_widget.dart';

class ShopCurrentOpenCloseStatus extends StatelessWidget {
  final String currentStatus;
  final bool isEditor = true;

  const ShopCurrentOpenCloseStatus({@required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    if (currentStatus == 'Open') {
      return InkWell(
        onTap: () => isEditor
            ? editShopInfo(context: context, title: 'Select Open Close Time', child: _buildOpenCloseTimeForm())
            : null,
        child: Column(
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
        ),
      );
    }

    return InkWell(
      onTap: () => isEditor
          ? editShopInfo(context: context, title: 'Select Open Close Time', child: _buildOpenCloseTimeForm())
          : null,
      child: Column(
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
      ),
    );
  }



Widget  _buildOpenCloseTimeForm(){
    return SingleChildScrollView(child: ShopOpenCloseTimeEditor());
}


}
