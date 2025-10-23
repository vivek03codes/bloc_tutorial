import 'package:bloc_tutorial/counter/bloc/auth/auth_event.dart';
import 'package:bloc_tutorial/counter/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
  }

  void _onAuthLoginRequested(AuthLoginRequested event, Emitter emit) async {
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;

      if (password.length < 6) {
        return emit(AuthFailure("Password length should be greater or equal to 6 characters"));
      }

      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthSuccess("$email-$password"));
      });

    } catch (e) {
      return emit(AuthFailure("Something went wrong"));
    }
  }
}