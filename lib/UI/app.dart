import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thikana_ki/cores/blocs/language/language_state.dart';
import 'package:thikana_ki/cores/blocs/theme/theme_state.dart';
import 'package:thikana_ki/cores/utils/language/language_setting.dart';
import 'screens/bottom_navigation/main_navigation.dart';
import '../cores/blocs/bloc.dart';

import '../cores/configs/config.dart';
import 'screens/screen.dart';
import '../cores/utils/language/translate.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
//  final Router route = Router();

  ApplicationBloc _applicationBloc;
  LanguageBloc _languageBloc;
  ThemeBloc _themeBloc;
  AuthBloc _authBloc;
  LoginBloc _loginBloc;

  @override
  void initState() {
    ///Bloc business logic
    _languageBloc = LanguageBloc();
    _themeBloc = ThemeBloc();
    _authBloc = AuthBloc();
    _loginBloc = LoginBloc(authBloc: _authBloc);
    _applicationBloc = ApplicationBloc(
      authBloc: _authBloc,
      themeBloc: _themeBloc,
      languageBloc: _languageBloc,
    );
    super.initState();
  }

  @override
  void dispose() {
    _applicationBloc.close();
    _languageBloc.close();
    _themeBloc.close();
    _authBloc.close();
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>(
          create: (context) => _applicationBloc,
        ),
        BlocProvider<LanguageBloc>(
          create: (context) => _languageBloc,
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => _themeBloc,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => _authBloc,
        ),
        BlocProvider<LoginBloc>(
          create: (context) => _loginBloc,
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, lang) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, theme) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                onGenerateRoute:  Router.generateRoute,
                locale: AppLanguageSetting.defaultLanguage,
                localizationsDelegates: [
                  Translate.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: AppLanguageSetting.supportLanguage,
                home: BlocBuilder<ApplicationBloc, ApplicationState>(
                  builder: (context, app) {
                    if (app is ApplicationSetupCompleted) {
                      return MainNavigation();
                    }
                    if (app is ApplicationIntroView) {
                      return IntroPreview();
                    }
//                    return SplashScreen();
                  return MainNavigation();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
