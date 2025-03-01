import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:asroo_app/features/customer/main/data/searchByPriceRes.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_bt_price_state.dart';

class SearchBtPriceCubit extends Cubit<SearchBtPriceState> {
  SearchBtPriceCubit() : super(SearchBtPriceInitial());

  Future<void> searchByPrice({required String min, required String max}) async {
    emit(SearchByPriceLoading());
    var result = await Apiservice().searchPrice(min: min, max: max);
    result.fold((l) {
      emit(SearchByPriceFailure(error: l.message));
    }, (r) async {
      emit(SearchByPriceSuccess(productd: r));
    });
  }
}
