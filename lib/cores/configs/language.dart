import 'package:flutter/material.dart';

class AppLanguage {
  ///Default Language
  static Locale defaultLanguage = Locale("en");

  ///List Language support in Application
  static List<Locale> supportLanguage = [
    Locale("en"),
//    Locale("bn"), = ja
    Locale("vi"),
    Locale("ar"),
    Locale("zh"),
    Locale("ko"),
    Locale("ja") // == ja_japanies
  ];

  ///Singleton factory
  static final AppLanguage _instance = AppLanguage._internal();

  factory AppLanguage() {
    return _instance;
  }

  AppLanguage._internal();
}
