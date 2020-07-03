import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/about_us/about_us.dart';
import 'package:thikana_ki/UI/screens/admin/admin_panel.dart';
import 'package:thikana_ki/UI/screens/bottom_navigation/main_navigation.dart';

import 'package:thikana_ki/UI/screens/chat/chat.dart';
import 'package:thikana_ki/UI/screens/contact_us/contact_us.dart';
import 'package:thikana_ki/UI/screens/gallery/gallery.dart';
import 'package:thikana_ki/UI/screens/location/location.dart';
import 'package:thikana_ki/UI/screens/login/otp_input_page.dart';
import 'package:thikana_ki/UI/screens/login/password_reset.dart';
import 'package:thikana_ki/UI/screens/login/sign_in_page.dart';
import 'package:thikana_ki/UI/screens/login/sign_up_page.dart';
import 'package:thikana_ki/UI/screens/photo_preview/photo_preview.dart';
import 'package:thikana_ki/UI/screens/popular/emergency_categroy_iem_list_factory.dart';
import 'package:thikana_ki/UI/screens/screen.dart';
import 'package:thikana_ki/UI/screens/shop/shop_details.dart';
import 'package:thikana_ki/cores/configs/auth/user_role.dart';

import '../../../UI/screens/category/category.dart';
import '../../../UI/screens/list_product/list_product.dart';
import '../../../UI/screens/splash/splash_screen.dart';
import 'router_path_constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('${settings.name} was called');
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
//      case mainNavigationBottomPageRoute:
//        return MaterialPageRoute(builder: (_) => MainNavigationBottomNavBar());
      case mainNavigationRoute:
//      case '/Home':
        print('$mainNavigationRoute was called');

        return MaterialPageRoute(builder: (_) => MainNavigation());
//        return MaterialPageRoute(builder: (_) => MyNavHomePage());
//        return MaterialPageRoute(builder: (_) => MyCustomScaffold());
//        return MaterialPageRoute(builder: (_) => RootPage());
      case categoryPageRoute:
        return MaterialPageRoute(builder: (_) => Category());
      case adminPageRoute:
        return MaterialPageRoute(builder: (_) => AdminPanel());
      case shopProfilePageRoute:
        return MaterialPageRoute(builder: (_) => ShopDetails());
      case aboutUsPageRoute:
      case '/About Us':
        return MaterialPageRoute(builder: (_) => AboutUs());
      case manageShopPageRoute:
        return MaterialPageRoute(
            builder: (_) => ShopDetails(
                  userRoleType: USER_ROLE_TYPE.editor,
                ));

      case editProfilePageRoute:
//      case '/Edit Profile':
        return MaterialPageRoute(builder: (_) => EditProfile());
      case contactUsPageRoute:
        return MaterialPageRoute(builder: (_) => ContactUs());
      case chatPageRoute:
        final user = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => Chat(
            user: user,
          ),
        );

      case listProductPageRoute:
        final category = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => ListProduct(title: category),
        );

      case emergencyCategoryListFactoryPageRoute:
        final emergencyTitle = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => EmergencyCategoryListFactory(
              emergencyCategoryTitle: emergencyTitle),
        );
//      case changePasswordPageRoute:
//      case '/Change Password':
//        return MaterialPageRoute(builder: (_) => ChangePassword());
//      case settingPageRoute:
//        return MaterialPageRoute(builder: (context) => Setting());
//      case changeLanguagePageRoute:
//        return MaterialPageRoute(builder: (context) => LanguageSetting());
//      case themeSettingPageRoute:
//        return MaterialPageRoute(builder: (context) => ThemeSetting());
//      case fontSettingPageRoute:
//        return MaterialPageRoute(builder: (context) => FontSetting());
      case photoPreviewPageRoute:
        final Map<String, dynamic> params = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => PhotoPreview(
            galleryList: params['photo'],
            initialIndex: params['index'],
          ),
          fullscreenDialog: true,
        );

      case galleryPageRoute:
        final photo = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => Gallery(photo: photo),
          fullscreenDialog: true,
        );

      case locationPageRoute:
        final location = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => Location(
            location: location,
          ),
        );

      case signInPageRoute:
      case '/Edit Profile':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case signUpPageRoute:
//      case '/Edit Profile':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case resetPasswordPageRoute:
        return MaterialPageRoute(builder: (_) => ResetPasswordPage());
      case otpInputPageRoute:
        return MaterialPageRoute(builder: (_) => OtpInputPage());
//      case otpInputPageRoute:
//        User user = settings.arguments;
//        return MaterialPageRoute(builder: (_) => OTPInputPage(user: user));
//      case profilePageRoute:
//        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  ///Singleton factory
  static final Router _instance = Router._internal();

  factory Router() {
    return _instance;
  }

  Router._internal();
}
