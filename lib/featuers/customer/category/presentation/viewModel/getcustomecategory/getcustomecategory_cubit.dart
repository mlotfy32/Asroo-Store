import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:asroo_app/features/customer/category/presentation/data/getCategoryRes.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'getcustomecategory_state.dart';

class GetcustomecategoryCubit extends Cubit<GetcustomecategoryState> {
  GetcustomecategoryCubit() : super(GetcustomecategoryInitial());
  Future<void> getCategore({required int id}) async {
    emit(GetcustomecategoryLoading());
    var result = await Apiservice().getCategory(id: id);
    result.fold((l) {
      emit(GetcustomecategoryFailure(error: l.message));
    }, (r) async {
      emit(GetcustomecategorySuccess(categories: r));
    });
  }
}
