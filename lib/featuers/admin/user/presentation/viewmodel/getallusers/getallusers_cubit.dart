import 'dart:developer';

import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:asroo_app/features/admin/user/data/models/getAllUsersRes.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'getallusers_state.dart';

class GetallusersCubit extends Cubit<GetallusersState> {
  GetallusersCubit() : super(GetallusersInitial());
  Future<void> getAllUsers() async {
    emit(GetallusersLoading());
    var result = await Apiservice().getAllUsers();
    result.fold((l) {
      emit(GetallusersFailure(error: l.message));
    }, (r) async {
      emit(GetallusersSuccess(users: r));
    });
  }

  List<String> hasData = [];
  Future getUser(
      {required List<Getallusersres> data, required String name}) async {
    if (data != []) {
      emit(GetUserLoading());
      for (var element in data) {
        if (element.name == name) {
          emit(GetUserSuccess(user: element));
          hasData.add(name);
          break;
        }
      }
      if (hasData.isEmpty) {
        emit(GetUserFailure(error: 'User not found'));
      }
    }
  }
}
