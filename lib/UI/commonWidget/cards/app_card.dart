import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppCard extends StatelessWidget {
  AppCard({
    Key key,
    this.text,
    this.numberOfLocation,
    this.image,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final int numberOfLocation;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        enabled: true,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '$numberOfLocation $text',
                  style: Theme.of(context).textTheme.subtitle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
