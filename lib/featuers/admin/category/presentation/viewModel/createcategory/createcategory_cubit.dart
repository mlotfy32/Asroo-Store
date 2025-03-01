import 'dart:developer';

import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'createcategory_state.dart';

class CreatecategoryCubit extends Cubit<CreatecategoryState> {
  CreatecategoryCubit() : super(CreatecategoryInitial());
  Future<void> createCategory(
      {required String name, required String url}) async {
    emit(CreatecategoryLoading());
    var result = await Apiservice().createCategory(name: name, url: url);
    result.fold((l) {
      emit(CreatecategoryFailure(errorMessage: l.message));
    }, (r) async {
      emit(CreatecategorySuccess());
    });
  }
}
