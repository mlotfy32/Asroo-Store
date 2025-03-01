part of 'search_by_name_cubit.dart';

@immutable
abstract class SearchByNameState {}

class SearchByNameInitial extends SearchByNameState {}

class SearchByNameLoading extends SearchByNameState {}

class SearchByNameSuccess extends SearchByNameState {
  final List<Searchbytitleres> productd;

  SearchByNameSuccess({required this.productd});
}

class SearchByNameFailure extends SearchByNameState {
  final String error;

  SearchByNameFailure({required this.error});
}
