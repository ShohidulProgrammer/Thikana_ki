import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/dialog_utils.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/search_input_field.dart';
import 'package:thikana_ki/UI/commonWidget/list/custom_sererator_list_factory.dart';

import 'components/add_product_form.dart';
import 'components/product_list_tile.dart';


class ProductsInShop extends StatefulWidget {
  @override
  _ProductsInShopState createState() => _ProductsInShopState();
}

class _ProductsInShopState extends State<ProductsInShop> {
  bool isEditor = true;
  File _image;
  bool _isImage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5.0,
      ),
      child: Column(
        children: <Widget>[
          isEditor
              ? Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 8.0),
                  child: AppButton(
                    text: 'Add New Product',
                    onPressed: () {
                      addProduct();
                    },
                    disableTouchWhenLoading: true,
                  ),
                )
              : Container(
                  color: Colors.purpleAccent,
                ),
          SearchInputField(
            hintText: 'search_product',
          ),
          Expanded(
            child: CustomSeparatorListFactory(
              child: ProductListTile(
                productName: 'Product Name',
                category: "Product Category",
                currentPrice: "50 /=",
                regularPrice: "60 /=",
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addProduct() {
    DialogUtils.showCustomDialog(context,
        title: "New Product",
        okBtnText: "Add",
        cancelBtnText: "Cancel",
        child: AddProductForm(),
        /* call method in which you have write your logic and save process  */
        okBtnFunction: () => {});
  }


}

//Widget _buildForm() {
//  return Column(
//    mainAxisSize: MainAxisSize.min,
//    children: <Widget>[
//      // text input
//      shopTextFormField(labelText: "Product Name *", hintText: 'Lux'),
//      shopTextFormField(labelText: "Category Name*", hintText: 'Soap'),
//      shopTextFormField(labelText: "Current Price*", hintText: '25'),
//      shopTextFormField(labelText: "Regular Price", hintText: '30'),
//      shopTextFormField(labelText: "Product Details", hintText: 'Soap'),
//      shopTextFormField(labelText: "Keywords", hintText: 'myTag'),
//    ],
//  );
//}
//
//
//Widget _buildImage() {
//  return Column(
//    children: <Widget>[
//      InkWell(
//        child: _image == null
//            ? new Image.asset(
//          'assets/images/img_placeholder.jpg',
//          height: 200.0,
//          width: 400.0,
//          fit: BoxFit.fill,
//        )
//            : new Image.file(
//          _image,
//          height: 200.0,
//          width: 400.0,
//        ),
//        onTap: () {
//          // getImageFromCamera();
//          _isImage = true;
//        },
//      ),
//      FloatingActionButton(
//        onPressed: () => Text('Image picker disabled'),
//        //getImage,
//        tooltip: 'Pick Image',
//        child: Icon(Icons.add_a_photo),
//      ),
//    ],
//  );
//}



//Widget _buildAddProductForm() {
//  return Container(
//    height: 250,
//    child: SingleChildScrollView(
//        child: Form(
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              _buildImage(),
//              // text input
//              _buildForm(),
//            ],
//          ),
//        )),
//  );
//}