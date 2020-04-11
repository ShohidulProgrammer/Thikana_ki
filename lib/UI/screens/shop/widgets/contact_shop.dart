import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/dialog_utils.dart';
import 'package:thikana_ki/UI/commonWidget/google_map/google_map.dart';
import 'package:thikana_ki/UI/commonWidget/google_map/marker/GoogleMap.dart';
import 'package:thikana_ki/cores/api/local_file_api.dart';
import 'package:thikana_ki/cores/models/model_result_api.dart';
import 'package:thikana_ki/cores/models/screen_models/product_detail_page_model.dart';
import 'package:thikana_ki/cores/utils/location/current_location.dart';

import 'contact_info.dart';
import 'contact_info_shop_open_time.dart';
import 'shop_text_form_field.dart';
import 'social_contact.dart';

class ContactShop extends StatefulWidget {
  @override
  _ContactShopState createState() => _ContactShopState();
}

class _ContactShopState extends State<ContactShop> {
  ProductDetailPageModel _detailPage;
  final TextEditingController _addressController = new TextEditingController();

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

  bool isEditor = true;

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
              padding: EdgeInsets.all(2.0),
              children: <Widget>[
                Container(
                    child: Stack(
                  children: <Widget>[
                    AreaMap(
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
                _buildInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///Build info
  Widget _buildInfo() {
    if (_detailPage == null) {
      return Center(child: CircularProgressIndicator());

//      return Shimmer.fromColors(
//        baseColor: Theme.of(context).hoverColor,
//        highlightColor: Theme.of(context).highlightColor,
//        enabled: true,
//        child: Padding(
//          padding: EdgeInsets.only(left: 20, right: 20),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Container(
//                margin: EdgeInsets.only(
//                  bottom: 20,
//                  top: 20,
//                ),
//                height: 10,
//                width: 150,
//                color: Colors.white,
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Container(
//                        height: 10,
//                        width: 100,
//                        color: Colors.white,
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(top: 5),
//                      ),
//                      Container(
//                        height: 20,
//                        width: 150,
//                        color: Colors.white,
//                      ),
//                    ],
//                  ),
//                  Container(
//                    height: 10,
//                    width: 100,
//                    color: Colors.white,
//                  ),
//                ],
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 20),
//              ),
//              Row(
//                children: <Widget>[
//                  Container(
//                    width: 32,
//                    height: 32,
//                    decoration: BoxDecoration(
//                      shape: BoxShape.circle,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.only(left: 10, right: 10),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Container(
//                          height: 10,
//                          width: 100,
//                          color: Colors.white,
//                        ),
//                        Padding(
//                          padding: EdgeInsets.only(top: 3),
//                        ),
//                        Container(
//                          height: 10,
//                          width: 200,
//                          color: Colors.white,
//                        ),
//                      ],
//                    ),
//                  )
//                ],
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 20),
//              ),
//              Row(
//                children: <Widget>[
//                  Container(
//                    width: 32,
//                    height: 32,
//                    decoration: BoxDecoration(
//                      shape: BoxShape.circle,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.only(left: 10, right: 10),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Container(
//                          height: 10,
//                          width: 100,
//                          color: Colors.white,
//                        ),
//                        Padding(
//                          padding: EdgeInsets.only(top: 3),
//                        ),
//                        Container(
//                          height: 10,
//                          width: 200,
//                          color: Colors.white,
//                        ),
//                      ],
//                    ),
//                  )
//                ],
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 20),
//              ),
//              Row(
//                children: <Widget>[
//                  Container(
//                    width: 32,
//                    height: 32,
//                    decoration: BoxDecoration(
//                      shape: BoxShape.circle,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.only(left: 10, right: 10),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Container(
//                          height: 10,
//                          width: 100,
//                          color: Colors.white,
//                        ),
//                        Padding(
//                          padding: EdgeInsets.only(top: 3),
//                        ),
//                        Container(
//                          height: 10,
//                          width: 200,
//                          color: Colors.white,
//                        ),
//                      ],
//                    ),
//                  )
//                ],
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 20),
//              ),
//              Row(
//                children: <Widget>[
//                  Container(
//                    width: 32,
//                    height: 32,
//                    decoration: BoxDecoration(
//                      shape: BoxShape.circle,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.only(left: 10, right: 10),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Container(
//                          height: 10,
//                          width: 100,
//                          color: Colors.white,
//                        ),
//                        Padding(
//                          padding: EdgeInsets.only(top: 3),
//                        ),
//                        Container(
//                          height: 10,
//                          width: 200,
//                          color: Colors.white,
//                        ),
//                      ],
//                    ),
//                  )
//                ],
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 20),
//              ),
//              Row(
//                children: <Widget>[
//                  Container(
//                    width: 32,
//                    height: 32,
//                    decoration: BoxDecoration(
//                      shape: BoxShape.circle,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.only(left: 10, right: 10),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Container(
//                          height: 10,
//                          width: 100,
//                          color: Colors.white,
//                        ),
//                        Padding(
//                          padding: EdgeInsets.only(top: 3),
//                        ),
//                        Container(
//                          height: 10,
//                          width: 200,
//                          color: Colors.white,
//                        ),
//                      ],
//                    ),
//                  )
//                ],
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 25),
//                child: Container(height: 10, color: Colors.white),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 5),
//                child: Container(height: 10, color: Colors.white),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 5),
//                child: Container(height: 10, color: Colors.white),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 5),
//                child: Container(height: 10, color: Colors.white),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 5),
//                child: Container(height: 10, color: Colors.white),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 5),
//                child: Container(height: 10, color: Colors.white),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 5),
//                child: Container(height: 10, width: 50, color: Colors.white),
//              )
//            ],
//          ),
//        ),
//      );
    }

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // address
          ContactInfoItem(
            icon: Icons.location_on,
            label: 'address',
            title: _detailPage.address,
          ),
          // phone
          ContactInfoItem(
            icon: Icons.phone,
            label: 'phone',
            title: _detailPage.phone,
          ),
          // email
          ContactInfoItem(
            icon: Icons.email,
            label: 'email',
            title: _detailPage.email,
          ),
          // website
          ContactInfoItem(
            icon: Icons.language,
            label: 'website',
            title: _detailPage.website,
          ),
          // open time
          ContactInfoShopOpenTime(
            hour: _detailPage.hour,
            hourDetail: _detailPage.hourDetail,
          ),
          // social icons
          SocialContact(),
          // shop description
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Text(
            _detailPage.description,
//              overflow: TextOverflow.ellipsis,
//              maxLines: 15,
            style: Theme.of(context).textTheme.body2.copyWith(height: 1.3),
          ),

// shop established date and price range

//          Padding(
//            padding: EdgeInsets.only(top: 20, bottom: 20),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      Translate.of(context).translate('date_established'),
//                      style: Theme.of(context).textTheme.caption,
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 3),
//                      child: Text(
//                        _detailPage.date,
//                        style: Theme.of(context)
//                            .textTheme
//                            .subtitle
//                            .copyWith(fontWeight: FontWeight.w600),
//                      ),
//                    )
//                  ],
//                ),
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.end,
//                  children: <Widget>[
//                    Text(
//                      Translate.of(context).translate('price_range'),
//                      style: Theme.of(context).textTheme.caption,
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 3),
//                      child: Text(
//                        _detailPage.priceRange,
//                        style: Theme.of(context)
//                            .textTheme
//                            .subtitle
//                            .copyWith(fontWeight: FontWeight.w600),
//                      ),
//                    )
//                  ],
//                )
//              ],
//            ),
//          ),
        ],
      ),
    );
  }

  void editBusinessProfile() {
    DialogUtils.showCustomDialog(context,
        title: "Edit Business Profile",
        okBtnText: "Save",
        cancelBtnText: "Cancel",
        child: _buildEditBusinessProfileForm(),
        /* call method in which you have write your logic and save process  */
        okBtnFunction: () => {});
  }

  Widget _buildEditBusinessProfileForm() {
    final _formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            shopTextFormField(labelText: 'Business Name'),
            shopTextFormField(labelText: 'Category'),
            shopTextFormField(
                labelText: 'Address',
                textController: _addressController,
                suffixIcon: Icons.location_searching,
                onPressedSuffixIcon: () => loadLocation()),
            shopTextFormField(labelText: 'Phone'),
            shopTextFormField(labelText: 'Email'),
            shopTextFormField(labelText: 'WebSite'),
            shopTextFormField(labelText: 'Facebook Link'),
            shopTextFormField(labelText: 'linkdin Link'),
            shopTextFormField(labelText: 'twitter Link'),
            shopTextFormField(labelText: 'twitter Link'),
          ],
        ),
      ),
    );
  }

  Future<void> loadLocation() async {
    Address address = await LocationUtils.getCurrentLocation();
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      _addressController.text = address.addressLine;
    });
    print('\n\nMy Business Location: ${address.addressLine}');
  }
}
