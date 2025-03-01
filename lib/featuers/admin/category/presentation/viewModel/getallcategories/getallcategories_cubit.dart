import 'dart:developer';

import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:asroo_app/features/admin/category/data/model/categoriesResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'getallcategories_state.dart';

class GetallcategoriesCubit extends Cubit<GetallcategoriesState> {
  GetallcategoriesCubit() : super(GetallcategoriesInitial());
  bool isLoading = true;
  Future<void> getAllCategories() async {
    emit(GetallcategoriesLoading());
    var result = await Apiservice().getAllCategories();
    result.fold((l) {
      log('${l.message}');
      isLoading = false;
      emit(GetallcategoriesFailure(errorMessage: l.message));
    }, (r) async {
      if (r == []) {
        isLoading = false;
        emit(GetallcategoriesEmpty());
      } else
        isLoading = false;
      emit(GetallcategoriesSuccess(categories: r));
    });
  }
}
