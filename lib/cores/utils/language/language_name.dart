import 'language_setting.dart';

class UtilLanguageName {
  ///Get Language Global Language Name
  static String getGlobalLanguageName(String code) {
    switch (code) {
      case "vi":
        return "Vietnamses";
      case "bn":
        return "Bengali Bangla";
      case "en":
        return "English";
      case "ar":
        return "Arabic";
      case "zh":
        return "Chinese";
      case "ko":
        return "Korean";
      case "ja":
        return "Japanese";
      default:
        return "Country code not found";
    }
  }

  static bool isRTL() {
    switch (AppLanguageSetting.defaultLanguage.languageCode) {
      case "ar":
        return true;
      default:
        return false;
    }
  }

  ///Singleton factory
  static final UtilLanguageName _instance = UtilLanguageName._internal();

  factory UtilLanguageName() {
    return _instance;
  }

  UtilLanguageName._internal();
}
