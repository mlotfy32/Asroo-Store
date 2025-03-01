import 'dart:developer';

import 'package:asroo_app/core/utiles/di/injection.dart';
import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:asroo_app/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:asroo_app/core/utiles/shared_pref/shared_pref.dart';
import 'package:asroo_app/features/auth/login/data/model/logIn_response.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> LogIn({required String email, required String pass}) async {
    List isAdmin = [];
    emit(LoginLoading());
    log('$email === $pass');
    var result = await Apiservice().getLogin(email: email, pass: pass);
    result.fold((l) {
      emit(LoginFailed(errorMessage: l.message));
    }, (r) async {
      await SharedPref().setString(PrefsKeys.accessToken, r.access_token);
      await SharedPref().setString(PrefsKeys.refreshToken, r.refresh_token);

      var role = await Apiservice().getUserProfile(token: r.access_token);
      role.fold((l) {
        isAdmin.add(false);
      }, (r) {
        if (r.role == 'admin') {
          isAdmin.add('admin');
        } else
          isAdmin.add('customer');
      });
      emit(LoginSuccess(
          role: isAdmin.first,
          data: r,
          accessToken: r.access_token,
          refreshToken: r.refresh_token));
    });
  }
}
