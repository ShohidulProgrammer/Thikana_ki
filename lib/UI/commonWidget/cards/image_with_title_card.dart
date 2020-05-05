import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/models/screen_models/icon_with_title_list.dart';

class ImageWithTitleCard extends StatelessWidget {
  const ImageWithTitleCard({Key key, this.iconWithTitleModel})
      : super(key: key);
  final IconWithTitleModel iconWithTitleModel;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    bool darkMode = false;

    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.pushNamed(context, listProductPageRoute,
              arguments: 'Category Name');
        },
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(iconWithTitleModel.icon,
                      color: iconWithTitleModel.color, size: 30),
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
                  iconWithTitleModel.title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
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
      elevation: 3,
      margin: EdgeInsets.all(5),
    );
  }
}
