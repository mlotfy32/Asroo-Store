import 'dart:developer';

import 'package:asroo_app/core/utiles/service/push_Notification/firebaseCloudMessaging.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sendnotification_state.dart';

class SendnotificationCubit extends Cubit<SendnotificationState> {
  SendnotificationCubit() : super(SendnotificationInitial());
  sendNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
    emit(SendnotificationLoading());
    try {
      final result = await Firebasecloudmessaging().sendTopicNotification(
          notificationTitle: title,
          notificationBody: body,
          productId: productId);
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
