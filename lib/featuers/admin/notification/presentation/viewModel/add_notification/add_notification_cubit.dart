import 'dart:developer';

import 'package:asroo_app/core/utiles/constant.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/features/admin/notification/data/hive/notificationModel.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'add_notification_state.dart';

class AddNotificationCubit extends Cubit<AddNotificationState> {
  AddNotificationCubit() : super(AddNotificationInitial());
  addNotification(
      {required NotificationModel notificationModel,
      required bool isEdite}) async {
    emit(AddNotificationLoading());
    Box<NotificationModel> notificationBox =
        await Hive.box(Constans.hivenotification);
    try {
      if (isEdite) {
        await notificationBox.add(notificationModel);
        Helper.FlutterToast(title: 'Notification Edited', success: true);

        emit(AddNotificationSuccess());
      } else {
        await notificationBox.add(notificationModel);
        Helper.FlutterToast(title: 'Notification Added', success: true);
        emit(AddNotificationSuccess());
      }
    } catch (e) {
      emit(AddNotificationFailure(errorMessage: e.toString()));
    }
  }
}
