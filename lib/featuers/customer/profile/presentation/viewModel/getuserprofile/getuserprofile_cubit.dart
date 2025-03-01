import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:asroo_app/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:asroo_app/core/utiles/shared_pref/shared_pref.dart';
import 'package:asroo_app/features/customer/profile/data/models/preofileResponse.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'getuserprofile_state.dart';

class GetuserprofileCubit extends Cubit<GetuserprofileState> {
  GetuserprofileCubit() : super(GetuserprofileInitial());

  Future<void> getUserProfile() async {
    emit(GetuserprofileLiading());
    var token = SharedPref().getString(PrefsKeys.accessToken);
    var result = await Apiservice().getUserProfile(token: token!);
    result.fold((l) {
      emit(GetuserprofileFailure(error: l.message));
    }, (r) async {
      emit(GetuserprofileSuccess(userprofile: r));
    });
  }
}
