part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseSuccess data;
  final String accessToken;
  final String refreshToken;
  final String role;

  LoginSuccess(
      {required this.accessToken,
      required this.role,
      required this.refreshToken,
      required this.data});
}

class LoginFailed extends LoginState {
  final String errorMessage;

  LoginFailed({required this.errorMessage});
}
