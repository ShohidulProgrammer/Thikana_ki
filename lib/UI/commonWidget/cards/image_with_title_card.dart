import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/models/screen_models/icon_with_title_list.dart';
import 'package:thikana_ki/model/icon_with_title_model.dart';

class ImageWithTitleCard extends StatelessWidget {
  const ImageWithTitleCard({
    Key key,
    this.title,
    this.titleColor,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Color titleColor;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // final TextStyle textStyle = Theme.of(context).textTheme.display1;
    // bool darkMode = false;

    return Card(
      semanticContainer: true,
      elevation: 3,
      margin: EdgeInsets.all(5),
      color: backgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(icon, color: iconColor, size: 30),
//                  Image.network(
//                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTpjEka_FWyPfQBgiQg4QUDRZc1BeWqiNjurXPbnDc7vUMshkC9',
//                    // width: 300,
////                  height: 100,
//                    fit: BoxFit.contain,
//                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  title ?? '',
                  style: TextStyle(
                      fontSize: 14,
                      color: titleColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.blueGrey[50], width: 1),
      ),
    );
  }
}
