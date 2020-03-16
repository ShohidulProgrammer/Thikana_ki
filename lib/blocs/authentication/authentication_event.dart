import 'package:thikana_ki/models/model_user.dart';

abstract class AuthenticationEvent {}

class AuthenticationCheck extends AuthenticationEvent {}

class AuthenticationSave extends AuthenticationEvent {
  final UserModel user;

  AuthenticationSave(this.user);
}

class AuthenticationClear extends AuthenticationEvent {}
