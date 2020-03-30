import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:thikana_ki/cores/utils/language/language_setting.dart';
import 'package:thikana_ki/cores/utils/sharedpreferences/preferences.dart';
import 'bloc.dart';
import '../../configs/config.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  @override
  LanguageState get initialState => InitialLanguageState();

  @override
  Stream<LanguageState> mapEventToState(event) async* {
    if (event is ChangeLanguage) {
      if (event.locale == AppLanguageSetting.defaultLanguage) {
        yield LanguageUpdated();
      } else {
        yield LanguageUpdating();
        AppLanguageSetting.defaultLanguage = event.locale;

        ///Preference save
        UtilPreferences.setString(
          Preferences.language,
          event.locale.languageCode,
        );

        yield LanguageUpdated();
      }
    }
  }
}
