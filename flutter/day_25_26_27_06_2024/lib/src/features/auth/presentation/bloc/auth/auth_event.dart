part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class Login extends AuthEvent {
  const Login();
}
