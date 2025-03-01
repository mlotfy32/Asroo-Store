import 'package:asroo_app/core/utiles/service/dio/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
part 'createproduct_state.dart';

class CreateproductCubit extends Cubit<CreateproductState> {
  CreateproductCubit() : super(CreateproductInitial());

  Future<void> createProduct(
      {required String image,
      required String title,
      required String description,
      required int price,
      required String categoryId}) async {
    emit(CreateproductLoading());
//TODO: Handle categoryId
    var result = await Apiservice().craeteProducts(
        categoryId: 2,
        image: image,
        title: title,
        description: description,
        price: price);
    result.fold((l) {
      emit(CreateproductFailure(errorMessage: l.message));
    }, (r) async {
      emit(CreateproductSuccess());
    });
  }

  pickImage({required BuildContext context}) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(UploadProductImageLoading());
      var result =
          await Apiservice().uploadImage(path: image.path, context: context);
      result.fold((l) {
        emit(UploadProductImageFailure(errorMessage: l.message));
      }, (r) async {
        emit(UploadProductImageSuccess(imageUrl: r.location));
      });
    }
  }
}
