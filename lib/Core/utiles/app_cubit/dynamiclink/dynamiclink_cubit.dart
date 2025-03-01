import 'package:asroo_app/core/utiles/service/dynamicLink/dynamicLink.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:share_plus/share_plus.dart';
part 'dynamiclink_state.dart';

class DynamiclinkCubit extends Cubit<DynamiclinkState> {
  DynamiclinkCubit() : super(DynamiclinkInitial());

  Future<void> sendDynamicLink(
      {required context,
      required int productId,
      required String title,
      required List imageUrl,
      required int price,
      required String description,
      required bool isFavorite}) async {
    emit(DynamiclinkLoading());
    await DynamicLink()
        .generateProductLink(
            productId: productId,
            title: title,
            imageUrl: imageUrl,
            price: price,
            description: description,
            isFavorite: isFavorite)
        .then(Share.share);
    emit(DynamiclinkSuccess());
  }
}
