part of 'getone_cubit.dart';

@immutable
abstract class GetoneState {}

class GetoneInitial extends GetoneState {}

class GetoneLoading extends GetoneState {}

class GetoneSuccess extends GetoneState {
  final Getoneproductres data;

  GetoneSuccess({required this.data});
}

class GetoneFailure extends GetoneState {
  final String error;

  GetoneFailure({required this.error});
}
