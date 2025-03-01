part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class ImageLoading extends SignupState {}

class ImageSuccess extends SignupState {
  final String imageUrl;

  ImageSuccess({required this.imageUrl});
}

class ImageFailure extends SignupState {
  final String errorMessage;

  ImageFailure({required this.errorMessage});
}

class SignupSuccess extends SignupState {
  final SignupresponseSuccess data;
  final String name;
  final String avatar;
  final String id;
  SignupSuccess(
      {required this.data,
      required this.id,
      required this.name,
      required this.avatar});
}

class SignupFailed extends SignupState {
  final String errorMessage;

  SignupFailed({required this.errorMessage});
}
