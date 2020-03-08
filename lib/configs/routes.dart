import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '../screens/screen.dart';

class Routes {
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String forgotPassword = "/forgotPassword";
  static const String productDetail = "/productDetail";
  static const String searchHistory = "/searchHistory";
  static const String category = "/category";
  static const String editProfile = "/editProfile";
  static const String changePassword = "/changePassword";
  static const String changeLanguage = "/changeLanguage";
  static const String contactUs = "/contactUs";
  static const String chat = "/chat";
  static const String aboutUs = "/aboutUs";
  static const String gallery = "/gallery";
  static const String photoPreview = "/photoPreview";
  static const String themeSetting = "/themeSetting";
  static const String listProduct = "/listProduct";
  static const String filter = "/filter";
  static const String review = "/review";
  static const String writeReview = "/writeReview";
  static const String location = "/location";
  static const String setting = "/setting";
  static const String fontSetting = "/fontSetting";
  static const String chooseLocation = "/chooseLocation";

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
//      case signIn:
//        return MaterialPageRoute(builder: (context) => SignIn());
//
//      case signUp:
//        return MaterialPageRoute(builder: (context) => SignUp());
//
//      case forgotPassword:
//        return MaterialPageRoute(builder: (context) => ForgotPassword());
//
//      case productDetail:
//        return MaterialPageRoute(builder: (context) => ProductDetail());
//
//      case searchHistory:
//        return MaterialPageRoute(
//          builder: (context) => SearchHistory(),
//          fullscreenDialog: true,
//        );
//
//      case category:
//        return MaterialPageRoute(builder: (context) => Category());
////
//      case chat:
//        final user = settings.arguments;
//        return MaterialPageRoute(
//          builder: (context) => Chat(
//            user: user,
//          ),
//        );

//      case editProfile:
//        return MaterialPageRoute(builder: (context) => EditProfile());
//
//      case changePassword:
//        return MaterialPageRoute(builder: (context) => ChangePassword());

//      case changeLanguage:
//        return MaterialPageRoute(builder: (context) => LanguageSetting());
//
//      case contactUs:
//        return MaterialPageRoute(builder: (context) => ContactUs());
//
//      case aboutUs:
//        return MaterialPageRoute(builder: (context) => AboutUs());
//
//      case themeSetting:
//        return MaterialPageRoute(builder: (context) => ThemeSetting());
//
//      case filter:
//        return MaterialPageRoute(
//          builder: (context) => Filter(),
//          fullscreenDialog: true,
//        );
//
//      case review:
//        return MaterialPageRoute(builder: (context) => Review());
//
//      case setting:
//        return MaterialPageRoute(builder: (context) => Setting());
//
//      case fontSetting:
//        return MaterialPageRoute(builder: (context) => FontSetting());
//
//      case writeReview:
//        final author = settings.arguments;
//        return MaterialPageRoute(
//          builder: (context) => WriteReview(
//            author: author,
//          ),
//        );
//
//      case location:
//        final location = settings.arguments;
//        return MaterialPageRoute(
//          builder: (context) => Location(
//            location: location,
//          ),
//        );
//
//      case listProduct:
//        final category = settings.arguments;
//        return MaterialPageRoute(
//          builder: (context) => ListProduct(title: category),
//        );
//
//      case gallery:
//        final photo = settings.arguments;
//        return MaterialPageRoute(
//          builder: (context) => Gallery(photo: photo),
//          fullscreenDialog: true,
//        );
//
//      case photoPreview:
//        final Map<String, dynamic> params = settings.arguments;
//        return MaterialPageRoute(
//          builder: (context) => PhotoPreview(
//            galleryList: params['photo'],
//            initialIndex: params['index'],
//          ),
//          fullscreenDialog: true,
//        );
//
//      case chooseLocation:
//        final location = settings.arguments;
//        return MaterialPageRoute(
//          builder: (context) => ChooseLocation(location: location),
//        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No path for ${settings.name}'),
            ),
          ),
        );
    }
  }

  ///Singleton factory
  static final Routes _instance = Routes._internal();

  factory Routes() {
    return _instance;
  }

  Routes._internal();
}
