import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:asroo_app/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:asroo_app/core/utiles/shared_pref/shared_pref.dart';
import 'package:asroo_app/features/auth/signup/data/model/signupResponse.dart';
import 'package:asroo_app/main.dart';
import 'package:bloc/bloc.dart';
import 'dart:developer';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  Future<void> SignUp(
      {required String email,
      required String pass,
      required String name,
      required String imageUrl}) async {
    emit(SignupLoading());
    var result = await Apiservice()
        .getSigniUp(email: email, pass: pass, name: name, avatar: imageUrl);
    result.fold((l) {
      emit(SignupFailed(errorMessage: l.message));
    }, (r) async {
      await SharedPref().setString(PrefsKeys.id, r.id);
      log(imageUrl.toString());
      emit(SignupSuccess(data: r, name: r.name, id: r.id, avatar: r.avatar));
    });
  }

  uploadImage({required String location}) async {
    emit(ImageLoading());
    Helper.customeLoadingSnac(title: 'Uploading User Image');

    try {
      SharedPref().setString(PrefsKeys.userImage, location);
      emit(ImageSuccess(imageUrl: location));
    } on Exception catch (e) {
      emit(ImageFailure(errorMessage: e.toString()));
    }
  }

  // Future<void> prof({
  //   required String token,
  // }) async {
  //   emit(SignupLoading());
  //   // var result = await getIt.get<Apiservice>().getProfile(token: token);
  //   result.fold((l) {
  //     emit(SignupFailed(errorMessage: l.message));
  //   }, (r) {
  //     emit(SignupSuccess(
  //         role: r.role,
  //         data: r,
  //         name: r.name,
  //         email: r.email,
  //         pass: r.password,
  //         avatar: r.avatar));
  //   });
  // }
}
