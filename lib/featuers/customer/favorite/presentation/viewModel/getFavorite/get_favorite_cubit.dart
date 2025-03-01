import 'dart:developer';

import 'package:asroo_app/core/utiles/constant.dart';
import 'package:asroo_app/features/customer/favorite/data/favorite_Model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'get_favorite_state.dart';

class GetFavoriteCubit extends Cubit<GetFavoriteState> {
  GetFavoriteCubit() : super(GetFavoriteInitial());
  getFavoriteKeys() async {
    emit(GetFavoriteLoading());
    try {
      List<dynamic> dataList = [];
      Box<FavoriteModel> favoriteBox = await Hive.box(Constans.hiveFavorite);
      List<FavoriteModel> favorite = await favoriteBox.values.toList();

      for (var element in favorite) {
        dataList.add(element.id);
      }
      emit(GetFavoriteSuccess(data: dataList));
    } catch (e) {
      log('Error in Database: $e');
      emit(GetFavoriteFailure());
    }
  }

  getFavorite() async {
    emit(GetFavoriteLoading());
    try {
      Box<FavoriteModel> favoriteBox = await Hive.box(Constans.hiveFavorite);
      List<FavoriteModel> data = await favoriteBox.values.toList();

      emit(GetFavoriteSuccess(data: data));
    } catch (e) {
      log('Error in Database: $e');
      emit(GetFavoriteFailure());
    }
  }
}
