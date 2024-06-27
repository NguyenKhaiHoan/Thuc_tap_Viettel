part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {
  bool _isLoaderVisible = false;
}

class AuthSuccessState extends AuthState {
  final UserEntity user;

  AuthSuccessState(this.user);
}

class AuthExceptionState extends AuthState {
  final String exception;

  AuthExceptionState(this.exception);
}
