import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:asroo_app/features/customer/main/data/searchByTitleRes.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_by_name_state.dart';

class SearchByNameCubit extends Cubit<SearchByNameState> {
  SearchByNameCubit() : super(SearchByNameInitial());

  Future<void> searchByName({required String name}) async {
    emit(SearchByNameLoading());
    var result = await Apiservice().searchName(name: name);
    result.fold((l) {
      emit(SearchByNameFailure(error: l.message));
    }, (r) async {
      emit(SearchByNameSuccess(productd: r));
    });
  }
}
