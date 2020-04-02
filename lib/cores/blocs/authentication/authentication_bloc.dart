import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import '../../configs/preferences.dart';
import '../../models/model_result_api.dart';
import '../../models/model_user.dart';
import '../../utils/sharedpreferences/preferences.dart';
import '../../api/local_file_api.dart';
import '../../api/http_manager.dart';
import 'authentication_event.dart';
import 'bloc.dart';
import '../../configs/config.dart';

class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(event) async* {
    if (event is AuthenticationCheck) {
      ///Notify state AuthenticationBeginCheck
      yield AuthenticationBeginCheck();
      final hasToken = UtilPreferences.containsKey(Preferences.user);

      if (hasToken) {
        ///Getting data from Storage
        final getUserPreferences = UtilPreferences.getString(
          Preferences.user,
        );
        final user = UserModel.fromJson(jsonDecode(getUserPreferences));
        httpManager.baseOptions.headers["Authorization"] =
            "Bearer " + user.token;
        await Future.delayed(Duration(seconds: 1));
        final ResultApiModel result = await LocalFileApi.validateToken();

        ///Fetch api success
        if (result.success) {
          ///Set user
          Application.user = user;
          yield AuthenticationSuccess();
        } else {
          ///Fetch api fail
          ///
          ///Delete user when can't verify token
          await UtilPreferences.remove(Preferences.user);

          ///Notify loading to UI
          yield AuthenticationFail();
        }
      } else {
        ///Notify loading to UI
        yield AuthenticationFail();
      }
    }

    if (event is AuthenticationSave) {
      ///Save to Storage phone
      final savePreferences = await UtilPreferences.setString(
        Preferences.user,
        jsonEncode(event.user.toJson()),
      );

      ///Check result save user
      if (savePreferences) {
        ///Notify loading to UI
        yield AuthenticationSuccess();
      } else {
        final String message = "Cannot save user data to storage phone";
        throw Exception(message);
      }
    }

    if (event is AuthenticationClear) {
      ///Delete user
      final deletePreferences = await UtilPreferences.remove(Preferences.user);

      ///Check result delete user
      if (deletePreferences) {
        yield AuthenticationFail();
      } else {
        final String message = "Cannot delete user data to storage phone";
        throw Exception(message);
      }
    }
  }
}
