import 'dart:async';
import 'package:thikana_ki/cores/models/model_result_api.dart';
import 'package:thikana_ki/cores/utils/import_utility_path.dart';

import 'http_manager.dart';

class Api {
  ///URL API
  static const String AUTH_LOGIN = "/jwt-auth/v1/token";
  static const String AUTH_VALIDATE = "/jwt-auth/v1/token/validate";
  static const String GET_SETTING = "/listar/v1/setting/init";

  ///Login api
  static Future<dynamic> login({String username, String password}) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/login.json");
    return ResultApiModel.fromJson(result);
  }

  ///Validate token valid
  static Future<dynamic> validateToken() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/valid_token.json");
    return ResultApiModel.fromJson(result);
  }

  ///Forgot password
  static Future<dynamic> forgotPassword() async {
    return await httpManager.post(url: "");
  }

  ///Get Setting
  static Future<dynamic> getSetting() async {
    final result = await httpManager.get(url: GET_SETTING);
    return ResultApiModel.fromJson(result);
  }

  ///Get Profile Detail
  static Future<dynamic> getProfile() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/profile.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get About Us
  static Future<dynamic> getAboutUs() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/about_us.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Category
  static Future<dynamic> getCategory() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/category.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Home
  static Future<dynamic> getHome() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/home.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Messages
  static Future<dynamic> getMessage() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/message.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Detail Messages
  static Future<dynamic> getDetailMessage() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/message_detail.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Notification
  static Future<dynamic> getNotification() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/notification.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get ProductDetail
  static Future<dynamic> getProductDetail() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/product_detail.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get History Search
  static Future<dynamic> getHistorySearch() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/search_history.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Wish List
  static Future<dynamic> getWishList() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/wishlist.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Location List
  static Future<dynamic> getLocationList() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/location.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Product List
  static Future<dynamic> getProduct() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/product_list.json");
    return ResultApiModel.fromJson(result);
  }

  ///Get Review
  static Future<dynamic> getReview() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await UtilLoadLocalFile.loadJson("assets/data/review.json");
    return ResultApiModel.fromJson(result);
  }

  ///Singleton factory
  static final Api _instance = Api._internal();

  factory Api() {
    return _instance;
  }

  Api._internal();
}
