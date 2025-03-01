part of 'addtofavorite_cubit.dart';

@immutable
abstract class AddtofavoriteState {}

class AddtofavoriteInitial extends AddtofavoriteState {}

class AddtofavoriteSuccess extends AddtofavoriteState {
  final List<dynamic> data;

  AddtofavoriteSuccess({required this.data});
}

class AddtofavoriteLoading extends AddtofavoriteState {}

class AddtofavoriteFailure extends AddtofavoriteState {}
