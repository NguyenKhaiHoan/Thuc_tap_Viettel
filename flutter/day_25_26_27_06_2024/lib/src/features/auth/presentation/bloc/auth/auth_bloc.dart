import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:day_25_26_06_2024/src/features/auth/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<Login>(onLogin);
  }

  Future<FutureOr<void>> onLogin(Login event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 3));
      final user =
          UserEntity(firstName: '', lastName: '', email: '', urlToImage: '');
      emit(AuthSuccessState(user));
    } catch (e) {
      emit(AuthExceptionState(e.toString()));
    }
  }
}
