import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../data_list/shop_details/shop_images.dart';

///Build banner UI
class CarouselBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (shopImages == null) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        enabled: true,
        child: Container(
          color: Colors.white,
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height /3,
//          200.0,
          width: MediaQuery.of(context).size.width,
          child: Carousel(
            boxFit: BoxFit.cover,
            autoplay: true,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 500),
            dotSize: 2.0,
            dotIncreasedColor: Color(0xFFFF335C),
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.bottomCenter,
            dotVerticalPadding: 5.0,
            showIndicator: true,
            indicatorBgPadding: 5.0,
            images: shopImages.map((url) => NetworkImage(url)).toList(),
          ),
        ),
      ),
    );
  }
}
