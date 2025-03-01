part of 'updatecategory_cubit.dart';

@immutable
abstract class UpdatecategoryState {}

class UpdatecategoryInitial extends UpdatecategoryState {}

class UpdatecategoryLoading extends UpdatecategoryState {}

class UpdatecategorySuccess extends UpdatecategoryState {
  final Updatecategoryresponse response;

  UpdatecategorySuccess({required this.response});
}

class UpdatecategoryFailure extends UpdatecategoryState {
  final String error;

  UpdatecategoryFailure({required this.error});
}
