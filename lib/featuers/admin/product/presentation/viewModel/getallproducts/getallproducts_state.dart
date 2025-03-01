part of 'getallproducts_cubit.dart';

@immutable
abstract class GetallproductsState {}

class GetallproductsInitial extends GetallproductsState {}

class GetallproductsLoading extends GetallproductsState {}

class GetallproductsSuccess extends GetallproductsState {
  final List<Getallproductsres> products;

  GetallproductsSuccess({required this.products});
}

class GetallproductsFailure extends GetallproductsState {
  final String error;

  GetallproductsFailure({required this.error});
}
