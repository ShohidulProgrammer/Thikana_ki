import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/models/screen_models/icon_with_title_list.dart';

class ImageWithTitleCard extends StatelessWidget {
  const ImageWithTitleCard({Key key, this.iconWithTitleModel}) : super(key: key);
  final IconWithTitleModel iconWithTitleModel;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    return Card(
      semanticContainer: true,

      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.of(context).pushNamed(shopProfilePageRoute);
        },
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    iconWithTitleModel.icon,
                    color: iconWithTitleModel.color,
                  ),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    iconWithTitleModel.title,
//                  style: textStyle
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
//        elevation: 5,
//        margin: EdgeInsets.all(5),
    );
  }
}
