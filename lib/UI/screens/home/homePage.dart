import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/custom_tab_bar.dart';
import 'package:thikana_ki/UI/screens/home/widgets/category_icon.dart';
import 'package:thikana_ki/UI/screens/home/widgets/home_page_share_location.dart';
import '../../commonWidget/search_input_field.dart';
import '../../commonWidget/GoogleMap.dart';
import 'widgets/thana.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double googleMapHeight = screenHeight / 3;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              MyGoogleMap(
                height: googleMapHeight,
              ),
              HomePageShareLocation()
            ],
          ),
          SearchInputField(),
          ThanaName(),
          EmergencyCategoryIcons(),
          CustomTabBar(),
        ],
      )
    );
  }
}
