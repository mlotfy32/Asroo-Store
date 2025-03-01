import 'dart:developer';

import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'uploadimage_state.dart';

class UploadimageCubit extends Cubit<UploadimageState> {
  UploadimageCubit() : super(UploadimageInitial());
  pickImage({required BuildContext context}) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(UploadimageLoading());
      var result =
          await Apiservice().uploadImage(path: image.path, context: context);
      result.fold((l) {
        emit(UploadimageFailure(errorMessage: l.message));
      }, (r) async {
        log('${r.location}');
        emit(UploadimageSuccess(imagePath: r.location));
      });
    }
  }
}
