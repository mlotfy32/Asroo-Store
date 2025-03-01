import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'deleteuser_state.dart';

class DeleteuserCubit extends Cubit<DeleteuserState> {
  DeleteuserCubit() : super(DeleteuserInitial());

  Future<void> deleteUser({required int id}) async {
    emit(DeleteUserLoading());
    var result = await Apiservice().deleteUser(id: id);
    result.fold((l) {
      emit(DeleteUserFailure(error: l.message));
    }, (r) async {
      emit(DeleteUserSuccess());
    });
  }
}
