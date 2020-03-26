import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/genericUI/custom_tab_bar.dart';
import 'package:thikana_ki/UI/widgets/home/category_icon.dart';
import 'package:thikana_ki/UI/widgets/home/emergency_category.dart';
import 'package:thikana_ki/UI/widgets/home/home_emergency_category_item.dart';
import 'package:thikana_ki/UI/widgets/home/home_page_share_location.dart';
import 'package:thikana_ki/UI/widgets/home/thana.dart';
import '../../../UI/sharing_components/search_input_field.dart';
import '../../genericUI/GoogleMap.dart';

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
