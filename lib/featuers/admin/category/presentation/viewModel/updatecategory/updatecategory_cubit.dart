import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:asroo_app/features/admin/category/data/model/updateCategoryResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'updatecategory_state.dart';

class UpdatecategoryCubit extends Cubit<UpdatecategoryState> {
  UpdatecategoryCubit() : super(UpdatecategoryInitial());
  Future<void> updateCategory({
    required String id,
    required String name,
    required String imageUrl,
  }) async {
    emit(UpdatecategoryLoading());
    var result =
        await Apiservice().updateCategory(id: id, name: name, url: imageUrl);
    result.fold((l) {
      emit(UpdatecategoryFailure(error: l.message));
    }, (r) async {
      emit(UpdatecategorySuccess(response: r));
    });
  }
}
