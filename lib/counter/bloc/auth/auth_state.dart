sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final String uuid;

  AuthSuccess(this.uuid);
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}

class AuthLoading extends AuthState {}