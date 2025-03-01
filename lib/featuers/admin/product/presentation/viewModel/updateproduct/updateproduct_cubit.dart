import 'dart:developer';

import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'updateproduct_state.dart';

class UpdateproductCubit extends Cubit<UpdateproductState> {
  UpdateproductCubit() : super(UpdateproductInitial());

  Future<void> updateProduct(
      {required String id,
      required String title,
      required String imageUrl,
      required String description,
      required int price}) async {
    emit(UpdateproductLoading());
    log('id= $id, title= $title, imageUrl= $imageUrl, description=$description, price= $price');
    var result = await Apiservice().updateProduct(
        id: id,
        title: title,
        url: imageUrl,
        price: price,
        description: description);
    result.fold((l) {
      emit(UpdateproductFailure(errorMessage: l.message));
    }, (r) async {
      emit(UpdateproductSuccess());
    });
  }
}
