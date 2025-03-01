part of 'search_bt_price_cubit.dart';

@immutable
abstract class SearchBtPriceState {}

class SearchBtPriceInitial extends SearchBtPriceState {}

class SearchByPriceLoading extends SearchBtPriceState {}

class SearchByPriceSuccess extends SearchBtPriceState {
  final List<Searchbypriceres> productd;

  SearchByPriceSuccess({required this.productd});
}

class SearchByPriceFailure extends SearchBtPriceState {
  final String error;

  SearchByPriceFailure({required this.error});
}
