part of 'deletecategory_cubit.dart';

@immutable
abstract class DeletecategoryState {}

class DeletecategoryInitial extends DeletecategoryState {}

class DeletecategoryLoading extends DeletecategoryState {}

class DeletecategorySuccess extends DeletecategoryState {
  final bool isDeleted;

  DeletecategorySuccess({required this.isDeleted});
}

class DeletecategoryFailure extends DeletecategoryState {
  final String errorMessage;

  DeletecategoryFailure({required this.errorMessage});
}
