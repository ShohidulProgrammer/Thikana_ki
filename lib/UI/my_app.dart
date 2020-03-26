import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../cores/configs/language.dart';
import '../cores/configs/router/router_path_constants.dart';
import '../cores/configs/router/routes.dart';
import '../cores/configs/theme/theme.dart';
import '../cores/utils/language/translate.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      title: 'Thikana Ki',
      locale: AppLanguage.defaultLanguage,
      localizationsDelegates: [
        Translate.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLanguage.supportLanguage,
      onGenerateRoute: Router.generateRoute,
      initialRoute: splashRoute,
    );
  }
}

//Color(0xff069be5),
//Color(0xffe6e7e8),