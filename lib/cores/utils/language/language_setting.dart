import 'package:flutter/material.dart';

class AppLanguageSetting {
  ///Default Language
  static Locale defaultLanguage = Locale("en");

  ///List Language support in Application
  static List<Locale> supportLanguage = [
    Locale("en"),
    Locale("bn"),
    Locale("vi"),
    Locale("ar"),
    Locale("zh"),
    Locale("ko"),
    Locale("ja")
  ];

  ///Singleton factory
  static final AppLanguageSetting _instance = AppLanguageSetting._internal();

  factory AppLanguageSetting() {
    return _instance;
  }

  AppLanguageSetting._internal();
}
