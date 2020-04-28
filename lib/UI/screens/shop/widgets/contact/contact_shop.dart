import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/dialog_utils.dart';
import 'package:thikana_ki/UI/commonWidget/google_map/google_map.dart';
import 'package:thikana_ki/cores/api/local_file_api.dart';
import 'package:thikana_ki/cores/models/model_result_api.dart';
import 'package:thikana_ki/cores/models/screen_models/product_detail_page_model.dart';

import '../../shimmer/shop_info_shimmer.dart';
import 'components/business_profile_form.dart';
import 'components/shop_contact_address.dart';

class ContactShop extends StatefulWidget {
  @override
  _ContactShopState createState() => _ContactShopState();
}

class _ContactShopState extends State<ContactShop> {
  ProductDetailPageModel _detailPage;
  bool isEditor = true;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  ///Fetch API
  Future<void> _loadData() async {
    final ResultApiModel result = await LocalFileApi.getProductDetail();
    if (result.success) {
      setState(() {
        _detailPage = ProductDetailPageModel.fromJson(result.data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          isEditor
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppButton(
                    text: 'Edit Business Profile',
                    onPressed: () {
                      editBusinessProfile();
                    },
                    disableTouchWhenLoading: true,
                  ),
                )
              : Container(
                  color: Colors.purpleAccent,
                ),
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(2.0),
              children: <Widget>[
                Container(
                    child: Stack(
                  children: <Widget>[
                    MyGoogleMap(
                      heightPart: 2.8,
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      height: 40,
                      width: 40,
                      child: InkWell(
                        child: Card(
                          child: Icon(
                            Icons.directions,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: 5.0,
                ),
//        CustomSeparatorListFactory(),
                _buildShopContactAddress(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///Build shop contact address in details
  Widget _buildShopContactAddress() {
    if (_detailPage == null) {
//      return Center(child: CircularProgressIndicator());
      return ShopContactAddressShimmer();
    }

    return ShopContactAddress(
      detailPage: _detailPage,
    );
  }

  void editBusinessProfile() {
    DialogUtils.showCustomDialog(context,
        title: "Edit Business Profile",
        okBtnText: "Save",
        cancelBtnText: "Cancel",
        child: BusinessProfileEditForm(),
        /* call method in which you have write your logic and save process  */
        okBtnFunction: () => {});
  }
}
