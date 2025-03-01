part of 'createproduct_cubit.dart';

@immutable
abstract class CreateproductState {}

class CreateproductInitial extends CreateproductState {}

class CreateproductLoading extends CreateproductState {}

class CreateproductSuccess extends CreateproductState {
  // final String imageUrl;
  // final int index;

  CreateproductSuccess();
}

class UploadProductImageLoading extends CreateproductState {
  UploadProductImageLoading();
}

class UploadProductImageSuccess extends CreateproductState {
  final String imageUrl;

  UploadProductImageSuccess({required this.imageUrl});
}

class CreateproductFailure extends CreateproductState {
  final String errorMessage;

  CreateproductFailure({required this.errorMessage});
}

class UploadProductImageFailure extends CreateproductState {
  final String errorMessage;

  UploadProductImageFailure({required this.errorMessage});
}
