part of 'createcategory_cubit.dart';

@immutable
abstract class CreatecategoryState {}

class CreatecategoryInitial extends CreatecategoryState {}

class CreatecategoryLoading extends CreatecategoryState {}

class CreatecategorySuccess extends CreatecategoryState {}

class CreatecategoryFailure extends CreatecategoryState {
  final String errorMessage;

  CreatecategoryFailure({required this.errorMessage});
}
