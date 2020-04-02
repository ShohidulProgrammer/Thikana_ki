import 'package:flutter/cupertino.dart';
import '../../../cores/configs/router/router_path_constants.dart';
import '../../../cores/models/screen_models/screen_models.dart';
import 'app_card.dart';

///Build category UI
class CategoryImageCardFactory extends StatelessWidget {
  final HomePageModel homePageModel;

  const CategoryImageCardFactory({this.homePageModel});

  @override
  Widget build(BuildContext context) {
    if (homePageModel?.popular == null) {
      return ListView(
        padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
        scrollDirection: Axis.horizontal,
        children: List.generate(8, (index) => index).map(
          (item) {
            return Padding(
              padding: EdgeInsets.only(left: 15),
              child: SizedBox(
                width: 135,
                height: 160,
                child: AppCard(), // type: CardType.basic
              ),
            );
          },
        ).toList(),
      );
    }

    return ListView(
      padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
      scrollDirection: Axis.horizontal,
      children: homePageModel.popular.map(
        (item) {
          return Padding(
            padding: EdgeInsets.only(left: 15),
            child: SizedBox(
              width: 135,
              height: 160,
              child: AppCard(
                onPressed: () {
                  Navigator.pushNamed(
                      context, emergencyCategoryListFactoryPageRoute);
                },
                text: item.title,
                numberOfLocation: item.totalItem,
                image: item.image,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
