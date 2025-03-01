part of 'get_favorite_cubit.dart';

@immutable
abstract class GetFavoriteState {}

class GetFavoriteInitial extends GetFavoriteState {}

class GetFavoriteLoading extends GetFavoriteState {}

class GetFavoriteSuccess extends GetFavoriteState {
  final List<dynamic> data;

  GetFavoriteSuccess({required this.data});
}

class GetFavoriteFailure extends GetFavoriteState {}
