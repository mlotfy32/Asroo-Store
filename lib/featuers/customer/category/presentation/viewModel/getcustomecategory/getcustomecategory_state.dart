part of 'getcustomecategory_cubit.dart';

@immutable
abstract class GetcustomecategoryState {}

class GetcustomecategoryInitial extends GetcustomecategoryState {}

class GetcustomecategoryLoading extends GetcustomecategoryState {}

class GetcustomecategorySuccess extends GetcustomecategoryState {
  final List<Categoryres> categories;

  GetcustomecategorySuccess({required this.categories});
}

class GetcustomecategoryFailure extends GetcustomecategoryState {
  final String error;

  GetcustomecategoryFailure({required this.error});
}
