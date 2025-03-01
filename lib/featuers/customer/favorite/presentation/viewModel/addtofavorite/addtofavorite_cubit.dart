import 'dart:developer';
import 'package:asroo_app/core/utiles/constant.dart';
import 'package:asroo_app/features/customer/favorite/data/favorite_Model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
part 'addtofavorite_state.dart';

class AddtofavoriteCubit extends Cubit<AddtofavoriteState> {
  AddtofavoriteCubit() : super(AddtofavoriteInitial());

  addToFavorite(
      {required FavoriteModel favorite, required List<dynamic> oldData}) async {
    try {
      Box<FavoriteModel> myFavoriteBox = await Hive.box(Constans.hiveFavorite);
      // await keys.clear();
      List<FavoriteModel> data = await myFavoriteBox.values.toList();
      log('oldFavoritBox = ${oldData}');

      if (oldData.contains(favorite.id)) {
        for (var element in data) {
          if (element.id == favorite.id) {
            await element.delete();
            log('favorite.delete');
          }
        }
      } else {
        await myFavoriteBox.add(favorite);
        log('addeds(favorite) ${favorite.id}');
      }

      List<FavoriteModel> newData = await myFavoriteBox.values.toList();
      List keys = [];
      for (var element in newData) {
        keys.add(element.id);
      }
      log('newData = $keys');

      emit(AddtofavoriteSuccess(data: keys));
    } catch (e) {
      log('Error in add to favorite: $e');
      emit(AddtofavoriteFailure());
    }
  }
}
