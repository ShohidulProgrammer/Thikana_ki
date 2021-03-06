import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/list/app_list_title.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/custom_text_input_field.dart';
import 'package:thikana_ki/cores/utils/language/language_setting.dart';
import '../../../../cores/blocs/language/language_event.dart';
import '../../../../cores/blocs/language/language_state.dart';
import '../../../../cores/utils/import_utility_path.dart';
import '../../../../cores/blocs/bloc.dart';

class LanguageSetting extends StatefulWidget {
  LanguageSetting({Key key}) : super(key: key);

  @override
  _LanguageSettingState createState() {
    return _LanguageSettingState();
  }
}

class _LanguageSettingState extends State<LanguageSetting> {
  LanguageBloc _languageBloc;
  final _textLanguageController = TextEditingController();
  bool _loading = false;

  List<Locale> _listLanguage = AppLanguageSetting.supportLanguage;
  Locale _languageSelected = AppLanguageSetting.defaultLanguage;

  @override
  void initState() {
    _languageBloc = BlocProvider.of<LanguageBloc>(context);
    super.initState();
  }

  ///On filter language
  void _onFilter(String text) {
    if (text.isEmpty) {
      setState(() {
        _listLanguage = AppLanguageSetting.supportLanguage;
      });
      return;
    }
    setState(() {
      _listLanguage = _listLanguage.where(((item) {
        return UtilLanguageName.getGlobalLanguageName(item.languageCode)
            .toUpperCase()
            .contains(text.toUpperCase());
      })).toList();
    });
  }

  ///On change language
  Future<void> _changeLanguage() async {
    InputFocusChanger.hiddenKeyboard(context);
    setState(() {
      _loading = true;
    });
    _languageBloc.add(
      ChangeLanguage(_languageSelected),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Translate.of(context).translate('change_language')),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
                bottom: 15,
              ),
              child: CustomTextInputField(
                hintText: Translate.of(context).translate('search'),
                icon: Icon(Icons.clear),
                controller: _textLanguageController,
                onChanged: _onFilter,
                onSubmitted: _onFilter,
                onTapIcon: () async {
                  await Future.delayed(Duration(milliseconds: 100));
                  _textLanguageController.clear();
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  final item = _listLanguage[index];
                  final trailing = item == _languageSelected
                      ? Icon(
                          Icons.check,
                          color: Theme.of(context).primaryColor,
                        )
                      : null;
                  return AppListItem(
                    title: UtilLanguageName.getGlobalLanguageName(
                      item.languageCode,
                    ),
                    textStyle: item == _languageSelected
                        ? Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: Theme.of(context).primaryColor)
                        : null,
                    trailing: trailing,
                    onPressed: () {
                      setState(() {
                        _languageSelected = item;
                      });
                    },
                  );
                },
                itemCount: _listLanguage.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
                bottom: 15,
              ),
              child: BlocListener<LanguageBloc, LanguageState>(
                listener: (context, state) {
                  if (state is LanguageUpdated) {
                    setState(() {
                      _loading = false;
                    });
                  }
                },
                child: AppButton(
                  onPressed: () {
                    _changeLanguage();
                  },
                  text: Translate.of(context).translate('confirm'),
                  loading: _loading,
                  disableTouchWhenLoading: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
