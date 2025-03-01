import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:asroo_app/features/customer/home/data/getOneProductRes.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'getone_state.dart';

class GetoneCubit extends Cubit<GetoneState> {
  GetoneCubit() : super(GetoneInitial());
  Future<void> getOne({required String id}) async {
    emit(GetoneLoading());
    var result = await Apiservice().getOne(id: id);
    result.fold((l) {
      emit(GetoneFailure(error: l.message));
    }, (r) async {
      emit(GetoneSuccess(data: r));
    });
  }
}
