part of 'uploadimage_cubit.dart';

@immutable
abstract class UploadimageState {}

class UploadimageInitial extends UploadimageState {}

class UploadimageLoading extends UploadimageState {}

class UploadimageSuccess extends UploadimageState {
  final String imagePath;

  UploadimageSuccess({required this.imagePath});
}

class UploadimageFailure extends UploadimageState {
  final String errorMessage;

  UploadimageFailure({required this.errorMessage});
}
