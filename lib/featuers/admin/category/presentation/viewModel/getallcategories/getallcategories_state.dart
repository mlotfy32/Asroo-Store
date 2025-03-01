part of 'getallcategories_cubit.dart';

@immutable
abstract class GetallcategoriesState {}

class GetallcategoriesInitial extends GetallcategoriesState {}

class GetallcategoriesLoading extends GetallcategoriesState {}

class GetallcategoriesSuccess extends GetallcategoriesState {
  final List<Categoriesresponse> categories;

  GetallcategoriesSuccess({required this.categories});
}

class GetallcategoriesEmpty extends GetallcategoriesState {}

class GetallcategoriesFailure extends GetallcategoriesState {
  final String errorMessage;

  GetallcategoriesFailure({required this.errorMessage});
}
