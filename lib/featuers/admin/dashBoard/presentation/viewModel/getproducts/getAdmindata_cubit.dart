import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'getAdmindata_state.dart';

List<int> data = [];

class GetadmindataCubit extends Cubit<GetAdminDataState> {
  GetadmindataCubit() : super(GetAdminDataInitial());
  Future<void> getProductslen() async {
    emit(GetAdminDataLoading());
    var result = await Apiservice().getProductsCount();
    result.fold((l) {
      emit(GetAdminDataFailure(errorMessage: l.message));
    }, (r) async {
      data.add(r.adminlen);
      getCategorylen();
    });
  }

  Future<void> getCategorylen() async {
    var result = await Apiservice().getCategoriesCount();
    result.fold((l) {
      emit(GetAdminDataFailure(errorMessage: l.message));
    }, (r) async {
      data.add(r.adminlen);
      getUserslen();
    });
  }

  Future<void> getUserslen() async {
    var result = await Apiservice().getUsersCount();
    result.fold((l) {
      emit(GetAdminDataFailure(errorMessage: l.message));
    }, (r) async {
      data.add(r.adminlen);
    });
    emit(GetAdminDataSuccess(adminData: data));
  }
}
