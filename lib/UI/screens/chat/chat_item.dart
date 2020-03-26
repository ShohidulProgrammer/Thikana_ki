import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/models/model_message.dart';
import 'receive_message.dart';
import 'send_message.dart';

class ChatItem extends StatelessWidget {
  final MessageModel item;

  ChatItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item.status == Status.sent) {
      return SendMessage(item: item);
    }

    return ReceiveMessage(item: item);
  }
}
