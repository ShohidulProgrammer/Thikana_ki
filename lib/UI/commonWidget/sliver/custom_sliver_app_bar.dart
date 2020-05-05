import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/shop/widget_list/shop_page_header_actions.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

class CustomSliverAppBar extends StatelessWidget {
  final List<Widget> sliverAppBarList;
  final List<Widget> headerActionList;
  final bool pined;
  final bool floating;
  final double heightPart;

  const CustomSliverAppBar(
      {@required this.sliverAppBarList,
      this.headerActionList,
      this.heightPart: 1.56,
//      this.heightPart: 1.66,
      this.floating: false,
      this.pined: false});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: UIScreenSize.size.height / heightPart,
      floating: floating,
      pinned: pined,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: sliverAppBarList,
        ),
      ),
      actions: headerActionList,
    );
  }
}
