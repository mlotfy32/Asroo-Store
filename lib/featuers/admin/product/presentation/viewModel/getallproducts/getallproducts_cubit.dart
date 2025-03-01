import 'dart:developer';

import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:asroo_app/features/admin/product/data/models/getAllProductsRes.dart';
import 'package:bloc/bloc.dart';
import 'package:get/route_manager.dart';
import 'package:meta/meta.dart';

part 'getallproducts_state.dart';

class GetallproductsCubit extends Cubit<GetallproductsState> {
  GetallproductsCubit() : super(GetallproductsInitial());
  Future<void> getAllProducts() async {
    emit(GetallproductsLoading());
    var result = await Apiservice().getAllProducts();
    result.fold((l) {
      emit(GetallproductsFailure(error: l.message));
    }, (r) async {
      emit(GetallproductsSuccess(products: r));
    });
  }
}
