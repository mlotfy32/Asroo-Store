import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'deletecategory_state.dart';

class DeletecategoryCubit extends Cubit<DeletecategoryState> {
  DeletecategoryCubit() : super(DeletecategoryInitial());
  Future<void> deleteCategory(
      {required String id, required String delete}) async {
    emit(DeletecategoryLoading());
    var result = await Apiservice().deleteCategory(id: id, delete: delete);
    result.fold((l) {
      emit(DeletecategoryFailure(errorMessage: l.message));
    }, (r) async {
      emit(DeletecategorySuccess(isDeleted: r.deleteCategory));
    });
  }
}
