part of 'updateproduct_cubit.dart';

@immutable
abstract class UpdateproductState {}

class UpdateproductInitial extends UpdateproductState {}

class UpdateproductLoading extends UpdateproductState {}

class UpdateproductSuccess extends UpdateproductState {}

class UpdateproductFailure extends UpdateproductState {
  final String errorMessage;

  UpdateproductFailure({required this.errorMessage});
}
