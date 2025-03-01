part of 'change_search_state_cubit.dart';

@immutable
abstract class ChangeSearchStateState {}

class ChangeSearchStateInitial extends ChangeSearchStateState {}

class ChangeSearchState extends ChangeSearchStateState {
  final String searchText;

  ChangeSearchState({required this.searchText});
}
